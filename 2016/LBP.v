
`timescale 1ns/10ps
module LBP ( clk, reset, gray_addr, gray_req, gray_ready, gray_data, lbp_addr, lbp_valid, lbp_data, finish);
input   	clk;
input   	reset;
output  reg [13:0] 	gray_addr;
output  reg       	gray_req;
input   	gray_ready;
input   [7:0] 	gray_data;
output  reg [13:0] 	lbp_addr;
output  reg	lbp_valid;
output  reg [7:0] 	lbp_data;
output  reg	finish;
//====================================================================
reg [7:0] buffer;
reg [7:0] center;
reg flag;
reg [2:0] state;
reg [3:0] count;

localparam LOAD_DATA = 0;
localparam PROCESS = 1;
localparam FINISH = 2;

always@(gray_addr) begin
	if(gray_addr < 128) flag = 1;
	else if(gray_addr[6:0] == 7'b0000000 || gray_addr[6:0] == 7'b1111111) flag = 1;
	else flag = 0;
end

always@(posedge clk or posedge reset) begin
	if(reset) begin
		gray_addr <= 0;
		gray_req <= 0;
		lbp_addr <= 0;
		lbp_data <= 0;
		lbp_valid <= 0;
		finish <= 0;
		state <= 0;
		count <= 0;
	end
	else begin
		case(state)
			LOAD_DATA: begin
				if(flag) begin
					gray_addr <= gray_addr+1;
				end
				else begin
					state <= state+1;
					gray_req <= 1;
				end
			end
			
			PROCESS: begin
				case(count)
					0: begin
						center <= gray_data;
						gray_addr <= gray_addr-129;
						count <= count+1;
					end
					1: begin
						if(gray_data<center)
							buffer <= 0;
						else begin
							buffer <= 1;
						end
						gray_addr <= gray_addr+1;
						count <= count+1;
					end
					2: begin
						if(gray_data<center) begin
						end
						else begin
							buffer[1] <= 1'b1;
						end
						gray_addr <= gray_addr+1;
						count <= count+1;
					end
					3: begin
						if(gray_data<center) begin
						end
						else begin
							buffer[2] <= 1'b1;
						end
						gray_addr <= gray_addr+126;
						count <= count+1;
					end
					4: begin
						if(gray_data<center) begin
						end
						else begin
							buffer[3] <= 1'b1;
						end
						gray_addr <= gray_addr+2;
						count <= count+1;
					end
					5: begin
						if(gray_data<center) begin
						end
						else begin
							buffer[4] <= 1'b1;
						end
						gray_addr <= gray_addr+126;
						count <= count+1;
					end
					6: begin
						if(gray_data<center) begin
						end
						else begin
							buffer[5] <= 1'b1;
						end
						gray_addr <= gray_addr+1;
						count <= count+1;
					end
					7: begin
						if(gray_data<center) begin
						end
						else begin
							buffer[6] <= 1'b1;
						end
						gray_addr <= gray_addr+1;
						count <= count+1;
					end
					8: begin
						if(gray_data<center)
							lbp_data <= buffer;
						else
							lbp_data <= (buffer+8'b10000000);
						
						lbp_valid <= 1;
						lbp_addr <= gray_addr-129;
						gray_req <= 0;
						count <= 0;
						gray_addr <= gray_addr-128;
						if(gray_addr == 16383) state <= state+1;
						else state <= state-1;
					end
					default: begin
						
					end
				endcase
			end
			
			FINISH: finish <= 1;
			default: begin
			end
		endcase
	end
end

always@(*) begin
	
end

endmodule

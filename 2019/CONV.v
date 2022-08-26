
`timescale 1ns/10ps

module  CONV(
	input		clk,
	input		reset,
	output reg		busy,	
	input		ready,	
			
	output reg		[11:0] iaddr,
	input		[19:0] idata,	
	
	output reg	 	cwr,
	output reg 	 	[11:0] caddr_wr,
	output reg	 	[19:0] cdata_wr,
	
	output reg	 	crd,
	output reg	 	[11:0] caddr_rd,
	input	 	[19:0] cdata_rd,
	
	output reg	 	[2:0] csel
	);

reg [11:0] iaddr_temp;
reg [5:0] count;
reg [2:0] state;
reg [11:0] maxpool_index;
reg [39:0] temp, kernel;
reg [19:0] max;
reg flag;
reg [0:7] addr_flag;

wire [39:0] mul;

assign mul = idata * kernel;

localparam LAYER0_READ = 0;
localparam LAYER0_WRITE = 1;
localparam LAYER1_READ = 2;
localparam LAYER1_WRITE = 3;

always@(iaddr_temp) begin
	
	if(!(|iaddr_temp)) begin
		addr_flag = 8'b00001011;
	end
	else if(iaddr_temp == 63) begin
		addr_flag = 8'b00010110;
	end
	else if(iaddr_temp == 4032) begin
		addr_flag = 8'b01101000;
	end
	else if(iaddr_temp == 4095) begin
		addr_flag = 8'b11010000;
	end
	// up
	else if(iaddr_temp<63) begin
		addr_flag = 8'b00011111;
	end
	// left
	else if(!(|iaddr_temp[5:0])) begin
		addr_flag = 8'b01101011;
	end
	// right
	else if(&iaddr_temp[5:0]) begin
		addr_flag = 8'b11010110;
	end
	// down
	else if(iaddr_temp>4032) begin
		addr_flag = 8'b11111000;
	end
	// normal
	else begin
		addr_flag = 8'b11111111;
	end
	
	// maxpool index
	maxpool_index = (iaddr_temp<<1)  + {iaddr_temp[11:5], 6'b000000};	// maxpool_index = 2*iaddr_temp + 64*iaddr_temp[11:5];
end

always@(posedge clk or posedge reset) begin
	if(reset) begin
		busy <= 0;
		iaddr <= 0;
		kernel <= 0;
		cwr <= 0;
		crd <= 0;
		caddr_rd <= 0;
		csel <= 0;
		state <= 0;
		count <= 0;
		iaddr_temp <= 0;
		flag <= 0;
	end
	else begin
		
		if(ready)
			busy <= 1'b1;
		else begin
			case(state)
				LAYER0_READ: begin
					case(count)
						0: begin
							if(addr_flag[0]) begin
								temp <= mul + 40'h01310_0000;
							end
							else begin
								temp <= 40'h01310_0000;
							end
							count <= count+1;
							
						end
						1: begin
							kernel <= 40'h092d5;
							iaddr <= iaddr+1;
							count <= count+1;
						end
						
						2: begin
							if(addr_flag[1]) begin
								temp <= temp + mul;
							end
							count <= count+1;
						end
						3: begin
							
							kernel <= 40'h06d43;
							iaddr <= iaddr+1;
							count <= count+1;
						end
						
						4: begin
							if(addr_flag[2]) begin
								temp <= temp + mul;
							end
							count <= count+1;
						end
						5: begin
							kernel <= 40'h01004;
							iaddr <= iaddr+62;
							count <= count+1;
						end
						
						6: begin
							if(addr_flag[3]) begin
								temp <= temp + mul;
							end
							count <= count+1;
						end
						7: begin
							kernel <= 40'b0000_0111_0000_1000_1111;
							iaddr <= iaddr+1;
							count <= count+1;
						end
						
						8: begin
							temp <= temp - mul;
							count <= count+1;
						end
						9: begin
							kernel <= 40'b0000_1001_0001_1010_1100;
							iaddr <= iaddr+1;
							count <= count+1;
						end
						
						10: begin
							if(addr_flag[4]) begin
								temp <= temp - mul;
							end
							count <= count+1;
						end
						11: begin
							kernel <= 40'b0000_0101_1001_0010_1001;
							iaddr <= iaddr+62;
							count <= count+1;
						end
						
						12: begin
							if(addr_flag[5]) begin
								temp <= temp - mul;
							end
							count <= count+1;
						end
						13: begin
							kernel <= 40'b0000_0011_0111_1100_1100;
							iaddr <= iaddr+1;
							count <= count+1;
						end
						
						14: begin
							if(addr_flag[6]) begin
								temp <= temp - mul;
							end
							count <= count+1;
						end
						15: begin
							kernel <= 40'b0000_0101_0011_1110_0111;
							iaddr <= iaddr+1;
							count <= count+1;
						end
						
						16: begin
							if(addr_flag[7]) begin
								temp <= temp - mul;
							end
							count <= count+1;
						end
						default: begin
							kernel <= 40'h0a89e;
							iaddr_temp <= iaddr_temp+1;
							state <= state+1;
							count <= 0;
							iaddr <= iaddr_temp-64;
						end
					endcase
				end
				
				LAYER0_WRITE: begin
					
					//////
					csel <= 3'b001;
					cwr <= 1;
					caddr_wr <= iaddr_temp-1;
					if(temp[39]) begin	// ReLU
						cdata_wr <= 0;
					end
					else begin
						if(temp[15]) cdata_wr <= temp[35:16]+1;
						else cdata_wr <= temp[35:16];
					end
					if(!iaddr_temp) begin
						state <= state+1;
						crd <= 1;
						caddr_rd <= maxpool_index;
					end
					else state <= state-1;
					
				end
				
				LAYER1_READ : begin
					csel <= 3'b001;
					case(count)
						0: begin
							max <= cdata_rd;
							caddr_rd <= caddr_rd+1;
							count <= count+1;
						end
						1: begin
							if(cdata_rd > max) max <= cdata_rd;
							caddr_rd <= caddr_rd+63;
							count <= count+1;
						end
						2: begin
							if(cdata_rd > max) max <= cdata_rd;
							caddr_rd <= caddr_rd+1;
							count <= count+1;
						end
						default: begin
							if(cdata_rd > max) max <= cdata_rd;
							iaddr_temp <= iaddr_temp+1;
							state <= state+1;
							count <= 0;
						end
					endcase
				end
				
				LAYER1_WRITE : begin
					if(!flag) begin
						caddr_rd <= maxpool_index;
						csel <= 3'b011;
						cwr <= 1;
						caddr_wr <= iaddr_temp-1;
						cdata_wr <= max;
						flag <= 1;
					end
					else begin
						flag <= 0;
						csel <= 3'b001;
						cwr <= 0;
						if(iaddr_temp == 1024) state <= state+1;
						else state <= state-1;
					end
				end
				
				default : begin
					busy <= 0;
				end
				
			endcase
		end
	end
	
end

endmodule
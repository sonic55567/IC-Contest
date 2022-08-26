module DT(
	input 			clk, 
	input			reset,
	output	reg		done ,
	output	reg		sti_rd ,
	output	reg 	[9:0]	sti_addr ,
	input		[15:0]	sti_di,
	output	reg		res_wr ,
	output	reg		res_rd ,
	output	reg 	[13:0]	res_addr ,
	output	reg 	[7:0]	res_do,
	input		[7:0]	res_di
	);

reg [1:0] state;
reg [3:0] count;

localparam LABLE = 2'b00;
localparam FORWARD_PASS = 2'b01;
localparam BACKWARD_PASS = 2'b11;
localparam FINISH = 2'b10;


always@(posedge clk or negedge reset) begin
	if(!reset) begin
		done <= 0;
		sti_rd <= 1;
		sti_addr <= 8;
		res_wr <= 1;
		res_rd <= 1;
		res_addr <= 127;
		res_do <= 0;
		state <= LABLE;
		count <= 0;
	end
	else begin
		case(state)
			LABLE: begin
				res_wr <= 1;
				sti_rd <= 1;
				res_rd <= 1;
				res_do <= sti_di[15-count];
				res_addr <= res_addr+1;
				count <= count+1;
				if(&count) begin
					sti_addr <= sti_addr+1;
					if(&sti_addr) begin
						state[0] <= 1;
						res_addr <= 0;
					end
				end
			end
			
			FORWARD_PASS: begin
				case(count) 
					// LOAD_LABLE
					// FORWARD_PASS
					4'b0000: begin
						res_wr <= 0;
						if(res_di) begin
							res_addr <= res_addr-129;
							count[0] <= 1;
						end
						else begin
							if(res_addr == 16256) begin
								// go to BACKWARD_PASS
								state[1] <= 1;
							end
							res_do[4:0] <= 0;
							res_addr <= res_addr+1;
						end
					end
					4'b0001: begin
						res_wr <= 0;
						res_do[4:0] <= res_di[4:0]<res_do[4:0] ? res_di[4:0] : res_do[4:0];
						res_addr <= res_addr+1;
						count[1] <= 1;
					end
					4'b0011: begin
						res_wr <= 0;
						res_do[4:0] <= res_di[4:0]<res_do[4:0] ? res_di[4:0] : res_do[4:0];
						res_addr <= res_addr+1;
						count[0] <= 0;
					end
					4'b0010: begin
						res_wr <= 1;
						res_addr <= res_addr+127;
						res_do[4:0] <= res_di[4:0]<res_do[4:0] ? res_di[4:0]+1 : res_do[4:0]+1;
						count[2] <= 1;
					end
					default: begin
						res_wr <= 0;
						res_addr <= res_addr+1;
						count[1] <= 0;
						count[2] <= 0;
					end
				endcase
			end
			
			// BACKWARD_PASS
			default: begin
				case(count)
					4'b0000: begin
						res_wr <= 0;
						if(res_di) begin
							res_addr <= res_addr+129;
							count[0] <= 1;
							res_do[4:0] <= res_di[4:0]<res_do[4:0]+1 ? res_di : res_do[4:0]+1;
						end
						else begin
							if(res_addr == 128) begin
								// FINISH
								done <= 1;
							end
							res_do[4:0] <= 0;
							res_addr <= res_addr-1;
						end
					end
					4'b0001: begin
						res_wr <= 0;
						res_do[4:0] <= res_di[4:0]+1<res_do[4:0] ? res_di[4:0]+1 : res_do[4:0];
						res_addr <= res_addr-1;
						count[1] <= 1;
						
					end
					4'b0011: begin
						res_wr <= 0;
						res_do[4:0] <= res_di[4:0]+1<res_do[4:0] ? res_di[4:0]+1 : res_do[4:0];
						res_addr <= res_addr-1;
						count[0] <= 0;
					end
					4'b0010: begin
						res_wr <= 1;
						res_addr <= res_addr-127;
						res_do[4:0] <= res_di[4:0]+1<res_do[4:0] ? res_di[4:0]+1 : res_do[4:0];
						count[2] <= 1;
					end
					default: begin
						res_wr <= 0;
						count[1] <= 0;
						count[2] <= 0;
						res_addr <= res_addr-1;
					end
					
				endcase
			end
			
		endcase
	end
end



endmodule

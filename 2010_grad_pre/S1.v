module S1(clk,
	  rst,
	  updown,
	  S1_done,
	  RB1_RW,
	  RB1_A,
	  RB1_D,
	  RB1_Q,
	  sen,
	  sd);

  input clk,
        rst,
        updown;

  output reg S1_done,
         RB1_RW;
  
  output reg [4:0] RB1_A;
  
  output reg [7:0] RB1_D;
  
  input [7:0] RB1_Q;
  
  inout sen,
        sd;
		

reg [2:0] state, next_state;
reg [3:0] count;
reg sen_reg, sd_reg;
reg [2:0] S2_A;

assign sen = updown ? 1'bz : sen_reg;
assign sd = updown ? 1'bz : sd_reg;

always@(*) begin
	if(state==3) next_state = &RB1_A ? state+1 : state;
	else next_state = state>3 ? 0 : state+1;
end

always@(posedge clk or posedge rst) begin
	if(rst) begin
		state <= 0;
		RB1_A <= 0;
		RB1_D <= 0;
		sen_reg <= 1;
		sd_reg <= 0;
		S2_A <= 0;
		RB1_RW <= 1;
		S1_done <= 0;
		count <= 7;
	end
	else begin
		state <= next_state;
		
		if(updown) begin // receive
			if(sen) begin
				count <= 12;
				RB1_RW <= 1;
				if(RB1_A==17 && !RB1_RW) S1_done <= 1;
			end
			else begin
				if(count>=8) begin
					RB1_A[count-8] <= sd;
				end
				else begin
					RB1_D[count] <= sd;
					if(!count) begin
						RB1_RW <= 0;
					end
				end
				count <= count-1;
			end
			
		end
		else begin	// write
			case(state)
				// send S2_A
				0: begin
					RB1_RW <= 1;
					sen_reg <= 0;
					sd_reg <= S2_A[2];
				end
				// send data
				3: begin
					RB1_RW <= 1;
					sd_reg <= RB1_Q[count];
					RB1_A <= RB1_A-1;
				end
				// break
				default: begin
					S2_A <= S2_A+1;
					sen_reg <= 1;
					count <= count-1;
				end
			
			endcase
		end
	end
end
  
endmodule

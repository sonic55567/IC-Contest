module S2(clk,
	  rst,
	  updown,
	  S2_done,
	  RB2_RW,
	  RB2_A,
	  RB2_D,
	  RB2_Q,
	  sen,
	  sd);

  input clk,
        rst,
        updown;
  
  output reg S2_done,
         RB2_RW;
  
  output reg [2:0] RB2_A;
  
  output reg [17:0] RB2_D;
  
  input [17:0] RB2_Q;
  
  inout sen,
        sd;


reg [2:0] state, next_state;
reg [4:0] count;
reg sen_reg, sd_reg;
reg [4:0] S1_A;

assign sen = updown ? sen_reg : 1'bz;
assign sd = updown ? sd_reg : 1'bz;

always@(*) begin
	if(state==5) next_state = &RB2_A ? state+1 : state;
	else next_state = state>5 ? 0 : state+1;
end

		
always@(posedge clk or posedge rst) begin
	if(rst) begin
		state <= 0;
		RB2_A <= 0;
		RB2_D <= 0;
		sen_reg <= 1;
		sd_reg <= 0;
		S1_A <= 0;
		RB2_RW <= 1;
		S2_done <= 0;
	end
	else begin
		
		if(updown) begin // write
			state <= next_state;
			
			case(state)
				// send S1_A
				0: begin
					RB2_RW <= 1;
					sen_reg <= 0;
					sd_reg <= S1_A[4];
				end
				1: begin
					RB2_RW <= 1;
					sen_reg <= 0;
					sd_reg <= S1_A[3];
				end
				2: begin
					RB2_RW <= 1;
					sen_reg <= 0;
					sd_reg <= S1_A[2];
				end
				3: begin
					RB2_RW <= 1;
					sen_reg <= 0;
					sd_reg <= S1_A[1];
					RB2_A <= 7;
				end
				4: begin
					RB2_RW <= 1;
					sen_reg <= 0;
					sd_reg <= S1_A[0];
					RB2_A <= RB2_A-1;
				end
				// send data
				5: begin
					RB2_RW <= 1;
					sd_reg <= RB2_Q[count];
					RB2_A <= RB2_A-1;
				end
				// break
				default: begin
					S1_A <= S1_A+1;
					sen_reg <= 1;
					count <= count-1;
				end
			endcase
			
		end
		else begin	// receive
			if(sen) begin
				count <= 20;
				RB2_RW <= 1;
				if(&RB2_A && !RB2_RW) begin
					S2_done <= 1;
					count <= 17;
				end
			end
			else begin
				if(count>=18) begin
					RB2_A[count-18] <= sd;
				end
				else begin
					RB2_D[count] <= sd;
					if(!count) begin
						RB2_RW <= 0;
						
					end
				end
				count <= count-1;
			end
		end
	end
end

endmodule

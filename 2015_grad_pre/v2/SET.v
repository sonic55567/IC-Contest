module SET ( clk , rst, en, central, radius, mode, busy, valid, candidate );

input clk, rst;
input en;
input [23:0] central;
input [11:0] radius;
input [1:0] mode;
output busy;
output valid;
output [7:0] candidate;

reg busy,valid;
reg [1:0] mode_reg,state;
reg [3:0] row,col;
reg [2:0] cnt;
reg [7:0] candidate,sq_Ax,sq_Ay,sq_RA,sq_Bx,sq_By,sq_RB,sq_Cx,sq_Cy,sq_RC;

wire [3:0] AC_x = central[23:20];
wire [3:0] AC_y = central[19:16];
wire [3:0] BC_x = central[15:12];
wire [3:0] BC_y = central[11:8];
wire [3:0] CC_x = central[7:4];
wire [3:0] CC_y = central[3:0];

wire [3:0] dis_Ax = (col > AC_x)? col - AC_x:AC_x - col;
wire [3:0] dis_Ay = (row > AC_y)? row - AC_y:AC_y - row;
wire [3:0] dis_Bx = (col > BC_x)? col - BC_x:BC_x - col;
wire [3:0] dis_By = (row > BC_y)? row - BC_y:BC_y - row;
wire [3:0] dis_Cx = (col > CC_x)? col - CC_x:CC_x - col;
wire [3:0] dis_Cy = (row > CC_y)? row - CC_y:CC_y - row;

wire [8:0] sum_A = sq_Ax + sq_Ay;
wire [8:0] sum_B = sq_Bx + sq_By;
wire [8:0] sum_C = sq_Cx + sq_Cy;

wire [3:0] RA = radius[11:8];
wire [3:0] RB = radius[7:4];
wire [3:0] RC = radius[3:0];

wire [3:0] Rlimit_A = (AC_x + RA < 4'd8)? AC_x + RA:4'd8;
wire [3:0] Llimit_A = (AC_x > RA)? AC_x - RA:4'd1;
wire [3:0] Ulimit_A = (AC_y + RA < 4'd8)? AC_y + RA:4'd8;
wire [3:0] Dlimit_A = (AC_y > RA)? AC_y - RA:4'd1;

wire [3:0] Rlimit_B = (BC_x + RB < 4'd8)? BC_x + RB:4'd8;
wire [3:0] Llimit_B = (BC_x > RB)? BC_x - RB:4'd1;
wire [3:0] Ulimit_B = (BC_y + RB < 4'd8)? BC_y + RB:4'd8;
wire [3:0] Dlimit_B = (BC_y > RB)? BC_y - RB:4'd1;

wire [3:0] Rlimit_C = (CC_x + RC < 4'd8)? CC_x + RC:4'd8;
wire [3:0] Llimit_C = (CC_x > RC)? CC_x - RC:4'd1;
wire [3:0] Ulimit_C = (CC_y + RC < 4'd8)? CC_y + RC:4'd8;
wire [3:0] Dlimit_C = (CC_y > RC)? CC_y - RC:4'd1;

wire [3:0] Rlimit_AB = (Rlimit_A > Rlimit_B)? Rlimit_A:Rlimit_B;
wire [3:0] Llimit_AB = (Llimit_A < Llimit_B)? Llimit_A:Llimit_B;
wire [3:0] Ulimit_AB = (Ulimit_A > Ulimit_B)? Ulimit_A:Ulimit_B;
wire [3:0] Dlimit_AB = (Dlimit_A < Dlimit_B)? Dlimit_A:Dlimit_B;
wire [3:0] Rlimit_AC = (Rlimit_AB > Rlimit_C)? Rlimit_AB:Rlimit_C;
wire [3:0] Llimit_AC = (Llimit_AB < Llimit_C)? Llimit_AB:Llimit_C;
wire [3:0] Ulimit_AC = (Ulimit_AB > Ulimit_C)? Ulimit_AB:Ulimit_C;
wire [3:0] Dlimit_AC = (Dlimit_AB < Dlimit_C)? Dlimit_AB:Dlimit_C;

wire [3:0] row_max = (!mode)? Ulimit_A : ((mode == 2'd3)? Ulimit_AC:Ulimit_AB);
wire [3:0] col_max = (!mode)? Rlimit_A : ((mode == 2'd3)? Rlimit_AC:Rlimit_AB);
wire [3:0] row_min = (!mode)? Dlimit_A : ((mode == 2'd3)? Dlimit_AC:Dlimit_AB);
wire [3:0] col_min = (!mode)? Llimit_A : ((mode == 2'd3)? Llimit_AC:Llimit_AB);

always@(posedge clk or posedge rst)
begin

	if(rst)
	begin
		busy <= 0;
		valid <= 0;
		mode_reg <= 2'd0;
		state <= 2'd0;
		row <= 4'd0;
		col <= 4'd0;
		cnt <= 3'd0;
		candidate <= 8'd0;
		sq_Ax <= 8'd0;
		sq_Ay <= 8'd0;
		sq_RA <= 8'd0;
		sq_Bx <= 8'd0;
		sq_By <= 8'd0;
		sq_RB <= 8'd0;
		sq_Cx <= 8'd0;
		sq_Cy <= 8'd0;
		sq_RC <= 8'd0;
	end
	else
	begin
		
		if(en && !busy)
		begin
			valid <= 0;
			mode_reg <= mode;
			state <= 2'd0;
			row <= row_min;
			col <= col_min;
			busy <= 1;
			cnt <= 3'd0;
			candidate <= 8'd0;
		end
		else if(busy)
		begin
		
			case(state)

			2'd0: // Compute the square of radius
			begin

				if(cnt == 3'd0)
					sq_RA <= RA*RA;
				else if(cnt == 3'd1)
					sq_RB <= RB*RB;
				else
					sq_RC <= RC*RC;

				cnt <= ((mode_reg == 2'd0) || ((mode_reg == 2'd3) && (cnt == 3'd2)) || ((mode_reg != 2'd3) && (cnt == 3'd1)))? 3'd0:cnt + 3'd1;
				state <= ((mode_reg == 2'd0) || ((mode_reg == 2'd3) && (cnt == 3'd2)) || ((mode_reg != 2'd3) && (cnt == 3'd1)))? 2'd1:state;

			end

			2'd1: // Compute the square of distance
			begin
				
				if(cnt == 3'd0)
					sq_Ax <= dis_Ax*dis_Ax;
				else if(cnt == 3'd1)
					sq_Ay <= dis_Ay*dis_Ay;
				else if(cnt == 3'd2)
					sq_Bx <= dis_Bx*dis_Bx;
				else if(cnt == 3'd3)
					sq_By <= dis_By*dis_By;
				else if(cnt == 3'd4)
					sq_Cx <= dis_Cx*dis_Cx;
				else
					sq_Cy <= dis_Cy*dis_Cy;

				cnt <= (((mode_reg == 2'd0) && (cnt == 3'd1)) || ((mode_reg == 2'd3) && (cnt == 3'd5)) || ((mode_reg != 2'd0) && (mode_reg != 2'd3) && (cnt == 3'd3)))? 3'd0:cnt + 3'd1;
				state <= (((mode_reg == 2'd0) && (cnt == 3'd1)) || ((mode_reg == 2'd3) && (cnt == 3'd5)) || ((mode_reg != 2'd0) && (mode_reg != 2'd3) && (cnt == 3'd3)))? 2'd2:state;

			end

			2'd2: // Compare
			begin

				case(mode_reg)
			
				2'd0:
					candidate <= (sum_A <= sq_RA)? candidate + 8'd1:candidate;
			
				2'd1:
					candidate <= ((sum_A <= sq_RA) && (sum_B <= sq_RB))? candidate + 8'd1:candidate;
			
				2'd2:
					candidate <= (((sum_A <= sq_RA) && (sum_B > sq_RB)) || ((sum_A > sq_RA) && (sum_B <= sq_RB)))? candidate + 8'd1:candidate;

				2'd3:
					candidate <= ((((sum_A <= sq_RA) && (sum_B <= sq_RB)) || ((sum_A <= sq_RA) && (sum_C <= sq_RC)) || ((sum_B <= sq_RB) && (sum_C <= sq_RC))) && !((sum_A <= sq_RA) && (sum_B <= sq_RB) && (sum_C <= sq_RC)))? candidate + 8'd1:candidate;
			
				default:
					candidate <= candidate;
			
				endcase
			
				row <= (col < col_max)? row:row + 4'd1;
				col <= (col < col_max)? col + 4'd1:col_min;
				state <= ((col >= col_max) && (row >= row_max))? 2'd3:2'd1;
				busy <= ((col >= col_max) && (row >= row_max))? 0:1;
				valid <= ((col >= col_max) && (row >= row_max))? 1:0;

			end

			default: // Finish
				state <= state;

			endcase
		
		end
		else
			mode_reg <= mode_reg;
		
	end


end

endmodule



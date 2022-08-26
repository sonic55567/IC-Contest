module SET ( clk , rst, en, central, radius, mode, busy, valid, candidate );

input clk, rst;
input en;
input [23:0] central;
input [11:0] radius;
input [1:0] mode;
output busy;
output reg valid;
output [7:0] candidate;
reg [3:0] state;

wire [3:0] x, y;
reg [7:0] dis_square_x, dis_square_y;
reg signed [3:0] A;
reg [5:0] counter, xy_count;
wire [6:0] mul;

assign candidate = counter;
assign mul = A*A;
assign busy = 0;
assign x = xy_count[5:3] + 1'b1;
assign y = xy_count[2:0] + 1'b1;

reg a, b, c;

always @ (posedge clk or posedge rst) begin
	if(rst) begin
		//valid <= 0;
		state <= 0;
	end
	else begin
		case(state)
			// x
			0: begin
				state <= 1;
				counter <= 0;
				xy_count <= 0;
			end
			1: begin
				A <= x-central[23:20];
				state <= 2;
			end
			2: begin
				dis_square_x <= mul;
				A <= y-central[19:16];
				state <= 3;
			end
			3: begin
				dis_square_y <= mul;
				A <= radius[11:8];
				state <= 4;
			end
			4: begin
				a <= dis_square_x + dis_square_y <= mul ? 1 : 0;
				A <= x-central[15:12];
				state <= 5;
			end
			
			// y
			5: begin
				dis_square_x <= mul;
				A <= y-central[11:8];
				state <= 6;
			end
			6: begin
				dis_square_y <= mul;
				A <= radius[7:4];
				state <= 7;
			end
			7: begin
				b <= dis_square_x + dis_square_y <= mul ? 1 : 0;
				A <= x-central[7:4];
				state <= 8;
			end
			
			// z
			8: begin
				dis_square_x <= mul;
				A <= y-central[3:0];
				state <= 9;
			end
			9: begin
				dis_square_y <= mul;
				A <= radius[3:0];
				state <= 10;
			end
			10: begin
				c <= dis_square_x + dis_square_y <= mul ? 1 : 0;
				state <= 11;
			end
			
			11: begin
				case(mode)
					2'b00: begin
						if(a)
							counter <= counter+1;
					end
					2'b01: begin
						if(a&b)
							counter <= counter+1;
					end
					2'b10: begin
						if(a^b)
							counter <= counter+1;
					end
					default: begin
						if((!a&b&c)|(a&!b&c)|(a&b&!c))
							counter <= counter+1;
					end
				endcase
				state <= 12;
			end
			12: begin
				if(&xy_count) begin
					valid <= 1;
					state <= 13;
				end
				else begin
					state <= 1;
				end
				xy_count <= xy_count+1;
			end
			default: begin
				valid <= 0;
				state <= 0;
			end
		
		endcase
		
	end
end


endmodule

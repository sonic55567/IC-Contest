module triangle (clk, reset, nt, xi, yi, busy, po, xo, yo);

input clk, reset, nt;
input [2:0] xi, yi;
output reg busy, po;
output reg [2:0] xo, yo;

reg [2:0] x1, y1, x2, y2, x3, y3, xt, yt;
reg [1:0] counter;
reg flag;

wire [4:0] A, B;

assign A = (y3-yt)*(x2-x3);
assign B = (y3-y2)*((xt+1)-x3);

always @ (posedge clk or posedge reset) begin
	if(reset) begin
		counter <= 0;
		flag <= 0;
		busy <= 0;
		po <= 0;
		x1 <= 0;
		y1 <= 0;
		x2 <= 0;
		y2 <= 0;
		x3 <= 0;
		y3 <= 0;
		xt <= 0;
		yt <= 0;
	end
	else begin
		if(nt) begin	// read point
			x1 <= xi;
			y1 <= yi;
			xt <= xi;
			yt <= yi;
			counter <= counter+1'b1;
			flag <= 0;
		end
		else begin
		end
		if(counter == 1) begin
			x2 <= xi;
			y2 <= yi;
			counter <= counter+1'b1;
		end
		else if(counter == 2) begin
			x3 <= xi;
			y3 <= yi;
			counter <= 0;
			busy <= 1'b1;
			//po <= 1'b1;
		end
		else begin
		end
		
		if(busy) begin	// start processing
			
			if(yt == y3) begin
				xo <= x3;
				yo <= y3;
				flag <= 1'b1;
			end
			else begin
				po <= 1'b1;
				if( A < B ) begin
					xo <= xt;
					yo <= yt;
					xt <= x1;
					yt <= yt+1'b1;
				end
				else begin
					xo <= xt;
					yo <= yt;
					xt <= xt+1'b1;
				end
			end
		end
		else begin
		end
		
		if(flag) begin	// stop
			busy <= 1'b0;
			po <= 1'b0;
		end
		else begin
		end
	end
end       

endmodule
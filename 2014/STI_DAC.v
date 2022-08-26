module STI_DAC(clk ,reset, load, pi_data, pi_length, pi_fill, pi_msb, pi_low, pi_end,
	       so_data, so_valid,
	       oem_finish, oem_dataout, oem_addr,
	       odd1_wr, odd2_wr, odd3_wr, odd4_wr, even1_wr, even2_wr, even3_wr, even4_wr);

input		clk, reset;
input		load, pi_msb, pi_low, pi_end; 
input	[15:0]	pi_data;
input	[1:0]	pi_length;
input		pi_fill;
output reg		so_data, so_valid;

output reg  oem_finish, odd1_wr, odd2_wr, odd3_wr, odd4_wr, even1_wr, even2_wr, even3_wr, even4_wr;
output reg [4:0] oem_addr;
output reg [7:0] oem_dataout;

reg [2:0] state;
reg [5:0] count;
reg [7:0] addr;

wire [5:0] index;
//==============================================================================


assign index = 4'd15-count;

/* 
1.

15-count	7-count  flag[3]=1  index[]
7-count


2.

15-count

3.

15-count
23-count

4.

15-count
31-count
 */


always@(posedge clk or posedge reset) begin
	if(reset) begin
		count <= 0;
		so_valid <= 0;
		so_data <= 0;
		state <= 0;
		oem_finish <= 0;
		oem_dataout <= 0;
	end
	else begin
		case(state)
		// wait load
		0: begin
			count <= 0;
			so_valid <= 0;
			
			if(load) begin
				case(pi_length)
					0: state <= 1;
					1: state <= 2;
					2: state <= 3;
					3: state <= 4;
				endcase
			end
			if(pi_end) state <= 5;
		end
		
		// 8bits
		1: begin
			so_valid <= 1;
			if(pi_msb) begin // reverse
				so_data <= pi_low ? pi_data[index] : pi_data[{1'b0, index[2:0]}];
				oem_dataout[7-count[2:0]] <= pi_low ? pi_data[index] : pi_data[{1'b0, index[2:0]}];
			end
			else begin
				so_data <= pi_low ? pi_data[{1'b1, count[2:0]}] : pi_data[count];		// in this case: count+8 equal to {1'b1, count[2:0]}
				oem_dataout[7-count[2:0]] <= pi_low ? pi_data[{1'b1, count[2:0]}] : pi_data[count];
			end
			
			count <= count+1;
			
			if(count>=7) begin
				state <= 0;
			end
		end
		
		// 16bits
		2: begin
			so_valid <= 1;
			if(pi_msb) begin // reverse
				so_data <= pi_data[index];
				oem_dataout[7-count[2:0]] <= pi_data[index];
			end
			else begin
				so_data <= pi_data[count];
				oem_dataout[7-count[2:0]] <= pi_data[count];
			end
			
			count <= count+1;
			
			if(count>=15) begin
				state <= 0;
			end
		end
		///////////////////////////////////////////////////////
		// 24bits
		3: begin
			so_valid <= 1;
			if(pi_msb) begin // reverse
				if(pi_fill) begin
					so_data <= count<16 ? pi_data[index] : 0;
					oem_dataout[7-count[2:0]] <= count<16 ? pi_data[index] : 0;
				end
				else begin
					so_data <= count>7 ? pi_data[{!index[3], index[2:0]}] : 0;
					oem_dataout[7-count[2:0]] <= count>7 ? pi_data[{!index[3], index[2:0]}] : 0;
				end
			end
			else begin
				if(pi_fill) begin
					so_data <= count>7 ? pi_data[{!count[3], count[2:0]}] : 0;		// in this case: {!count[3], count[2:0]} equal to count-8
					oem_dataout[7-count[2:0]] <= count>7 ? pi_data[{!count[3], count[2:0]}] : 0;
				end
				else begin
					so_data <= count<16 ? pi_data[count] : 0;
					oem_dataout[7-count[2:0]] <= count<16 ? pi_data[count] : 0;
				end
			end
			
			count <= count+1;
			
			if(count>=23) begin
				state <= 0;
			end
		end
		
		// 32bits
		4: begin
			so_valid <= 1;
			if(pi_msb) begin // reverse
				if(pi_fill) begin
					so_data <= count<16 ? pi_data[index] : 0;
					oem_dataout[7-count[2:0]] <= count<16 ? pi_data[index] : 0;
				end
				else begin
					so_data <= count>15 ? pi_data[index[3:0]] : 0;
					oem_dataout[7-count[2:0]] <= count>15 ? pi_data[index[3:0]] : 0;
				end
			end
			else begin
				if(pi_fill) begin
					so_data <= count>15 ? pi_data[count[3:0]] : 0;		// in this case: count[3:0] equal to count-16
					oem_dataout[7-count[2:0]] <= count>15 ? pi_data[count[3:0]] : 0;
				end
				else begin
					so_data <= count<16 ? pi_data[count] : 0;
					oem_dataout[7-count[2:0]] <= count<16 ? pi_data[count] : 0;
				end
			end
			
			count <= count+1;
			
			if(count>=31) begin
				state <= 0;
			end
		end
		
		// memory initialize
		default: begin
			oem_dataout <= 0;
			count <= count+1;
			if(!addr) oem_finish <= 1;
		end
		
		endcase
		
	end
end

always@(negedge clk or posedge reset) begin
	if(reset) begin
		oem_addr <= 0;
		addr <= 0;
		odd1_wr <= 0;
		odd2_wr <= 0;
		odd3_wr <= 0;
		odd4_wr <= 0;
		even1_wr <= 0;
		even2_wr <= 0;
		even3_wr <= 0;
		even4_wr <= 0;
	end
	else begin
		// DAC
		if((|count[5:3])&(!(|count[2:0]))) begin // test compare to if(!|count[2:0])
			if(addr[3]) begin // >8
				case(addr[7:6])
					2'b00: begin
						if(addr[0]) odd1_wr <= 1;
						else even1_wr <= 1;
					end
					2'b01: begin
						if(addr[0]) odd2_wr <= 1;
						else even2_wr <= 1;
					end
					2'b10: begin
						if(addr[0]) odd3_wr <= 1;
						else even3_wr <= 1;
					end
					2'b11: begin
						if(addr[0]) odd4_wr <= 1;
						else even4_wr <= 1;
					end
				endcase
			end
			else begin	// <8
				case(addr[7:6])
					2'b00: begin
						if(addr[0]) even1_wr <= 1;
						else odd1_wr <= 1;
					end
					2'b01: begin
						if(addr[0]) even2_wr <= 1;
						else odd2_wr <= 1;
					end
					2'b10: begin
						if(addr[0]) even3_wr <= 1;
						else odd3_wr <= 1;
					end
					2'b11: begin
						if(addr[0]) even4_wr <= 1;
						else odd4_wr <= 1;
					end
				endcase
			end
			if (addr && !addr[0]) oem_addr <= oem_addr+1;
			addr <= addr+1;
			
		end
		else begin
			odd1_wr <= 0;
			odd2_wr <= 0;
			odd3_wr <= 0;
			odd4_wr <= 0;
			even1_wr <= 0;
			even2_wr <= 0;
			even3_wr <= 0;
			even4_wr <= 0;
		end
	end
end





endmodule

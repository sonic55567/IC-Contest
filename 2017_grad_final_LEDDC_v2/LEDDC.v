`timescale 1ns/10ps

module LEDDC( DCK, DAI, DEN, GCK, Vsync, mode, rst, OUT);
input           DCK;
input           DAI;
input           DEN;
input           GCK;
input           Vsync;
input           mode;
input           rst;
output reg [15:0]   OUT;

reg [3:0] count;
reg stateD, next_stateD;
reg [1:0] stateG, next_stateG;

reg CENB;	// 1:close, 0:open

reg [7:0] addr_A;
reg [8:0] addr_B;

reg [15:0] pixel;

reg count_flag;

reg [15:0] out_buffer [0:15];
reg addr_A_flag;

reg switcher;
reg round, round_flag;
reg wait_data;

wire [15:0] mem_data, real_data0, real_data1;

integer i;

// A: get, B: store
sram_512x16 mem1(
   .QA(mem_data),
   .AA({!switcher, addr_A}),
   .CLKA(GCK),
   .CENA(1'b0),
   .AB({switcher, addr_B[8:1]}),
   .DB(pixel),
   .CLKB(DCK),
   .CENB(CENB)
);

// real_data0 -> get first 8 bits
assign real_data0 = {mem_data[7:0], mem_data[7:0]};
assign real_data1 = {mem_data[15:8], mem_data[15:8]};

// DCK state machine
always@(*) begin
	case(stateD)
		0: begin
			if(count_flag && count==0) next_stateD <= 1;
			else next_stateD <= stateD;
		end
		default: begin
			next_stateD <= 0;
		end
	endcase
end

// DCK
always@(posedge DCK or posedge rst) begin
	if(rst) begin
		count <= 0;
		addr_B <= 0;
		pixel <= 0;
		stateD <= 0;
		count_flag <= 0;
		switcher <= 0;
	end
	else begin
		stateD <= next_stateD;
		
		CENB <= &count ? 0 : 1;
		// switch two sram
		// if(switcher) begin
			// // open mem1 write, close mem2 write
			// CENB1 <= &count ? 0 : 1;
			// CENB2 <= 1;
		// end
		// else begin
			// // open mem2 write, close mem1 write
			// CENB2 <= &count ? 0 : 1;
			// CENB1 <= 1;
		// end
		
		case(stateD)
		// get pixel
			0: begin
				if(DEN) begin
					// 分2cycle 存入同個16bit reg
					pixel[{addr_B[0], count[2:0]}] <= DAI;
					count <= count+1;
					count_flag <= 1;
				end
				else begin
					
				end
			end
			default: begin
				addr_B <= addr_B+1;
				count_flag <= 0;
				if(addr_B==9'h1ff && stateG==2) switcher <= !switcher;
			end
		endcase
	end
end


// GCK state machine
always@(*) begin
	case(stateG)
		0: begin
			if(addr_A_flag && &addr_A[2:0] && wait_data) next_stateG <= 1;
			else next_stateG <= stateG;
		end
		1: begin
			if(Vsync) next_stateG <= stateG;
			else next_stateG <= 2;
		end
		default: begin
			if(Vsync) next_stateG <= 0;
			else next_stateG <= stateG;
		end
	endcase
end

// GCK
always@(posedge GCK or posedge rst) begin
	if(rst) begin
		OUT <= 0;
		stateG <= 0;
		addr_A <= 0;
		addr_A_flag <= 0;
		wait_data <= 0;
	end
	else begin
		stateG <= next_stateG;
		
		case(stateG)
			// prepare
			0: begin
				if(wait_data) begin
					if(mode) begin	// 60fps
						if(round) begin		// round1
							out_buffer[{addr_A[2:0], 1'b0}] <= real_data0>>1;
							out_buffer[{addr_A[2:0], 1'b1}] <= real_data1>>1;
						end
						else begin			// round0
							out_buffer[{addr_A[2:0], 1'b0}] <= real_data0[0] ? (real_data0>>1)+1 : (real_data0>>1);
							out_buffer[{addr_A[2:0], 1'b1}] <= real_data1[0] ? (real_data1>>1)+1 : (real_data1>>1);
						end
					end
					else begin	// 30fps
						out_buffer[{addr_A[2:0], 1'b0}] <= real_data0;
						out_buffer[{addr_A[2:0], 1'b1}] <= real_data1;
					end
					addr_A <= addr_A+1;
					addr_A_flag <= 1;
					///////////////////////////////////
				end
				wait_data <= !wait_data;
			end
			// output pwm
			1: begin
				for(i=0;i<16;i=i+1) begin
					OUT[i] <= out_buffer[i] ? 1 : 0;
					out_buffer[i] <= out_buffer[i] ? out_buffer[i]-1 : 0;
				end
			end
			2: begin
				addr_A_flag <= 0;
			end
		endcase
	end
end

// now is round ?
always@(posedge GCK or posedge rst) begin
	if(rst) begin
		round <= 0;
		round_flag <= 1;
	end
	else begin
		if(!Vsync && addr_A==0 && !round_flag) begin
			//$display("Now is round %b!!!!!!!!!!!!!!!!!", round);
			round <= !round;
			round_flag <= 1;	// to avoid too many useless oscillate
		end
		else if(Vsync) begin
			// until Vsync rise
			round_flag <= 0;
		end
	end
end

endmodule

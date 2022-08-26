module TPA(clk, reset_n, 
	   SCL, SDA, 
	   cfg_req, cfg_rdy, cfg_cmd, cfg_addr, cfg_wdata, cfg_rdata);
input 		clk; 
input 		reset_n;
// Two-Wire Protocol slave interface 
input 		SCL;  
inout		SDA;

// Register Protocal Master interface 
input		cfg_req;
output	reg	cfg_rdy;
input		cfg_cmd;
input	[7:0]	cfg_addr;
input	[15:0]	cfg_wdata;
output	reg [15:0]  cfg_rdata;

reg	[15:0] Register_Spaces	[0:255];

// ===== Coding your RTL below here ================================= 
reg TWP_flag, TWP_output, TWP_read, TWP_cmd, flag6_3, flag6_1;
reg [3:0] count;
reg [2:0] state;
reg [7:0] addr_temp;
reg [15:0] data_temp;

assign SDA = TWP_read ? TWP_output : 1'bz;

always@(posedge clk or negedge reset_n) begin
	if(!reset_n) begin
		cfg_rdy <= 0;
		TWP_flag <= 0;
		TWP_read <= 0;
		count <= 0;
		state <= 0;
	end
	else begin
		// RIM
		if(cfg_req) begin
		
			cfg_rdy <= 1;
			
			// 6-3
			flag6_3 <= TWP_flag ? 1:0;
			
			if(cfg_rdy) begin
				if(cfg_cmd) begin	// write
					Register_Spaces[cfg_addr] <= cfg_wdata;
					
				end
				else begin			// read
					cfg_rdata <= Register_Spaces[cfg_addr];
				end
				
			end
		end
		else cfg_rdy <= 0;
		
		// TWP
		if(!TWP_flag) begin		// wait
			case(state)
				0: begin
					if(SDA == 0) begin
						state <= state+1;
					end
					
					// 6-1
					//if(cfg_req & !cfg_rdy) flag6_1 <= 1;
					//else flag6_1 <= 0;
					flag6_1 <= (cfg_req & !cfg_rdy) ? 1:0;
				end
				default: begin
					TWP_cmd <= SDA;
					TWP_flag <= 1;
					state <= 0;
					count <= 0;
				end
			endcase
		end
		else begin				// work
			if(TWP_cmd) begin		// write
				case(state)
					0: begin	// read addr
						addr_temp[count] <= SDA;
						
						if(count == 7) begin
							state <= state+1;
							count <= 0;
						end
						else count <= count+1;
						
					end
					1: begin	// read data
						data_temp[count] <= SDA;
						
						if(count == 15) begin
							state <= state+1;
							count <= 0;
						end
						else count <= count+1;
					end
					default: begin	// 
						if( ! ( (flag6_3|flag6_1) && (addr_temp==cfg_addr) ) )
							Register_Spaces[addr_temp] <= data_temp;
						state <= 0;
						TWP_flag <= 0;
					end
				endcase
			end
			else begin			// read
				case(state)
					0: begin	// read addr
						addr_temp[count] <= SDA;
						
						if(count == 7) begin
							state <= state+1;
							count <= 0;
						end
						else count <= count+1;
						
					end
					1: begin	// NOP
						state <= state+1;
					end
					2: begin	// ready to output
						TWP_read <= 1;
						TWP_output <= 1;
						state <= state+1;
						data_temp <= Register_Spaces[addr_temp];
					end
					3: begin
						TWP_output <= 0;
						state <= state+1;
					end
					4: begin	// write data to output
						TWP_output <= data_temp[count];
						if(count == 15) begin
							state <= state+1;
							count <= 0;
						end
						else count <= count+1;
					end
					5: begin
						TWP_output <= 1;
						state <= state+1;
					end
					default: begin	// 
						state <= 0;
						TWP_flag <= 0;
						TWP_read <= 0;
					end
				endcase
			end
		end
	end

end

endmodule

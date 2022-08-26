module LCD_CTRL(clk, reset, cmd, cmd_valid, IROM_Q, IROM_rd, IROM_A, IRAM_valid, IRAM_D, IRAM_A, busy, done);
input clk;
input reset;
input [3:0] cmd;
input cmd_valid;
input [7:0] IROM_Q;
output reg IROM_rd;
output reg [5:0] IROM_A;
output reg IRAM_valid;
output reg [7:0] IRAM_D;
output reg [5:0] IRAM_A;
output reg busy;
output reg done;

reg cur_state,next_state; // define cur_state and next_state
reg [5:0] img_counter;    // use to count load data number and use to count the output data number
reg [3:0] row,col;        // record the position
reg [3:0] cmd_reg;        // cmd temp
reg [7:0] data_buff[63:0]; // buf all data
reg [6:0] io_counter;
reg [7:0] max_or_min;
reg counter;
reg [9:0] average;
reg delay;


localparam WRITE     = 4'd0;
localparam SHIFT_UP   = 4'd1;
localparam SHIFT_DOWN = 4'd2;
localparam SHIFT_LEFT  = 4'd3;
localparam SHIFT_RIGHT    = 4'd4;
localparam MAX  = 4'd5;
localparam MIN  = 4'd6;
localparam AVERAGE  = 4'd7;
localparam COUNTERCLOCKWISE_ROTATION  = 4'd8;
localparam CLOCKWISE_ROTATION  = 4'd9;
localparam MIRROR_X  = 4'd10;
localparam MIRROR_Y  = 4'd11;
localparam WAIT_CMD = 1'b0;
localparam PROCESS  = 1'b1;

always @ ( posedge clk or posedge reset ) begin  // Data process and control signal
    if (reset) begin
        row <= 4'd4;
        col <= 4'd4;
        busy <= 1'd1;
        img_counter <= 6'd0;
		IROM_rd <= 1'b1;
		IROM_A <= 6'd0;
		IRAM_valid <= 1'b0;
		IRAM_D <= 8'd0;
		IRAM_A <= 6'b000000;
		done <= 1'b0;
		io_counter <= 7'd0;
		counter <= 1'b0;
		delay <= 1'b0;
		cur_state <= WAIT_CMD;
		next_state <= WAIT_CMD;
		max_or_min <= 0;
		average <= 0;
    end
	else begin 
		/////////////////////
		cur_state <= next_state;
		case ( cur_state )
			WAIT_CMD : begin
				if ( cmd_valid )
					next_state <= PROCESS;
				else
					next_state <= WAIT_CMD;
			end
			PROCESS : begin
				if ( busy == 1'b0 ) begin
					next_state <= WAIT_CMD;
				end
				else
					next_state <= PROCESS;
			end
		endcase
		/////////////////////
		if ( cur_state == WAIT_CMD ) begin
            if ( cmd_valid ) begin
                cmd_reg <= cmd;
                busy <= 1'd1;
            end
			else begin
			end
        end
		else begin
			case(cmd_reg)
				WRITE : begin
					IRAM_valid <= 1'b1;
				end
				SHIFT_UP : begin
					if(row > 1) begin
						row <= row-1;
					end
					else begin
					end
					busy <= 1'b0;
					cur_state <= WAIT_CMD;
					next_state <= WAIT_CMD;
				end
				SHIFT_DOWN : begin
					if(row < 7)begin
						row <= row+1;
					end
					else begin
					end
					busy <= 1'b0;
					cur_state <= WAIT_CMD;
					next_state <= WAIT_CMD;
				
				end
				SHIFT_LEFT : begin
					if(col > 1) begin
						col <= col-1;
					end
					else begin
					end
					busy <= 1'b0;
					cur_state <= WAIT_CMD;
					next_state <= WAIT_CMD;
				end
				SHIFT_RIGHT : begin
					if(col < 7) begin 
						col <= col+1;
					end
					else begin
					end
					busy <= 1'b0;
					cur_state <= WAIT_CMD;
					next_state <= WAIT_CMD;
				end
				MAX : begin
					if(counter == 1'b0) begin
						if((data_buff[8*(row-1)+(col-1)] >= data_buff[8*(row-1)+(col)]) && (data_buff[8*(row-1)+(col-1)] >= data_buff[8*(row)+(col-1)]) && (data_buff[8*(row-1)+(col-1)] >= data_buff[8*(row)+(col)])) begin
							max_or_min <= data_buff[8*(row-1) + (col-1)];
						end
						else begin
						end
						if((data_buff[8*(row-1)+(col)] >= data_buff[8*(row-1)+(col-1)]) && (data_buff[8*(row-1)+(col)] >= data_buff[8*(row)+(col-1)]) && (data_buff[8*(row-1)+(col)] >= data_buff[8*(row)+(col)])) begin
							max_or_min <= data_buff[8*(row-1) + (col)];
						end
						else begin
						end
						if((data_buff[8*(row)+(col-1)] >= data_buff[8*(row-1)+(col-1)]) && (data_buff[8*(row)+(col-1)] >= data_buff[8*(row-1)+(col)]) && (data_buff[8*(row)+(col-1)] >= data_buff[8*(row)+(col)])) begin
							max_or_min <= data_buff[8*(row) + (col-1)];
						end
						else begin
						end
						if((data_buff[8*(row)+(col)] >= data_buff[8*(row-1)+(col-1)]) && (data_buff[8*(row)+(col)] >= data_buff[8*(row-1)+(col)]) && (data_buff[8*(row)+(col)] >= data_buff[8*(row)+(col-1)])) begin
							max_or_min <= data_buff[8*(row) + (col)];
						end
						else begin
						end
						counter <= 1'b1;
						busy <= 1'b1;
					end
					else begin
						data_buff[8*(row-1)+(col-1)] <= max_or_min;
						data_buff[8*(row-1)+(col)] <= max_or_min;
						data_buff[8*(row)+(col-1)] <= max_or_min;
						data_buff[8*(row)+(col)] <= max_or_min;
						counter <= 1'b0;
						busy <= 1'b0;
						cur_state <= WAIT_CMD;
						next_state <= WAIT_CMD;
					end
				end
				MIN : begin
					if(counter == 1'b0) begin
						if((data_buff[8*(row-1)+(col-1)] <= data_buff[8*(row-1)+(col)]) && (data_buff[8*(row-1)+(col-1)] <= data_buff[8*(row)+(col-1)]) && (data_buff[8*(row-1)+(col-1)] <= data_buff[8*(row)+(col)])) begin
							max_or_min <= data_buff[8*(row-1) + (col-1)];
						end
						else begin
						end
						if((data_buff[8*(row-1)+(col)] <= data_buff[8*(row-1)+(col-1)]) && (data_buff[8*(row-1)+(col)] <= data_buff[8*(row)+(col-1)]) && (data_buff[8*(row-1)+(col)] <= data_buff[8*(row)+(col)])) begin
							max_or_min <= data_buff[8*(row-1) + (col)];
						end
						else begin
						end
						if((data_buff[8*(row)+(col-1)] <= data_buff[8*(row-1)+(col-1)]) && (data_buff[8*(row)+(col-1)] <= data_buff[8*(row-1)+(col)]) && (data_buff[8*(row)+(col-1)] <= data_buff[8*(row)+(col)])) begin
							max_or_min <= data_buff[8*(row) + (col-1)];
						end
						else begin
						end
						if((data_buff[8*(row)+(col)] <= data_buff[8*(row-1)+(col-1)]) && (data_buff[8*(row)+(col)] <= data_buff[8*(row-1)+(col)]) && (data_buff[8*(row)+(col)] <= data_buff[8*(row)+(col-1)])) begin
							max_or_min <= data_buff[8*(row) + (col)];
						end
						else begin
						end
						counter <= 1'b1;
					end
					else begin
						data_buff[8*(row-1)+(col-1)] <= max_or_min;
						data_buff[8*(row-1)+(col)] <= max_or_min;
						data_buff[8*(row)+(col-1)] <= max_or_min;
						data_buff[8*(row)+(col)] <= max_or_min;
						counter <= 1'b0;
						busy <= 1'b0;
						cur_state <= WAIT_CMD;
						next_state <= WAIT_CMD;
					end
				end
				AVERAGE : begin
					if(counter == 1'b0) begin
						average <= data_buff[8*(row-1)+(col-1)]+data_buff[8*(row-1)+(col)]+data_buff[8*(row)+(col-1)]+data_buff[8*(row)+(col)];
						counter <= 1'b1;
					end
					else begin
						data_buff[8*(row-1)+(col-1)] <= average[9:2];
						data_buff[8*(row-1)+(col)] <= average[9:2];
						data_buff[8*(row)+(col-1)] <= average[9:2];
						data_buff[8*(row)+(col)] <= average[9:2];
						counter <= 1'b0;
						busy <= 1'b0;
						cur_state <= WAIT_CMD;
						next_state <= WAIT_CMD;
					end
				end
				COUNTERCLOCKWISE_ROTATION : begin
					/*if(counter == 1'b0) begin
						data_buff[8*(row-1)+(col-1)] <= data_buff[8*(row-1)+(col)];
						data_buff[8*(row-1)+(col)] <= data_buff[8*(row)+(col)];
						data_buff[8*(row)+(col-1)] <= data_buff[8*(row-1)+(col-1)];
						data_buff[8*(row)+(col)] <= data_buff[8*(row)+(col-1)];
						counter <= 1'b1;
					end
					else begin
						busy <= 1'b0;
						counter <= 1'b0;
						cur_state <= WAIT_CMD;
						next_state <= WAIT_CMD;
					end*/
					data_buff[8*(row-1)+(col-1)] <= data_buff[8*(row-1)+(col)];
					data_buff[8*(row-1)+(col)] <= data_buff[8*(row)+(col)];
					data_buff[8*(row)+(col-1)] <= data_buff[8*(row-1)+(col-1)];
					data_buff[8*(row)+(col)] <= data_buff[8*(row)+(col-1)];
					busy <= 1'b0;
					cur_state <= WAIT_CMD;
					next_state <= WAIT_CMD;
					
				end
				CLOCKWISE_ROTATION : begin
					/*
					if(counter == 1'b0) begin
						data_buff[8*(row-1)+(col-1)] <= data_buff[8*(row)+(col-1)];
						data_buff[8*(row-1)+(col)] <= data_buff[8*(row-1)+(col-1)];
						data_buff[8*(row)+(col-1)] <= data_buff[8*(row)+(col)];
						data_buff[8*(row)+(col)] <= data_buff[8*(row-1)+(col)];
						counter <= 1'b1;
					end
					else begin
						busy <= 1'b0;
						counter <= 1'b0;
						cur_state <= WAIT_CMD;
						next_state <= WAIT_CMD;
					end
					*/
					data_buff[8*(row-1)+(col-1)] <= data_buff[8*(row)+(col-1)];
					data_buff[8*(row-1)+(col)] <= data_buff[8*(row-1)+(col-1)];
					data_buff[8*(row)+(col-1)] <= data_buff[8*(row)+(col)];
					data_buff[8*(row)+(col)] <= data_buff[8*(row-1)+(col)];
					busy <= 1'b0;
					cur_state <= WAIT_CMD;
					next_state <= WAIT_CMD;
				end
				MIRROR_X : begin
					if(counter == 1'b0) begin
						data_buff[8*(row-1)+(col-1)] <= data_buff[8*(row)+(col-1)];
						data_buff[8*(row-1)+(col)] <= data_buff[8*(row)+(col)];
						data_buff[8*(row)+(col-1)] <= data_buff[8*(row-1)+(col-1)];
						data_buff[8*(row)+(col)] <= data_buff[8*(row-1)+(col)];
						counter <= 1'b1;
					end
					else begin
						busy <= 1'b0;
						counter <= 1'b0;
						cur_state <= WAIT_CMD;
						next_state <= WAIT_CMD;
					end
				end
				MIRROR_Y : begin
					if(counter == 1'b0) begin
						data_buff[8*(row-1)+(col-1)] <= data_buff[8*(row-1)+(col)];
						data_buff[8*(row-1)+(col)] <= data_buff[8*(row-1)+(col-1)];
						data_buff[8*(row)+(col-1)] <= data_buff[8*(row)+(col)];
						data_buff[8*(row)+(col)] <= data_buff[8*(row)+(col-1)];
						counter <= 1'b1;
					end
					else begin
						busy <= 1'b0;
						counter <= 1'b0;
						cur_state <= WAIT_CMD;
						next_state <= WAIT_CMD;
					end
				end
				default : begin
				end
			endcase
		end
		
		/////////////////////////
		if(IROM_rd == 1'b1) begin	// end of read
			if(io_counter > 7'd64) begin
				IROM_rd <= 1'b0;
				busy <= 1'b0;
				io_counter <= 7'd0;
			end
			else begin
				IROM_A <= IROM_A+1'b1;
				io_counter <= io_counter+1'b1;
				if(io_counter >= 1) begin
					data_buff[IROM_A] <= IROM_Q;
				end
				else begin
				end
			end
		end
		else begin
		end
			
		if(IRAM_valid == 1'b1 && delay) begin	//end of write
			if(io_counter > 7'd62) begin
				IRAM_valid <= 1'b0;
				busy <= 1'b0;
				done <= 1'b1;
			end
			else begin
				IRAM_D <= data_buff[IRAM_A+1];
			end
		end
		else begin
		end
		/////////////////
		if(IRAM_valid == 1'b1 && !delay) begin
			delay <= 1;
			IRAM_D <= data_buff[0];
		end
		else begin
		end
		if(IRAM_valid == 1'b1 && delay) begin
			IRAM_A <= IRAM_A+1'b1;
			io_counter <= io_counter+1'b1;
		end
		else begin
		end
	end
	
	
	
	
end


endmodule
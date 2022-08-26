module huffman(clk, reset, gray_valid, gray_data, CNT_valid, CNT1, CNT2, CNT3, CNT4, CNT5, CNT6,
    code_valid, HC1, HC2, HC3, HC4, HC5, HC6, M1, M2, M3, M4, M5, M6);

input clk;
input reset;
input gray_valid;
input [7:0] gray_data;
output reg CNT_valid;
output reg [7:0] CNT1, CNT2, CNT3, CNT4, CNT5, CNT6;
output reg code_valid;
output reg [7:0] HC1, HC2, HC3, HC4, HC5, HC6;
output reg [7:0] M1, M2, M3, M4, M5, M6;

reg [2:0] state;
reg [6:0] arr [0:5];
reg [2:0] arr_index [0:5];
reg /*[2:0]*/ tree_index;


always@(posedge clk or posedge reset) begin
	if(reset) begin
		state <= 0;
		CNT_valid <= 0;
		CNT1 <= 0;
		CNT2 <= 0;
		CNT3 <= 0;
		CNT4 <= 0;
		CNT5 <= 0;
		CNT6 <= 0;
		HC1 <= 0;
		HC2 <= 0;
		HC3 <= 0;
		HC4 <= 0;
		HC5 <= 0;
		HC6 <= 0;
		M1 <= 0;
		M2 <= 0;
		M3 <= 0;
		M4 <= 0;
		M5 <= 0;
		M6 <= 0;
		code_valid <= 0;
		arr_index[0] <= 5;
		arr_index[1] <= 4;
		arr_index[2] <= 3;
		arr_index[3] <= 2;
		arr_index[4] <= 1;
		arr_index[5] <= 0;
		tree_index <= 0;
	end
	else begin
		case(state)
			0: begin
				if(gray_valid) begin
					case(gray_data)
						1: CNT1 <= CNT1+1;
						2: CNT2 <= CNT2+1;
						3: CNT3 <= CNT3+1;
						4: CNT4 <= CNT4+1;
						5: CNT5 <= CNT5+1;
						default: CNT6 <= CNT6+1;
					endcase
				end
				else if(CNT1) begin
					state <= state+1;
					CNT_valid <= 1;
					arr[0] <= CNT6;
					arr[1] <= CNT5;
					arr[2] <= CNT4;
					arr[3] <= CNT3;
					arr[4] <= CNT2;
					arr[5] <= CNT1;
				end
				else begin
				end
			end
			// sort
			1: begin
				CNT_valid <= 0;
				if(arr[0]>arr[1]) begin
					arr[0] <= arr[1];
					arr[1] <= arr[0];
					arr_index[0] <= arr_index[1];
					arr_index[1] <= arr_index[0];
					state <= 1;
				end
				else begin
					state <= state+1;
				end
			end
			2: begin
				if(arr[1]>arr[2]) begin
					arr[1] <= arr[2];
					arr[2] <= arr[1];
					arr_index[1] <= arr_index[2];
					arr_index[2] <= arr_index[1];
					state <= 1;
				end
				else begin
					state <= state+1;
				end
			end
			3: begin
				if(arr[2]>arr[3]) begin
					arr[2] <= arr[3];
					arr[3] <= arr[2];
					arr_index[2] <= arr_index[3];
					arr_index[3] <= arr_index[2];
					state <= 1;
				end
				else begin
					state <= state+1;
				end
			end
			4: begin
				if(arr[3]>arr[4]) begin
					arr[3] <= arr[4];
					arr[4] <= arr[3];
					arr_index[3] <= arr_index[4];
					arr_index[4] <= arr_index[3];
					state <= 1;
				end
				else begin
					state <= state+1;
				end
			end
			5: begin
				if(arr[4]>arr[5]) begin
					arr[4] <= arr[5];
					arr[5] <= arr[4];
					arr_index[4] <= arr_index[5];
					arr_index[5] <= arr_index[4];
					state <= 1;
				end
				else if(M1&&M2&&M3&&M4&&M5&&M6) begin
					// finish
					code_valid <= 1;
				end
				else begin
					state <= state+1;
				end
			end
			// C1
			6: begin
				// 補1
				case(arr_index[0])
					0: begin // 1
						M1[0] <= 1;
						HC1[0] <= 1;
					end
					1: begin // 2
						M2[0] <= 1;
						HC2[0] <= 1;
					end
					2: begin // 3
						M3[0] <= 1;
						HC3[0] <= 1;
					end
					3: begin // 4
						M4[0] <= 1;
						HC4[0] <= 1;
					end
					4: begin // 5
						M5[0] <= 1;
						HC5[0] <= 1;
					end
					5: begin // 6
						M6[0] <= 1;
						HC6[0] <= 1;
					end
					default: begin // 7~
						if(M1 && (arr_index[0]-6)==M1[7:5]) begin
							M1 <= {3'b000, M1[3:0], 1'b1};
							HC1 <= ({M1[6:0], 1'b1}^M1) | HC1;
						end
						if(M2 && (arr_index[0]-6)==M2[7:5]) begin
							M2 <= {3'b000, M2[3:0], 1'b1};
							HC2 <= ({M2[6:0], 1'b1}^M2) | HC2;
						end
						if(M3 && (arr_index[0]-6)==M3[7:5]) begin
							M3 <= {3'b000, M3[3:0], 1'b1};
							HC3 <= ({M3[6:0], 1'b1}^M3) | HC3;
						end
						if(M4 && (arr_index[0]-6)==M4[7:5]) begin
							M4 <= {3'b000, M4[3:0], 1'b1};
							HC4 <= ({M4[6:0], 1'b1}^M4) | HC4;
						end
						if(M5 && (arr_index[0]-6)==M5[7:5]) begin
							M5 <= {3'b000, M5[3:0], 1'b1};
							HC5 <= ({M5[6:0], 1'b1}^M5) | HC5;
						end
						if(M6 && (arr_index[0]-6)==M6[7:5]) begin
							M6 <= {3'b000, M6[3:0], 1'b1};
							HC6 <= ({M6[6:0], 1'b1}^M6) | HC6;
						end
					end
				endcase
				// 補0
				case(arr_index[1])
					0: begin // 1
						M1[0] <= 1;
						HC1[0] <= 0;
					end
					1: begin // 2
						M2[0] <= 1;
						HC2[0] <= 0;
					end
					2: begin // 3
						M3[0] <= 1;
						HC3[0] <= 0;
					end
					3: begin // 4
						M4[0] <= 1;
						HC4[0] <= 0;
					end
					4: begin // 5
						M5[0] <= 1;
						HC5[0] <= 0;
					end
					5: begin // 6
						M6[0] <= 1;
						HC6[0] <= 0;
					end
					default: begin // 7~
						if(M1 && (arr_index[1]-6)==M1[7:5]) begin
							M1 <= {3'b000, M1[3:0], 1'b1};
						end
						if(M2 && (arr_index[1]-6)==M2[7:5]) begin
							M2 <= {3'b000, M2[3:0], 1'b1};
						end
						if(M3 && (arr_index[1]-6)==M3[7:5]) begin
							M3 <= {3'b000, M3[3:0], 1'b1};
						end
						if(M4 && (arr_index[1]-6)==M4[7:5]) begin
							M4 <= {3'b000, M4[3:0], 1'b1};
						end
						if(M5 && (arr_index[1]-6)==M5[7:5]) begin
							M5 <= {3'b000, M5[3:0], 1'b1};
						end
						if(M6 && (arr_index[1]-6)==M6[7:5]) begin
							M6 <= {3'b000, M6[3:0], 1'b1};
						end
					end
				endcase
				
				state <= state+1;
			end
			
			7: begin
				arr[0] <= arr[0]+arr[1];
				arr[1] <= arr[2];
				arr[2] <= arr[3];
				arr[3] <= arr[4];
				arr[4] <= arr[5];
				arr[5] <= 8'b11111111;
				
				arr_index[0] <= (arr_index[0]<6 && arr_index[1]<6) ? tree_index+6:6;
				arr_index[1] <= arr_index[2];
				arr_index[2] <= arr_index[3];
				arr_index[3] <= arr_index[4];
				arr_index[4] <= arr_index[5];
				
				// tree_index (M1[7:5])
				// new tree
				if(arr_index[0]<6 && arr_index[1]<6) begin
					tree_index <= tree_index+1;
					case(arr_index[0])
						0: M1[7:5] <= tree_index;
						1: M2[7:5] <= tree_index;
						2: M3[7:5] <= tree_index;
						3: M4[7:5] <= tree_index;
						4: M5[7:5] <= tree_index;
						default: M6[7:5] <= tree_index;
					endcase
					case(arr_index[1])
						0: M1[7:5] <= tree_index;
						1: M2[7:5] <= tree_index;
						2: M3[7:5] <= tree_index;
						3: M4[7:5] <= tree_index;
						4: M5[7:5] <= tree_index;
						default: M6[7:5] <= tree_index;
					endcase
				end
				
				// sort
				state <= 1;
			end
			
		endcase
	end
end
  
endmodule
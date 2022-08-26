`timescale 1ns/10ps
/*
 * IC Contest Computational System (CS)
*/
module CS(Y, X, reset, clk);

input clk, reset; 
input [7:0] X;
output [9:0] Y;

reg [7:0]temp [0:8];
wire [12:0] sum_temp;
reg [7:0] temp_appr;

integer i;

assign Y=(sum_temp+((temp_appr<<3)+temp_appr))>>3;
assign sum_temp = (temp[0]+temp[1]+temp[2]+temp[3]+temp[4]+temp[5]+temp[6]+temp[7]+temp[8]);


always @(sum_temp) begin
    temp_appr=0;
    for(i=0;i<9;i=i+1)begin
        if(((temp[i]<<3)+temp[i])<=sum_temp && (temp[i]>temp_appr))begin
            temp_appr = temp[i];
        end
        else begin
        end
    end
end

always@(posedge clk or posedge reset)begin
    if(reset)begin
        i<=0;
        temp_appr<=8'b11111111;
        temp[0]<=0;
        temp[1]<=0;
        temp[2]<=0;
        temp[3]<=0;
        temp[4]<=0;
        temp[5]<=0;
        temp[6]<=0;
        temp[7]<=0;
        temp[8]<=0;
    end
    else begin
        temp[0]<=X;
        temp[1]<=temp[0];
        temp[2]<=temp[1];
        temp[3]<=temp[2];
        temp[4]<=temp[3];
        temp[5]<=temp[4];
        temp[6]<=temp[5];
        temp[7]<=temp[6];
        temp[8]<=temp[7];
    end
end

 
endmodule

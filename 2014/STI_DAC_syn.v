/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : Q-2019.12
// Date      : Wed Mar 23 22:16:27 2022
/////////////////////////////////////////////////////////////


module STI_DAC_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module STI_DAC ( clk, reset, load, pi_data, pi_length, pi_fill, pi_msb, pi_low, 
        pi_end, so_data, so_valid, oem_finish, oem_dataout, oem_addr, odd1_wr, 
        odd2_wr, odd3_wr, odd4_wr, even1_wr, even2_wr, even3_wr, even4_wr );
  input [15:0] pi_data;
  input [1:0] pi_length;
  output [7:0] oem_dataout;
  output [4:0] oem_addr;
  input clk, reset, load, pi_fill, pi_msb, pi_low, pi_end;
  output so_data, so_valid, oem_finish, odd1_wr, odd2_wr, odd3_wr, odd4_wr,
         even1_wr, even2_wr, even3_wr, even4_wr;
  wire   N220, N221, N222, N224, n439, n440, n441, n442, n443, n444, n445,
         N237, N239, N240, N241, N276, N310, N311, N312, N313, N314, N315,
         N347, N432, N514, N522, N523, N524, N525, N526, N527, N530, N603,
         N604, N605, N606, N607, N608, N609, N610, N611, N612, N613, N614,
         n114, n115, n118, n119, n122, n123, n124, n125, n126, n127, n133,
         n135, n137, n138, n139, n140, n143, n156, n158, n160, n162, n164,
         n166, n168, n170, n171, n172, n174, n175, n176, n177, n178, n182,
         n183, n184, n185, n186, n187, n188, n189, n190, n191, n192, n193,
         n194, n195, n196, n197, n198, n199, n200, n201, n202, n203, n204,
         n205, n206, n243, n244, n245, n246, n247, n248, n249, n250, n284,
         n285, n286, n287, n288, n289, n290, n291, n292, n293, n294, n295,
         n296, n297, n298, n299, n300, n301, n302, n303, n304, n305, n306,
         n307, n308, n309, n310, n311, n312, n313, n314, n315, n316, n317,
         n318, n319, n320, n321, n322, n323, n324, n325, n326, n327, n328,
         n329, n330, n331, n332, n333, n334, n335, n336, n337, n338, n339,
         n340, n341, n342, n343, n344, n345, n346, n347, n348, n349, n350,
         n351, n352, n353, n354, n355, n356, n357, n358, n359, n360, n361,
         n362, n363, n364, n365, n366, n367, n368, n369, n370, n371, n372,
         n373, n374, n375, n376, n377, n378, n379, n380, n381, n382, n383,
         n384, n385, n386, n387, n388, n389, n390, n391, n392, n393, n394,
         n395, n396, n397, n398, n399, n400, n401, n402, n403, n404, n405,
         n406, n407, n408, n409, n410, n411, n412, n413, n414, n415, n416,
         n417, n418, n419, n420, n421, n422, n423, n424, n425, n426, n427,
         n428, n429, n430, n431, n432, n433, n434, n435, n436, n437, n438;
  wire   [5:0] count;
  wire   [2:0] state;
  wire   [7:0] addr;
  wire   [4:2] \add_245_S2/carry ;
  wire   [5:2] \r478/carry ;

  STI_DAC_DW01_inc_0 add_246 ( .A({addr[7:6], n432, addr[4], n424, addr[2:0]}), 
        .SUM({N614, N613, N612, N611, N610, N609, N608, N607}) );
  DFFNSRX1 \addr_reg[3]  ( .D(n164), .CKN(clk), .SN(1'b1), .RN(n438), .Q(n424)
         );
  DFFNSRX1 \addr_reg[5]  ( .D(n160), .CKN(clk), .SN(1'b1), .RN(n287), .Q(n432)
         );
  DFFNSRX1 \addr_reg[6]  ( .D(n158), .CKN(clk), .SN(1'b1), .RN(n287), .Q(
        addr[6]), .QN(n183) );
  DFFNSRX1 \addr_reg[4]  ( .D(n162), .CKN(clk), .SN(1'b1), .RN(n287), .Q(
        addr[4]), .QN(n135) );
  DFFNSRX1 \addr_reg[1]  ( .D(n168), .CKN(clk), .SN(1'b1), .RN(n438), .Q(
        addr[1]), .QN(n138) );
  DFFNSRX1 \addr_reg[0]  ( .D(n170), .CKN(clk), .SN(1'b1), .RN(n438), .Q(
        addr[0]), .QN(n139) );
  DFFNSRX1 \addr_reg[2]  ( .D(n166), .CKN(clk), .SN(1'b1), .RN(n438), .Q(
        addr[2]), .QN(n137) );
  DFFNSRX1 \addr_reg[7]  ( .D(n156), .CKN(clk), .SN(1'b1), .RN(n287), .Q(
        addr[7]), .QN(n182) );
  DFFNSRX1 \oem_addr_reg[4]  ( .D(n190), .CKN(clk), .SN(1'b1), .RN(n287), .QN(
        n246) );
  DFFNSRX1 \oem_addr_reg[3]  ( .D(n186), .CKN(clk), .SN(1'b1), .RN(n287), .QN(
        n245) );
  DFFNSRX1 \oem_addr_reg[2]  ( .D(n187), .CKN(clk), .SN(1'b1), .RN(n287), .QN(
        n244) );
  DFFNSRX1 \oem_addr_reg[1]  ( .D(n188), .CKN(clk), .SN(1'b1), .RN(n287), .QN(
        n243) );
  DFFNSRX1 even3_wr_reg ( .D(n192), .CKN(clk), .SN(1'b1), .RN(n438), .QN(n126)
         );
  DFFNSRX1 odd3_wr_reg ( .D(n196), .CKN(clk), .SN(1'b1), .RN(n438), .QN(n123)
         );
  DFFNSRX1 even1_wr_reg ( .D(n194), .CKN(clk), .SN(1'b1), .RN(n438), .QN(n437)
         );
  DFFRX1 \state_reg[1]  ( .D(n171), .CK(clk), .RN(n438), .Q(state[1]), .QN(
        n351) );
  DFFRX1 \state_reg[2]  ( .D(n172), .CK(clk), .RN(n438), .Q(state[2]), .QN(
        n352) );
  DFFRX1 \count_reg[4]  ( .D(N526), .CK(clk), .RN(n438), .Q(count[4]), .QN(
        n177) );
  DFFRX1 \count_reg[5]  ( .D(N527), .CK(clk), .RN(n438), .Q(count[5]), .QN(
        n176) );
  DFFRX1 so_valid_reg ( .D(n206), .CK(clk), .RN(n438), .Q(n440), .QN(n175) );
  DFFRX1 \oem_dataout_reg[7]  ( .D(n197), .CK(clk), .RN(n438), .Q(n442), .QN(
        n122) );
  DFFRX1 \oem_dataout_reg[4]  ( .D(n200), .CK(clk), .RN(n438), .Q(n443), .QN(
        n119) );
  DFFRX1 \oem_dataout_reg[3]  ( .D(n201), .CK(clk), .RN(n438), .Q(n444), .QN(
        n118) );
  DFFRX1 \oem_dataout_reg[0]  ( .D(n204), .CK(clk), .RN(n438), .Q(n445), .QN(
        n115) );
  DFFRX1 \oem_dataout_reg[6]  ( .D(n198), .CK(clk), .RN(n438), .QN(n249) );
  DFFRX1 \oem_dataout_reg[5]  ( .D(n199), .CK(clk), .RN(n438), .QN(n247) );
  DFFRX1 \oem_dataout_reg[2]  ( .D(n202), .CK(clk), .RN(n438), .QN(n250) );
  DFFRX1 \oem_dataout_reg[1]  ( .D(n203), .CK(clk), .RN(n438), .QN(n248) );
  DFFRX1 so_data_reg ( .D(n205), .CK(clk), .RN(n438), .Q(n439), .QN(n114) );
  DFFRX1 oem_finish_reg ( .D(n143), .CK(clk), .RN(n438), .Q(n441), .QN(n140)
         );
  DFFNSRX1 \oem_addr_reg[0]  ( .D(n189), .CKN(clk), .SN(1'b1), .RN(n438), .QN(
        n284) );
  DFFRX2 \count_reg[0]  ( .D(N522), .CK(clk), .RN(n438), .Q(N220), .QN(n316)
         );
  DFFRX2 \count_reg[1]  ( .D(N523), .CK(clk), .RN(n438), .Q(N221), .QN(n317)
         );
  DFFNSRX1 odd1_wr_reg ( .D(n185), .CKN(clk), .SN(1'b1), .RN(n438), .QN(n436)
         );
  DFFNSRX1 even4_wr_reg ( .D(n191), .CKN(clk), .SN(1'b1), .RN(n438), .QN(n127)
         );
  DFFNSRX1 odd4_wr_reg ( .D(n195), .CKN(clk), .SN(1'b1), .RN(n438), .QN(n124)
         );
  DFFNSRX1 even2_wr_reg ( .D(n193), .CKN(clk), .SN(1'b1), .RN(n438), .QN(n125)
         );
  DFFNSRX1 odd2_wr_reg ( .D(n184), .CKN(clk), .SN(1'b1), .RN(n438), .QN(n133)
         );
  DFFRX2 \count_reg[3]  ( .D(N525), .CK(clk), .RN(n438), .Q(N224), .QN(n178)
         );
  DFFRX2 \state_reg[0]  ( .D(n174), .CK(clk), .RN(n438), .Q(state[0]), .QN(
        n353) );
  DFFRX2 \count_reg[2]  ( .D(N524), .CK(clk), .RN(n438), .Q(N222), .QN(n346)
         );
  INVX12 U185 ( .A(n133), .Y(odd2_wr) );
  INVX12 U186 ( .A(n125), .Y(even2_wr) );
  INVX12 U187 ( .A(n124), .Y(odd4_wr) );
  INVX12 U188 ( .A(n127), .Y(even4_wr) );
  INVX12 U189 ( .A(n436), .Y(odd1_wr) );
  INVX12 U190 ( .A(n437), .Y(even1_wr) );
  INVX12 U191 ( .A(n123), .Y(odd3_wr) );
  INVX12 U192 ( .A(n126), .Y(even3_wr) );
  NAND2XL U193 ( .A(n316), .B(n317), .Y(n368) );
  OAI211XL U194 ( .A0(n393), .A1(N224), .B0(n399), .C0(n346), .Y(n417) );
  AOI2BB1XL U195 ( .A0N(n346), .A1N(n359), .B0(N224), .Y(n435) );
  INVX12 U196 ( .A(n248), .Y(oem_dataout[1]) );
  INVX12 U197 ( .A(n250), .Y(oem_dataout[2]) );
  INVX12 U198 ( .A(n247), .Y(oem_dataout[5]) );
  INVX12 U199 ( .A(n249), .Y(oem_dataout[6]) );
  INVX16 U200 ( .A(n284), .Y(oem_addr[0]) );
  INVX16 U201 ( .A(n246), .Y(oem_addr[4]) );
  INVX16 U202 ( .A(n243), .Y(oem_addr[1]) );
  INVX16 U203 ( .A(n244), .Y(oem_addr[2]) );
  INVX16 U204 ( .A(n245), .Y(oem_addr[3]) );
  INVX6 U205 ( .A(reset), .Y(n438) );
  MX2XL U215 ( .A(oem_addr[1]), .B(N603), .S0(n421), .Y(n188) );
  NOR3BX1 U216 ( .AN(n422), .B(n286), .C(addr[0]), .Y(n421) );
  INVX3 U217 ( .A(n286), .Y(n423) );
  BUFX12 U218 ( .A(n440), .Y(so_valid) );
  BUFX12 U219 ( .A(n442), .Y(oem_dataout[7]) );
  BUFX12 U220 ( .A(n443), .Y(oem_dataout[4]) );
  BUFX12 U221 ( .A(n444), .Y(oem_dataout[3]) );
  BUFX12 U222 ( .A(n445), .Y(oem_dataout[0]) );
  BUFX12 U223 ( .A(n441), .Y(oem_finish) );
  BUFX12 U224 ( .A(n439), .Y(so_data) );
  NAND2XL U225 ( .A(oem_dataout[5]), .B(n354), .Y(n371) );
  NAND2XL U226 ( .A(oem_dataout[1]), .B(n354), .Y(n361) );
  NAND2XL U227 ( .A(oem_dataout[6]), .B(n354), .Y(n373) );
  NAND2XL U228 ( .A(oem_dataout[2]), .B(n354), .Y(n364) );
  MX2XL U229 ( .A(oem_addr[2]), .B(N604), .S0(n421), .Y(n187) );
  MX2XL U230 ( .A(oem_addr[3]), .B(N605), .S0(n421), .Y(n186) );
  MXI2XL U231 ( .A(n284), .B(oem_addr[0]), .S0(n421), .Y(n189) );
  MX2XL U232 ( .A(oem_addr[4]), .B(N606), .S0(n421), .Y(n190) );
  XOR2XL U233 ( .A(\add_245_S2/carry [4]), .B(oem_addr[4]), .Y(N606) );
  NOR3X2 U234 ( .A(state[0]), .B(state[2]), .C(state[1]), .Y(n350) );
  CLKBUFX3 U235 ( .A(n438), .Y(n287) );
  CLKBUFX3 U236 ( .A(n417), .Y(n286) );
  CLKBUFX3 U237 ( .A(n357), .Y(n285) );
  CLKINVX1 U238 ( .A(n379), .Y(n357) );
  NAND2X2 U239 ( .A(n377), .B(state[2]), .Y(n354) );
  ADDHXL U240 ( .A(oem_addr[1]), .B(oem_addr[0]), .CO(\add_245_S2/carry [2]), 
        .S(N603) );
  ADDHXL U241 ( .A(oem_addr[2]), .B(\add_245_S2/carry [2]), .CO(
        \add_245_S2/carry [3]), .S(N604) );
  ADDHXL U242 ( .A(oem_addr[3]), .B(\add_245_S2/carry [3]), .CO(
        \add_245_S2/carry [4]), .S(N605) );
  NOR2X1 U243 ( .A(N220), .B(n350), .Y(N522) );
  ADDHXL U244 ( .A(N221), .B(N220), .CO(\r478/carry [2]), .S(N310) );
  ADDHXL U245 ( .A(N222), .B(\r478/carry [2]), .CO(\r478/carry [3]), .S(N311)
         );
  ADDHXL U246 ( .A(N224), .B(\r478/carry [3]), .CO(\r478/carry [4]), .S(N312)
         );
  ADDHXL U247 ( .A(count[4]), .B(\r478/carry [4]), .CO(\r478/carry [5]), .S(
        N313) );
  XOR2X1 U248 ( .A(\r478/carry [5]), .B(count[5]), .Y(N314) );
  NOR2X1 U249 ( .A(N221), .B(n316), .Y(n297) );
  NOR2X1 U250 ( .A(N221), .B(N220), .Y(n296) );
  NOR2X1 U251 ( .A(N220), .B(n317), .Y(n294) );
  NOR2X1 U252 ( .A(n316), .B(n317), .Y(n293) );
  AO22X1 U253 ( .A0(pi_data[5]), .A1(n294), .B0(pi_data[4]), .B1(n293), .Y(
        n288) );
  AOI221XL U254 ( .A0(pi_data[6]), .A1(n297), .B0(pi_data[7]), .B1(n296), .C0(
        n288), .Y(n291) );
  AO22X1 U255 ( .A0(pi_data[1]), .A1(n294), .B0(pi_data[0]), .B1(n293), .Y(
        n289) );
  AOI221XL U256 ( .A0(pi_data[2]), .A1(n297), .B0(pi_data[3]), .B1(n296), .C0(
        n289), .Y(n290) );
  OA22X1 U257 ( .A0(N222), .A1(n291), .B0(n346), .B1(n290), .Y(n301) );
  AO22X1 U258 ( .A0(pi_data[13]), .A1(n294), .B0(pi_data[12]), .B1(n293), .Y(
        n292) );
  AOI221XL U259 ( .A0(pi_data[14]), .A1(n297), .B0(pi_data[15]), .B1(n296), 
        .C0(n292), .Y(n299) );
  AO22X1 U260 ( .A0(pi_data[9]), .A1(n294), .B0(pi_data[8]), .B1(n293), .Y(
        n295) );
  AOI221XL U261 ( .A0(pi_data[10]), .A1(n297), .B0(pi_data[11]), .B1(n296), 
        .C0(n295), .Y(n298) );
  OAI22XL U262 ( .A0(n299), .A1(N222), .B0(n346), .B1(n298), .Y(n300) );
  OAI2BB2XL U263 ( .B0(n301), .B1(n178), .A0N(n178), .A1N(n300), .Y(N240) );
  NOR2X1 U264 ( .A(n317), .B(N220), .Y(n311) );
  NOR2X1 U265 ( .A(n317), .B(n316), .Y(n310) );
  NOR2X1 U266 ( .A(n316), .B(N221), .Y(n308) );
  NOR2X1 U267 ( .A(N220), .B(N221), .Y(n307) );
  AO22X1 U268 ( .A0(pi_data[5]), .A1(n308), .B0(pi_data[4]), .B1(n307), .Y(
        n302) );
  AOI221XL U269 ( .A0(pi_data[6]), .A1(n311), .B0(pi_data[7]), .B1(n310), .C0(
        n302), .Y(n305) );
  AO22X1 U270 ( .A0(pi_data[1]), .A1(n308), .B0(pi_data[0]), .B1(n307), .Y(
        n303) );
  AOI221XL U271 ( .A0(pi_data[2]), .A1(n311), .B0(pi_data[3]), .B1(n310), .C0(
        n303), .Y(n304) );
  OA22X1 U272 ( .A0(n346), .A1(n305), .B0(N222), .B1(n304), .Y(n315) );
  AO22X1 U273 ( .A0(pi_data[13]), .A1(n308), .B0(pi_data[12]), .B1(n307), .Y(
        n306) );
  AOI221XL U274 ( .A0(pi_data[14]), .A1(n311), .B0(pi_data[15]), .B1(n310), 
        .C0(n306), .Y(n313) );
  AO22X1 U275 ( .A0(pi_data[9]), .A1(n308), .B0(pi_data[8]), .B1(n307), .Y(
        n309) );
  AOI221XL U276 ( .A0(pi_data[10]), .A1(n311), .B0(pi_data[11]), .B1(n310), 
        .C0(n309), .Y(n312) );
  OAI22XL U277 ( .A0(n313), .A1(n346), .B0(N222), .B1(n312), .Y(n314) );
  OAI2BB2XL U278 ( .B0(n315), .B1(N224), .A0N(N224), .A1N(n314), .Y(N241) );
  NOR2X1 U279 ( .A(N221), .B(n316), .Y(n327) );
  NOR2X1 U280 ( .A(N221), .B(N220), .Y(n326) );
  NOR2X1 U281 ( .A(N220), .B(n317), .Y(n324) );
  NOR2X1 U282 ( .A(n316), .B(n317), .Y(n323) );
  AO22X1 U283 ( .A0(pi_data[5]), .A1(n324), .B0(pi_data[4]), .B1(n323), .Y(
        n318) );
  AOI221XL U284 ( .A0(pi_data[6]), .A1(n327), .B0(pi_data[7]), .B1(n326), .C0(
        n318), .Y(n321) );
  AO22X1 U285 ( .A0(pi_data[1]), .A1(n324), .B0(pi_data[0]), .B1(n323), .Y(
        n319) );
  AOI221XL U286 ( .A0(pi_data[2]), .A1(n327), .B0(pi_data[3]), .B1(n326), .C0(
        n319), .Y(n320) );
  OA22X1 U287 ( .A0(N222), .A1(n321), .B0(n346), .B1(n320), .Y(n331) );
  AO22X1 U288 ( .A0(pi_data[13]), .A1(n324), .B0(pi_data[12]), .B1(n323), .Y(
        n322) );
  AOI221XL U289 ( .A0(pi_data[14]), .A1(n327), .B0(pi_data[15]), .B1(n326), 
        .C0(n322), .Y(n329) );
  AO22X1 U290 ( .A0(pi_data[9]), .A1(n324), .B0(pi_data[8]), .B1(n323), .Y(
        n325) );
  AOI221XL U291 ( .A0(pi_data[10]), .A1(n327), .B0(pi_data[11]), .B1(n326), 
        .C0(n325), .Y(n328) );
  OAI22XL U292 ( .A0(n329), .A1(N222), .B0(n346), .B1(n328), .Y(n330) );
  OAI2BB2XL U293 ( .B0(n331), .B1(N224), .A0N(N224), .A1N(n330), .Y(N237) );
  NOR2X1 U294 ( .A(n317), .B(N220), .Y(n341) );
  NOR2X1 U295 ( .A(n317), .B(n316), .Y(n340) );
  NOR2X1 U296 ( .A(n316), .B(N221), .Y(n338) );
  NOR2X1 U297 ( .A(N220), .B(N221), .Y(n337) );
  AO22X1 U298 ( .A0(pi_data[5]), .A1(n338), .B0(pi_data[4]), .B1(n337), .Y(
        n332) );
  AOI221XL U299 ( .A0(pi_data[6]), .A1(n341), .B0(pi_data[7]), .B1(n340), .C0(
        n332), .Y(n335) );
  AO22X1 U300 ( .A0(pi_data[1]), .A1(n338), .B0(pi_data[0]), .B1(n337), .Y(
        n333) );
  AOI221XL U301 ( .A0(pi_data[2]), .A1(n341), .B0(pi_data[3]), .B1(n340), .C0(
        n333), .Y(n334) );
  OA22X1 U302 ( .A0(n346), .A1(n335), .B0(N222), .B1(n334), .Y(n345) );
  AO22X1 U303 ( .A0(pi_data[13]), .A1(n338), .B0(pi_data[12]), .B1(n337), .Y(
        n336) );
  AOI221XL U304 ( .A0(pi_data[14]), .A1(n341), .B0(pi_data[15]), .B1(n340), 
        .C0(n336), .Y(n343) );
  AO22X1 U305 ( .A0(pi_data[9]), .A1(n338), .B0(pi_data[8]), .B1(n337), .Y(
        n339) );
  AOI221XL U306 ( .A0(pi_data[10]), .A1(n341), .B0(pi_data[11]), .B1(n340), 
        .C0(n339), .Y(n342) );
  OAI22XL U307 ( .A0(n343), .A1(n346), .B0(N222), .B1(n342), .Y(n344) );
  OAI2BB2XL U308 ( .B0(n345), .B1(n178), .A0N(n178), .A1N(n344), .Y(N239) );
  AOI22X1 U309 ( .A0(N347), .A1(n353), .B0(N432), .B1(state[0]), .Y(n348) );
  AOI33X1 U310 ( .A0(state[2]), .A1(n353), .A2(N514), .B0(state[0]), .B1(n352), 
        .B2(N315), .Y(n347) );
  OAI32X1 U311 ( .A0(n348), .A1(state[2]), .A2(n351), .B0(state[1]), .B1(n347), 
        .Y(n349) );
  AO21X1 U312 ( .A0(N276), .A1(n350), .B0(n349), .Y(N530) );
  NOR2BX1 U313 ( .AN(N310), .B(n350), .Y(N523) );
  NOR2BX1 U314 ( .AN(N311), .B(n350), .Y(N524) );
  NOR2BX1 U315 ( .AN(N312), .B(n350), .Y(N525) );
  NOR2BX1 U316 ( .AN(N313), .B(n350), .Y(N526) );
  NOR2BX1 U317 ( .AN(N314), .B(n350), .Y(N527) );
  OAI21XL U318 ( .A0(n354), .A1(n175), .B0(n355), .Y(n206) );
  CLKINVX1 U319 ( .A(n356), .Y(n355) );
  OAI21XL U320 ( .A0(n356), .A1(n114), .B0(n285), .Y(n205) );
  MXI2X1 U321 ( .A(n285), .B(n115), .S0(n358), .Y(n204) );
  OA21XL U322 ( .A0(n359), .A1(n360), .B0(n354), .Y(n358) );
  MXI2X1 U323 ( .A(n361), .B(n285), .S0(n362), .Y(n203) );
  NOR2X1 U324 ( .A(n363), .B(n360), .Y(n362) );
  MXI2X1 U325 ( .A(n364), .B(n285), .S0(n365), .Y(n202) );
  NOR2X1 U326 ( .A(n366), .B(n360), .Y(n365) );
  MXI2X1 U327 ( .A(n285), .B(n118), .S0(n367), .Y(n201) );
  OA21XL U328 ( .A0(n368), .A1(n360), .B0(n354), .Y(n367) );
  NAND2X1 U329 ( .A(N222), .B(n356), .Y(n360) );
  MXI2X1 U330 ( .A(n285), .B(n119), .S0(n369), .Y(n200) );
  OA21XL U331 ( .A0(n359), .A1(n370), .B0(n354), .Y(n369) );
  MXI2X1 U332 ( .A(n371), .B(n285), .S0(n372), .Y(n199) );
  NOR2X1 U333 ( .A(n363), .B(n370), .Y(n372) );
  MXI2X1 U334 ( .A(n373), .B(n285), .S0(n374), .Y(n198) );
  NOR2X1 U335 ( .A(n366), .B(n370), .Y(n374) );
  CLKINVX1 U336 ( .A(n375), .Y(n366) );
  MXI2X1 U337 ( .A(n285), .B(n122), .S0(n376), .Y(n197) );
  OA21XL U338 ( .A0(n368), .A1(n370), .B0(n354), .Y(n376) );
  NAND2X1 U339 ( .A(n346), .B(n356), .Y(n370) );
  NAND2X1 U340 ( .A(n377), .B(n378), .Y(n356) );
  OAI31XL U341 ( .A0(n380), .A1(n381), .A2(n382), .B0(n383), .Y(n379) );
  CLKMX2X2 U342 ( .A(n384), .B(n385), .S0(pi_msb), .Y(n383) );
  AOI32X1 U343 ( .A0(n386), .A1(n387), .A2(n388), .B0(N240), .B1(n389), .Y(
        n385) );
  OAI221XL U344 ( .A0(state[0]), .A1(n381), .B0(n378), .B1(n387), .C0(n390), 
        .Y(n389) );
  MXI2X1 U345 ( .A(n391), .B(n392), .S0(pi_fill), .Y(n390) );
  NOR2X1 U346 ( .A(n377), .B(n393), .Y(n392) );
  NOR2X1 U347 ( .A(n394), .B(n395), .Y(n391) );
  MXI2X1 U348 ( .A(n396), .B(n397), .S0(n346), .Y(n388) );
  AOI221XL U349 ( .A0(pi_data[5]), .A1(n398), .B0(pi_data[7]), .B1(n399), .C0(
        n400), .Y(n397) );
  AO22X1 U350 ( .A0(pi_data[6]), .A1(n375), .B0(pi_data[4]), .B1(n401), .Y(
        n400) );
  AOI221XL U351 ( .A0(pi_data[1]), .A1(n398), .B0(pi_data[3]), .B1(n399), .C0(
        n402), .Y(n396) );
  AO22X1 U352 ( .A0(pi_data[2]), .A1(n375), .B0(pi_data[0]), .B1(n401), .Y(
        n402) );
  CLKINVX1 U353 ( .A(pi_low), .Y(n387) );
  AOI32X1 U354 ( .A0(pi_low), .A1(n386), .A2(n403), .B0(N241), .B1(n404), .Y(
        n384) );
  OAI221XL U355 ( .A0(state[0]), .A1(n381), .B0(pi_low), .B1(n378), .C0(n405), 
        .Y(n404) );
  MXI2X1 U356 ( .A(n406), .B(n407), .S0(n394), .Y(n405) );
  NOR2X1 U357 ( .A(pi_fill), .B(n377), .Y(n407) );
  NOR2X1 U358 ( .A(n408), .B(n395), .Y(n406) );
  MXI2X1 U359 ( .A(n409), .B(n410), .S0(n346), .Y(n403) );
  AOI221XL U360 ( .A0(pi_data[10]), .A1(n398), .B0(pi_data[8]), .B1(n399), 
        .C0(n411), .Y(n410) );
  AO22X1 U361 ( .A0(pi_data[9]), .A1(n375), .B0(pi_data[11]), .B1(n401), .Y(
        n411) );
  AOI221XL U362 ( .A0(pi_data[14]), .A1(n398), .B0(pi_data[12]), .B1(n399), 
        .C0(n412), .Y(n409) );
  AO22X1 U363 ( .A0(pi_data[13]), .A1(n375), .B0(pi_data[15]), .B1(n401), .Y(
        n412) );
  NOR2X1 U364 ( .A(N221), .B(n316), .Y(n375) );
  CLKINVX1 U365 ( .A(n363), .Y(n398) );
  NAND2X1 U366 ( .A(n316), .B(N221), .Y(n363) );
  CLKINVX1 U367 ( .A(n378), .Y(n386) );
  NAND3X1 U368 ( .A(n351), .B(n352), .C(state[0]), .Y(n378) );
  CLKMX2X2 U369 ( .A(n413), .B(n414), .S0(pi_msb), .Y(n382) );
  NAND2X1 U370 ( .A(N237), .B(n408), .Y(n414) );
  CLKINVX1 U371 ( .A(pi_fill), .Y(n408) );
  NAND2X1 U372 ( .A(pi_fill), .B(N239), .Y(n413) );
  OAI21XL U373 ( .A0(n393), .A1(N224), .B0(state[0]), .Y(n380) );
  OAI32X1 U374 ( .A0(n415), .A1(n182), .A2(n416), .B0(n286), .B1(n123), .Y(
        n196) );
  OAI32X1 U375 ( .A0(n418), .A1(n182), .A2(n416), .B0(n286), .B1(n124), .Y(
        n195) );
  OAI32X1 U376 ( .A0(n419), .A1(n420), .A2(n415), .B0(n437), .B1(n286), .Y(
        n194) );
  OAI32X1 U377 ( .A0(n419), .A1(n420), .A2(n418), .B0(n125), .B1(n286), .Y(
        n193) );
  OAI32X1 U378 ( .A0(n415), .A1(n182), .A2(n420), .B0(n126), .B1(n286), .Y(
        n192) );
  OAI32X1 U379 ( .A0(n418), .A1(n182), .A2(n420), .B0(n127), .B1(n286), .Y(
        n191) );
  CLKINVX1 U380 ( .A(n416), .Y(n420) );
  OAI32X1 U381 ( .A0(n419), .A1(n415), .A2(n416), .B0(n286), .B1(n436), .Y(
        n185) );
  NAND2X1 U382 ( .A(n183), .B(n423), .Y(n415) );
  OAI32X1 U383 ( .A0(n419), .A1(n418), .A2(n416), .B0(n286), .B1(n133), .Y(
        n184) );
  XNOR2X1 U384 ( .A(n424), .B(n139), .Y(n416) );
  NAND2X1 U385 ( .A(n423), .B(addr[6]), .Y(n418) );
  OAI22XL U386 ( .A0(N530), .A1(n353), .B0(n425), .B1(n426), .Y(n174) );
  NOR2BX1 U387 ( .AN(pi_length[0]), .B(pi_end), .Y(n425) );
  OAI22XL U388 ( .A0(N530), .A1(n352), .B0(n426), .B1(n427), .Y(n172) );
  AOI21X1 U389 ( .A0(pi_length[0]), .A1(pi_length[1]), .B0(pi_end), .Y(n427)
         );
  OAI32X1 U390 ( .A0(n426), .A1(pi_end), .A2(n428), .B0(N530), .B1(n351), .Y(
        n171) );
  XNOR2X1 U391 ( .A(pi_length[0]), .B(pi_length[1]), .Y(n428) );
  NAND4X1 U392 ( .A(N530), .B(n353), .C(n351), .D(n352), .Y(n426) );
  CLKMX2X2 U393 ( .A(addr[0]), .B(N607), .S0(n423), .Y(n170) );
  MXI2X1 U394 ( .A(n429), .B(n138), .S0(n286), .Y(n168) );
  CLKINVX1 U395 ( .A(N608), .Y(n429) );
  MXI2X1 U396 ( .A(n430), .B(n137), .S0(n286), .Y(n166) );
  CLKINVX1 U397 ( .A(N609), .Y(n430) );
  CLKMX2X2 U398 ( .A(n424), .B(N610), .S0(n423), .Y(n164) );
  MXI2X1 U399 ( .A(n431), .B(n135), .S0(n286), .Y(n162) );
  CLKINVX1 U400 ( .A(N611), .Y(n431) );
  CLKMX2X2 U401 ( .A(n432), .B(N612), .S0(n423), .Y(n160) );
  CLKMX2X2 U402 ( .A(addr[6]), .B(N613), .S0(n423), .Y(n158) );
  CLKMX2X2 U403 ( .A(n419), .B(N614), .S0(n423), .Y(n156) );
  CLKINVX1 U404 ( .A(n368), .Y(n399) );
  OAI31XL U405 ( .A0(n422), .A1(n354), .A2(addr[0]), .B0(n140), .Y(n143) );
  AND2X1 U406 ( .A(n381), .B(n395), .Y(n377) );
  NAND3X1 U407 ( .A(n353), .B(n351), .C(state[2]), .Y(n395) );
  NAND2X1 U408 ( .A(state[1]), .B(n352), .Y(n381) );
  NAND4X1 U409 ( .A(n137), .B(n135), .C(n138), .D(n433), .Y(n422) );
  NOR4X1 U410 ( .A(addr[6]), .B(n424), .C(n419), .D(n432), .Y(n433) );
  CLKINVX1 U411 ( .A(n182), .Y(n419) );
  OAI21XL U412 ( .A0(n177), .A1(n434), .B0(n176), .Y(N514) );
  OAI21XL U413 ( .A0(n177), .A1(n435), .B0(n176), .Y(N432) );
  NAND2X1 U414 ( .A(n394), .B(n434), .Y(N347) );
  NAND3X1 U415 ( .A(N224), .B(N222), .C(n401), .Y(n434) );
  NAND2X1 U416 ( .A(n435), .B(n394), .Y(N315) );
  CLKINVX1 U417 ( .A(n393), .Y(n394) );
  NAND2X1 U418 ( .A(n177), .B(n176), .Y(n393) );
  CLKINVX1 U419 ( .A(n401), .Y(n359) );
  NOR2X1 U420 ( .A(n317), .B(n316), .Y(n401) );
  OR2X1 U421 ( .A(load), .B(pi_end), .Y(N276) );
endmodule


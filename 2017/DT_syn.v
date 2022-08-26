/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : Q-2019.12
// Date      : Mon Mar 14 19:13:12 2022
/////////////////////////////////////////////////////////////


module DT_DW01_inc_1_DW01_inc_2 ( A, SUM );
  input [9:0] A;
  output [9:0] SUM;

  wire   [9:2] carry;

  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[9]), .B(A[9]), .Y(SUM[9]) );
endmodule


module DT_DW01_dec_0 ( A, SUM );
  input [13:0] A;
  output [13:0] SUM;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16;

  CLKINVX1 U1 ( .A(n16), .Y(n1) );
  CLKINVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
  CLKINVX1 U3 ( .A(A[10]), .Y(n4) );
  CLKINVX1 U4 ( .A(A[11]), .Y(n3) );
  AO21X1 U5 ( .A0(n5), .A1(A[9]), .B0(n6), .Y(SUM[9]) );
  OAI2BB1X1 U6 ( .A0N(n7), .A1N(A[8]), .B0(n5), .Y(SUM[8]) );
  OAI2BB1X1 U7 ( .A0N(n8), .A1N(A[7]), .B0(n7), .Y(SUM[7]) );
  OAI2BB1X1 U8 ( .A0N(n9), .A1N(A[6]), .B0(n8), .Y(SUM[6]) );
  OAI2BB1X1 U9 ( .A0N(n10), .A1N(A[5]), .B0(n9), .Y(SUM[5]) );
  OAI2BB1X1 U10 ( .A0N(n11), .A1N(A[4]), .B0(n10), .Y(SUM[4]) );
  OAI2BB1X1 U11 ( .A0N(n12), .A1N(A[3]), .B0(n11), .Y(SUM[3]) );
  OAI2BB1X1 U12 ( .A0N(n13), .A1N(A[2]), .B0(n12), .Y(SUM[2]) );
  OAI2BB1X1 U13 ( .A0N(A[0]), .A1N(A[1]), .B0(n13), .Y(SUM[1]) );
  XOR2X1 U14 ( .A(A[13]), .B(n14), .Y(SUM[13]) );
  NOR2X1 U15 ( .A(A[12]), .B(n15), .Y(n14) );
  XNOR2X1 U16 ( .A(A[12]), .B(n15), .Y(SUM[12]) );
  OAI21XL U17 ( .A0(n1), .A1(n3), .B0(n15), .Y(SUM[11]) );
  NAND2X1 U18 ( .A(n1), .B(n3), .Y(n15) );
  OAI21XL U19 ( .A0(n6), .A1(n4), .B0(n16), .Y(SUM[10]) );
  NAND2X1 U20 ( .A(n6), .B(n4), .Y(n16) );
  NOR2X1 U21 ( .A(n5), .B(A[9]), .Y(n6) );
  OR2X1 U22 ( .A(n7), .B(A[8]), .Y(n5) );
  OR2X1 U23 ( .A(n8), .B(A[7]), .Y(n7) );
  OR2X1 U24 ( .A(n9), .B(A[6]), .Y(n8) );
  OR2X1 U25 ( .A(n10), .B(A[5]), .Y(n9) );
  OR2X1 U26 ( .A(n11), .B(A[4]), .Y(n10) );
  OR2X1 U27 ( .A(n12), .B(A[3]), .Y(n11) );
  OR2X1 U28 ( .A(n13), .B(A[2]), .Y(n12) );
  NAND2BX1 U29 ( .AN(A[1]), .B(SUM[0]), .Y(n13) );
endmodule


module DT_DW01_inc_5_DW01_inc_6 ( A, SUM );
  input [13:0] A;
  output [13:0] SUM;

  wire   [13:2] carry;

  ADDHXL U1_1_12 ( .A(A[12]), .B(carry[12]), .CO(carry[13]), .S(SUM[12]) );
  ADDHXL U1_1_11 ( .A(A[11]), .B(carry[11]), .CO(carry[12]), .S(SUM[11]) );
  ADDHXL U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKINVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[13]), .B(A[13]), .Y(SUM[13]) );
endmodule


module DT ( clk, reset, done, sti_rd, sti_addr, sti_di, res_wr, res_rd, 
        res_addr, res_do, res_di );
  output [9:0] sti_addr;
  input [15:0] sti_di;
  output [13:0] res_addr;
  output [7:0] res_do;
  input [7:0] res_di;
  input clk, reset;
  output done, sti_rd, res_wr, res_rd;
  wire   n359, n360, n361, n362, n363, n364, n365, n366, n367, n368, n369,
         n370, n371, n372, N40, N41, N42, N43, N44, N45, N46, N47, N48, N49,
         N50, N51, N52, N53, N54, N61, N62, N63, N64, N65, N66, N67, N68, N69,
         N70, N125, N126, N127, N128, N129, N130, N131, N132, N133, N134, N135,
         N136, N137, N212, N213, N214, N215, N216, N217, N218, N219, N220,
         N221, N222, N223, N224, N227, N228, N229, N230, N231, N233, N234,
         N235, N236, N303, N304, N305, N306, N307, N308, N309, N310, N311,
         N312, N313, N314, N315, N321, N322, N325, N326, N327, N328, N334,
         N335, N336, N337, N338, N339, N340, N341, N342, N343, N344, N345,
         N346, N347, N374, N378, N379, N380, N381, N436, N437, N438, N439,
         N440, N441, N442, N443, N444, N445, N446, N447, N448, N509, N517,
         N518, N519, N520, N521, N522, N523, N524, N525, N526, N527, N528,
         N529, N530, n149, n153, n154, n155, n156, n157, n158, n159, n160,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n173, n174, n175, n176, n177, n178, n179, \sub_134/carry[2] ,
         \sub_134/carry[3] , \sub_134/carry[4] , \sub_134/carry[5] ,
         \sub_134/carry[6] , \sub_134/carry[7] , \sub_134/carry[8] ,
         \sub_134/carry[9] , \sub_134/carry[10] , \sub_134/carry[11] ,
         \sub_134/carry[12] , \sub_134/carry[13] , \add_106/carry[2] ,
         \add_106/carry[3] , \add_106/carry[4] , \add_106/carry[5] ,
         \add_106/carry[6] , \add_106/carry[7] , \add_106/carry[8] ,
         \add_106/carry[9] , \add_106/carry[10] , \add_106/carry[11] ,
         \add_106/carry[12] , \add_106/carry[13] , \add_87/carry[2] ,
         \add_87/carry[3] , \add_87/carry[4] , \add_87/carry[5] ,
         \add_87/carry[6] , \add_87/carry[7] , \add_87/carry[8] ,
         \add_87/carry[9] , \add_87/carry[10] , \add_87/carry[11] ,
         \add_87/carry[12] , \add_87/carry[13] , \sub_61/carry[2] ,
         \sub_61/carry[3] , \sub_61/carry[4] , \sub_61/carry[5] ,
         \sub_61/carry[6] , \sub_61/carry[7] , \sub_61/carry[8] ,
         \sub_61/carry[9] , \sub_61/carry[10] , \sub_61/carry[11] ,
         \sub_61/carry[12] , \sub_61/carry[13] , n180, n181, n182, n183, n184,
         n185, n186, n187, n188, n189, n190, n191, n192, n193, n208, n209,
         n210, n211, n212, n213, n214, n215, n216, n217, n218, n219, n220,
         n221, n222, n223, n224, n225, n226, n227, n228, n229, n230, n231,
         n232, n233, n234, n235, n236, n237, n238, n239, n240, n241, n242,
         n243, n244, n245, n246, n247, n248, n249, n250, n251, n252, n253,
         n254, n255, n256, n257, n258, n259, n260, n261, n262, n263, n264,
         n265, n266, n267, n268, n269, n270, n271, n272, n273, n274, n275,
         n276, n277, n278, n279, n280, n281, n282, n283, n284, n285, n286,
         n287, n288, n289, n290, n291, n292, n293, n294, n295, n296, n297,
         n298, n299, n300, n301, n302, n303, n304, n305, n306, n307, n308,
         n309, n310, n311, n312, n313, n314, n315, n316, n317, n318, n319,
         n320, n321, n322, n323, n324, n325, n326, n327, n328, n329, n330,
         n331, n332, n333, n334, n335, n336, n337, n338, n339, n340, n341,
         n342, n343, n344, n345, n346, n347, n348, n349, n350, n351, n352,
         n353, n354, n355, n356, n357, n358;
  wire   [4:2] \add_108_2/carry ;
  wire   [4:2] \r479/carry ;
  wire   [5:2] \r473/carry ;
  wire   [5:2] \r472/carry ;
  assign sti_rd = 1'b1;
  assign res_rd = 1'b1;
  assign res_do[7] = 1'b0;
  assign res_do[6] = 1'b0;
  assign res_do[5] = 1'b0;

  DFFRX4 \res_do_reg[0]  ( .D(n166), .CK(clk), .RN(n208), .Q(res_do[0]), .QN(
        n186) );
  DFFRX4 \res_do_reg[2]  ( .D(n164), .CK(clk), .RN(reset), .Q(res_do[2]) );
  DFFRX4 \res_do_reg[3]  ( .D(n163), .CK(clk), .RN(reset), .Q(res_do[3]), .QN(
        n183) );
  DT_DW01_inc_1_DW01_inc_2 add_46 ( .A(sti_addr), .SUM({N70, N69, N68, N67, 
        N66, N65, N64, N63, N62, N61}) );
  DT_DW01_dec_0 r477 ( .A(res_addr), .SUM({N347, N346, N345, N344, N343, N342, 
        N341, N340, N339, N338, N337, N336, N335, N334}) );
  DT_DW01_inc_5_DW01_inc_6 r466 ( .A(res_addr), .SUM({N54, N53, N52, N51, N50, 
        N49, N48, N47, N46, N45, N44, N43, N42, N41}) );
  DFFRX1 \res_addr_reg[13]  ( .D(N530), .CK(clk), .RN(n208), .Q(n359) );
  DFFRX1 \res_addr_reg[12]  ( .D(N529), .CK(clk), .RN(n208), .Q(n360) );
  DFFRX1 \res_addr_reg[11]  ( .D(N528), .CK(clk), .RN(n208), .Q(n361) );
  DFFRX2 \sti_addr_reg[9]  ( .D(n167), .CK(clk), .RN(n208), .Q(sti_addr[9]) );
  DFFRX2 \sti_addr_reg[4]  ( .D(n172), .CK(clk), .RN(reset), .Q(sti_addr[4])
         );
  DFFRX2 \sti_addr_reg[7]  ( .D(n169), .CK(clk), .RN(reset), .Q(sti_addr[7])
         );
  DFFRX2 \sti_addr_reg[2]  ( .D(n174), .CK(clk), .RN(reset), .Q(sti_addr[2])
         );
  DFFRX2 \sti_addr_reg[5]  ( .D(n171), .CK(clk), .RN(reset), .Q(sti_addr[5])
         );
  DFFRX2 \sti_addr_reg[8]  ( .D(n168), .CK(clk), .RN(reset), .Q(sti_addr[8])
         );
  DFFRX2 \sti_addr_reg[1]  ( .D(n176), .CK(clk), .RN(reset), .Q(sti_addr[1])
         );
  DFFRX1 \res_addr_reg[10]  ( .D(N527), .CK(clk), .RN(n208), .Q(n362) );
  DFFRX1 \res_addr_reg[9]  ( .D(N526), .CK(clk), .RN(n208), .Q(n363) );
  DFFRX1 \res_addr_reg[8]  ( .D(N525), .CK(clk), .RN(n208), .Q(n364) );
  DFFRX1 \state_reg[0]  ( .D(n154), .CK(clk), .RN(n208), .QN(n356) );
  DFFRX1 \res_addr_reg[7]  ( .D(N524), .CK(clk), .RN(n208), .Q(n365) );
  DFFSX1 \res_addr_reg[6]  ( .D(N523), .CK(clk), .SN(reset), .Q(n366) );
  DFFRX1 \state_reg[1]  ( .D(n156), .CK(clk), .RN(reset), .Q(n180), .QN(n357)
         );
  DFFSX1 \res_addr_reg[4]  ( .D(N521), .CK(clk), .SN(n208), .Q(n368) );
  DFFSX1 \res_addr_reg[5]  ( .D(N522), .CK(clk), .SN(n208), .Q(n367) );
  DFFRX1 \count_reg[2]  ( .D(n179), .CK(clk), .RN(reset), .Q(n225), .QN(n158)
         );
  DFFRX1 \count_reg[3]  ( .D(n155), .CK(clk), .RN(reset), .Q(n358), .QN(n157)
         );
  DFFSX1 \res_addr_reg[0]  ( .D(N517), .CK(clk), .SN(n208), .Q(n372), .QN(n185) );
  DFFSX1 \res_addr_reg[1]  ( .D(N518), .CK(clk), .SN(n208), .Q(n371) );
  DFFSX1 \res_addr_reg[2]  ( .D(N519), .CK(clk), .SN(n208), .Q(n370) );
  DFFSX1 \res_addr_reg[3]  ( .D(N520), .CK(clk), .SN(n208), .Q(n369) );
  DFFSX2 \sti_addr_reg[3]  ( .D(n173), .CK(clk), .SN(n208), .Q(sti_addr[3]) );
  DFFRX2 \sti_addr_reg[6]  ( .D(n170), .CK(clk), .RN(reset), .Q(sti_addr[6])
         );
  DFFRX2 \count_reg[1]  ( .D(n177), .CK(clk), .RN(reset), .Q(n224), .QN(n159)
         );
  DFFSX2 res_wr_reg ( .D(N509), .CK(clk), .SN(reset), .Q(res_wr) );
  DFFRX2 done_reg ( .D(n153), .CK(clk), .RN(reset), .Q(done), .QN(n149) );
  DFFRX2 \res_do_reg[4]  ( .D(n162), .CK(clk), .RN(reset), .Q(res_do[4]), .QN(
        n184) );
  DFFRX2 \res_do_reg[1]  ( .D(n165), .CK(clk), .RN(reset), .Q(res_do[1]), .QN(
        n182) );
  DFFRX1 \count_reg[0]  ( .D(n178), .CK(clk), .RN(n208), .Q(n223), .QN(n160)
         );
  DFFRX2 \sti_addr_reg[0]  ( .D(n175), .CK(clk), .RN(reset), .Q(sti_addr[0])
         );
  NOR2BX2 U169 ( .AN(n276), .B(n277), .Y(n259) );
  ADDHXL U170 ( .A(res_di[3]), .B(\r472/carry [3]), .CO(\r472/carry [4]), .S(
        N230) );
  AND2X2 U171 ( .A(res_di[1]), .B(res_di[0]), .Y(n181) );
  NOR3X1 U172 ( .A(n159), .B(n223), .C(n248), .Y(n348) );
  NAND3XL U173 ( .A(n223), .B(n349), .C(n159), .Y(n247) );
  XOR2X1 U174 ( .A(res_di[1]), .B(res_di[0]), .Y(N228) );
  OAI32X1 U175 ( .A0(n184), .A1(N374), .A2(N231), .B0(n288), .B1(n289), .Y(
        n276) );
  ADDHXL U176 ( .A(res_di[2]), .B(n181), .CO(\r472/carry [3]), .S(N229) );
  BUFX4 U177 ( .A(n372), .Y(res_addr[0]) );
  ADDHXL U178 ( .A(res_do[3]), .B(\r473/carry [3]), .CO(\r473/carry [4]), .S(
        N235) );
  ADDHXL U179 ( .A(res_do[1]), .B(res_do[0]), .CO(\r473/carry [2]), .S(N233)
         );
  ADDHXL U180 ( .A(res_do[4]), .B(\r473/carry [4]), .CO(N321), .S(N236) );
  CLKBUFX3 U181 ( .A(n280), .Y(n190) );
  INVX1 U182 ( .A(n275), .Y(n280) );
  CLKBUFX3 U183 ( .A(n293), .Y(n192) );
  CLKINVX1 U184 ( .A(n240), .Y(n293) );
  CLKBUFX3 U185 ( .A(n294), .Y(n191) );
  CLKINVX1 U186 ( .A(n241), .Y(n294) );
  CLKINVX1 U187 ( .A(n279), .Y(n189) );
  CLKBUFX3 U188 ( .A(n320), .Y(n193) );
  AO22X1 U189 ( .A0(n310), .A1(n250), .B0(n347), .B1(n286), .Y(n320) );
  AND2X2 U190 ( .A(n244), .B(n286), .Y(n319) );
  AND2X2 U191 ( .A(n347), .B(n180), .Y(n318) );
  CLKINVX1 U192 ( .A(N235), .Y(n235) );
  CLKINVX1 U193 ( .A(N233), .Y(n234) );
  AOI21X1 U194 ( .A0(n187), .A1(n188), .B0(n283), .Y(n244) );
  NOR4X1 U195 ( .A(res_di[4]), .B(res_di[5]), .C(res_di[6]), .D(res_di[7]), 
        .Y(n187) );
  NOR4X1 U196 ( .A(res_di[1]), .B(res_di[0]), .C(res_di[2]), .D(res_di[3]), 
        .Y(n188) );
  CLKINVX1 U197 ( .A(N321), .Y(n237) );
  CLKINVX1 U198 ( .A(N236), .Y(n236) );
  INVX1 U199 ( .A(n278), .Y(n281) );
  ADDHX1 U200 ( .A(res_di[4]), .B(\r472/carry [4]), .CO(N374), .S(N231) );
  CLKINVX1 U201 ( .A(res_di[0]), .Y(N227) );
  BUFX4 U202 ( .A(n370), .Y(res_addr[2]) );
  BUFX4 U203 ( .A(n369), .Y(res_addr[3]) );
  BUFX4 U204 ( .A(n371), .Y(res_addr[1]) );
  ADDHXL U205 ( .A(res_di[1]), .B(res_di[0]), .CO(\r479/carry [2]), .S(N378)
         );
  ADDHXL U206 ( .A(res_di[2]), .B(\r479/carry [2]), .CO(\r479/carry [3]), .S(
        N379) );
  ADDHXL U207 ( .A(res_di[3]), .B(\r479/carry [3]), .CO(\r479/carry [4]), .S(
        N380) );
  BUFX4 U208 ( .A(n368), .Y(res_addr[4]) );
  BUFX4 U209 ( .A(n367), .Y(res_addr[5]) );
  ADDHX1 U210 ( .A(res_do[2]), .B(\r473/carry [2]), .CO(\r473/carry [3]), .S(
        N234) );
  BUFX4 U211 ( .A(n366), .Y(res_addr[6]) );
  BUFX4 U212 ( .A(n365), .Y(res_addr[7]) );
  BUFX4 U213 ( .A(n363), .Y(res_addr[9]) );
  BUFX4 U214 ( .A(n364), .Y(res_addr[8]) );
  BUFX4 U215 ( .A(n362), .Y(res_addr[10]) );
  AND2X2 U216 ( .A(n252), .B(n358), .Y(n251) );
  BUFX4 U217 ( .A(n360), .Y(res_addr[12]) );
  BUFX4 U218 ( .A(n361), .Y(res_addr[11]) );
  ADDHXL U219 ( .A(res_do[1]), .B(res_do[0]), .CO(\add_108_2/carry [2]), .S(
        N325) );
  ADDHXL U220 ( .A(res_do[2]), .B(\add_108_2/carry [2]), .CO(
        \add_108_2/carry [3]), .S(N326) );
  ADDHXL U221 ( .A(res_do[3]), .B(\add_108_2/carry [3]), .CO(
        \add_108_2/carry [4]), .S(N327) );
  CLKBUFX3 U222 ( .A(n359), .Y(res_addr[13]) );
  CLKBUFX3 U223 ( .A(reset), .Y(n208) );
  AO22X1 U224 ( .A0(n281), .A1(n189), .B0(n190), .B1(N322), .Y(n262) );
  OAI221X4 U225 ( .A0(n277), .A1(n276), .B0(n279), .B1(n281), .C0(n282), .Y(
        n256) );
  XOR2X1 U226 ( .A(res_addr[13]), .B(\add_106/carry[13] ), .Y(N315) );
  AND2X1 U227 ( .A(\add_106/carry[12] ), .B(res_addr[12]), .Y(
        \add_106/carry[13] ) );
  XOR2X1 U228 ( .A(res_addr[12]), .B(\add_106/carry[12] ), .Y(N314) );
  AND2X1 U229 ( .A(\add_106/carry[11] ), .B(res_addr[11]), .Y(
        \add_106/carry[12] ) );
  XOR2X1 U230 ( .A(res_addr[11]), .B(\add_106/carry[11] ), .Y(N313) );
  AND2X1 U231 ( .A(\add_106/carry[10] ), .B(res_addr[10]), .Y(
        \add_106/carry[11] ) );
  XOR2X1 U232 ( .A(res_addr[10]), .B(\add_106/carry[10] ), .Y(N312) );
  AND2X1 U233 ( .A(\add_106/carry[9] ), .B(res_addr[9]), .Y(
        \add_106/carry[10] ) );
  XOR2X1 U234 ( .A(res_addr[9]), .B(\add_106/carry[9] ), .Y(N311) );
  AND2X1 U235 ( .A(\add_106/carry[8] ), .B(res_addr[8]), .Y(\add_106/carry[9] ) );
  XOR2X1 U236 ( .A(res_addr[8]), .B(\add_106/carry[8] ), .Y(N310) );
  OR2X1 U237 ( .A(res_addr[7]), .B(\add_106/carry[7] ), .Y(\add_106/carry[8] )
         );
  XNOR2X1 U238 ( .A(\add_106/carry[7] ), .B(res_addr[7]), .Y(N309) );
  AND2X1 U239 ( .A(\add_106/carry[6] ), .B(res_addr[6]), .Y(\add_106/carry[7] ) );
  XOR2X1 U240 ( .A(res_addr[6]), .B(\add_106/carry[6] ), .Y(N308) );
  AND2X1 U241 ( .A(\add_106/carry[5] ), .B(res_addr[5]), .Y(\add_106/carry[6] ) );
  XOR2X1 U242 ( .A(res_addr[5]), .B(\add_106/carry[5] ), .Y(N307) );
  AND2X1 U243 ( .A(\add_106/carry[4] ), .B(res_addr[4]), .Y(\add_106/carry[5] ) );
  XOR2X1 U244 ( .A(res_addr[4]), .B(\add_106/carry[4] ), .Y(N306) );
  AND2X1 U245 ( .A(\add_106/carry[3] ), .B(res_addr[3]), .Y(\add_106/carry[4] ) );
  XOR2X1 U246 ( .A(res_addr[3]), .B(\add_106/carry[3] ), .Y(N305) );
  AND2X1 U247 ( .A(\add_106/carry[2] ), .B(res_addr[2]), .Y(\add_106/carry[3] ) );
  XOR2X1 U248 ( .A(res_addr[2]), .B(\add_106/carry[2] ), .Y(N304) );
  AND2X1 U249 ( .A(res_addr[0]), .B(res_addr[1]), .Y(\add_106/carry[2] ) );
  XOR2X1 U250 ( .A(res_addr[1]), .B(res_addr[0]), .Y(N303) );
  XNOR2X1 U251 ( .A(res_addr[13]), .B(\sub_61/carry[13] ), .Y(N137) );
  OR2X1 U252 ( .A(res_addr[12]), .B(\sub_61/carry[12] ), .Y(\sub_61/carry[13] ) );
  XNOR2X1 U253 ( .A(\sub_61/carry[12] ), .B(res_addr[12]), .Y(N136) );
  OR2X1 U254 ( .A(res_addr[11]), .B(\sub_61/carry[11] ), .Y(\sub_61/carry[12] ) );
  XNOR2X1 U255 ( .A(\sub_61/carry[11] ), .B(res_addr[11]), .Y(N135) );
  OR2X1 U256 ( .A(res_addr[10]), .B(\sub_61/carry[10] ), .Y(\sub_61/carry[11] ) );
  XNOR2X1 U257 ( .A(\sub_61/carry[10] ), .B(res_addr[10]), .Y(N134) );
  OR2X1 U258 ( .A(res_addr[9]), .B(\sub_61/carry[9] ), .Y(\sub_61/carry[10] )
         );
  XNOR2X1 U259 ( .A(\sub_61/carry[9] ), .B(res_addr[9]), .Y(N133) );
  OR2X1 U260 ( .A(res_addr[8]), .B(\sub_61/carry[8] ), .Y(\sub_61/carry[9] )
         );
  XNOR2X1 U261 ( .A(\sub_61/carry[8] ), .B(res_addr[8]), .Y(N132) );
  AND2X1 U262 ( .A(\sub_61/carry[7] ), .B(res_addr[7]), .Y(\sub_61/carry[8] )
         );
  XOR2X1 U263 ( .A(res_addr[7]), .B(\sub_61/carry[7] ), .Y(N131) );
  OR2X1 U264 ( .A(res_addr[6]), .B(\sub_61/carry[6] ), .Y(\sub_61/carry[7] )
         );
  XNOR2X1 U265 ( .A(\sub_61/carry[6] ), .B(res_addr[6]), .Y(N130) );
  OR2X1 U266 ( .A(res_addr[5]), .B(\sub_61/carry[5] ), .Y(\sub_61/carry[6] )
         );
  XNOR2X1 U267 ( .A(\sub_61/carry[5] ), .B(res_addr[5]), .Y(N129) );
  OR2X1 U268 ( .A(res_addr[4]), .B(\sub_61/carry[4] ), .Y(\sub_61/carry[5] )
         );
  XNOR2X1 U269 ( .A(\sub_61/carry[4] ), .B(res_addr[4]), .Y(N128) );
  OR2X1 U270 ( .A(res_addr[3]), .B(\sub_61/carry[3] ), .Y(\sub_61/carry[4] )
         );
  XNOR2X1 U271 ( .A(\sub_61/carry[3] ), .B(res_addr[3]), .Y(N127) );
  OR2X1 U272 ( .A(res_addr[2]), .B(\sub_61/carry[2] ), .Y(\sub_61/carry[3] )
         );
  XNOR2X1 U273 ( .A(\sub_61/carry[2] ), .B(res_addr[2]), .Y(N126) );
  OR2X1 U274 ( .A(res_addr[1]), .B(res_addr[0]), .Y(\sub_61/carry[2] ) );
  XNOR2X1 U275 ( .A(res_addr[0]), .B(res_addr[1]), .Y(N125) );
  XOR2X1 U276 ( .A(res_addr[13]), .B(\add_87/carry[13] ), .Y(N224) );
  AND2X1 U277 ( .A(\add_87/carry[12] ), .B(res_addr[12]), .Y(
        \add_87/carry[13] ) );
  XOR2X1 U278 ( .A(res_addr[12]), .B(\add_87/carry[12] ), .Y(N223) );
  AND2X1 U279 ( .A(\add_87/carry[11] ), .B(res_addr[11]), .Y(
        \add_87/carry[12] ) );
  XOR2X1 U280 ( .A(res_addr[11]), .B(\add_87/carry[11] ), .Y(N222) );
  AND2X1 U281 ( .A(\add_87/carry[10] ), .B(res_addr[10]), .Y(
        \add_87/carry[11] ) );
  XOR2X1 U282 ( .A(res_addr[10]), .B(\add_87/carry[10] ), .Y(N221) );
  AND2X1 U283 ( .A(\add_87/carry[9] ), .B(res_addr[9]), .Y(\add_87/carry[10] )
         );
  XOR2X1 U284 ( .A(res_addr[9]), .B(\add_87/carry[9] ), .Y(N220) );
  AND2X1 U285 ( .A(\add_87/carry[8] ), .B(res_addr[8]), .Y(\add_87/carry[9] )
         );
  XOR2X1 U286 ( .A(res_addr[8]), .B(\add_87/carry[8] ), .Y(N219) );
  AND2X1 U287 ( .A(\add_87/carry[7] ), .B(res_addr[7]), .Y(\add_87/carry[8] )
         );
  XOR2X1 U288 ( .A(res_addr[7]), .B(\add_87/carry[7] ), .Y(N218) );
  OR2X1 U289 ( .A(res_addr[6]), .B(\add_87/carry[6] ), .Y(\add_87/carry[7] )
         );
  XNOR2X1 U290 ( .A(\add_87/carry[6] ), .B(res_addr[6]), .Y(N217) );
  OR2X1 U291 ( .A(res_addr[5]), .B(\add_87/carry[5] ), .Y(\add_87/carry[6] )
         );
  XNOR2X1 U292 ( .A(\add_87/carry[5] ), .B(res_addr[5]), .Y(N216) );
  OR2X1 U293 ( .A(res_addr[4]), .B(\add_87/carry[4] ), .Y(\add_87/carry[5] )
         );
  XNOR2X1 U294 ( .A(\add_87/carry[4] ), .B(res_addr[4]), .Y(N215) );
  OR2X1 U295 ( .A(res_addr[3]), .B(\add_87/carry[3] ), .Y(\add_87/carry[4] )
         );
  XNOR2X1 U296 ( .A(\add_87/carry[3] ), .B(res_addr[3]), .Y(N214) );
  OR2X1 U297 ( .A(res_addr[2]), .B(\add_87/carry[2] ), .Y(\add_87/carry[3] )
         );
  XNOR2X1 U298 ( .A(\add_87/carry[2] ), .B(res_addr[2]), .Y(N213) );
  OR2X1 U299 ( .A(res_addr[1]), .B(res_addr[0]), .Y(\add_87/carry[2] ) );
  XNOR2X1 U300 ( .A(res_addr[0]), .B(res_addr[1]), .Y(N212) );
  XNOR2X1 U301 ( .A(res_addr[13]), .B(\sub_134/carry[13] ), .Y(N448) );
  OR2X1 U302 ( .A(res_addr[12]), .B(\sub_134/carry[12] ), .Y(
        \sub_134/carry[13] ) );
  XNOR2X1 U303 ( .A(\sub_134/carry[12] ), .B(res_addr[12]), .Y(N447) );
  OR2X1 U304 ( .A(res_addr[11]), .B(\sub_134/carry[11] ), .Y(
        \sub_134/carry[12] ) );
  XNOR2X1 U305 ( .A(\sub_134/carry[11] ), .B(res_addr[11]), .Y(N446) );
  OR2X1 U306 ( .A(res_addr[10]), .B(\sub_134/carry[10] ), .Y(
        \sub_134/carry[11] ) );
  XNOR2X1 U307 ( .A(\sub_134/carry[10] ), .B(res_addr[10]), .Y(N445) );
  OR2X1 U308 ( .A(res_addr[9]), .B(\sub_134/carry[9] ), .Y(\sub_134/carry[10] ) );
  XNOR2X1 U309 ( .A(\sub_134/carry[9] ), .B(res_addr[9]), .Y(N444) );
  OR2X1 U310 ( .A(res_addr[8]), .B(\sub_134/carry[8] ), .Y(\sub_134/carry[9] )
         );
  XNOR2X1 U311 ( .A(\sub_134/carry[8] ), .B(res_addr[8]), .Y(N443) );
  OR2X1 U312 ( .A(res_addr[7]), .B(\sub_134/carry[7] ), .Y(\sub_134/carry[8] )
         );
  XNOR2X1 U313 ( .A(\sub_134/carry[7] ), .B(res_addr[7]), .Y(N442) );
  AND2X1 U314 ( .A(\sub_134/carry[6] ), .B(res_addr[6]), .Y(\sub_134/carry[7] ) );
  XOR2X1 U315 ( .A(res_addr[6]), .B(\sub_134/carry[6] ), .Y(N441) );
  AND2X1 U316 ( .A(\sub_134/carry[5] ), .B(res_addr[5]), .Y(\sub_134/carry[6] ) );
  XOR2X1 U317 ( .A(res_addr[5]), .B(\sub_134/carry[5] ), .Y(N440) );
  AND2X1 U318 ( .A(\sub_134/carry[4] ), .B(res_addr[4]), .Y(\sub_134/carry[5] ) );
  XOR2X1 U319 ( .A(res_addr[4]), .B(\sub_134/carry[4] ), .Y(N439) );
  AND2X1 U320 ( .A(\sub_134/carry[3] ), .B(res_addr[3]), .Y(\sub_134/carry[4] ) );
  XOR2X1 U321 ( .A(res_addr[3]), .B(\sub_134/carry[3] ), .Y(N438) );
  AND2X1 U322 ( .A(\sub_134/carry[2] ), .B(res_addr[2]), .Y(\sub_134/carry[3] ) );
  XOR2X1 U323 ( .A(res_addr[2]), .B(\sub_134/carry[2] ), .Y(N437) );
  AND2X1 U324 ( .A(res_addr[0]), .B(res_addr[1]), .Y(\sub_134/carry[2] ) );
  XOR2X1 U325 ( .A(res_addr[1]), .B(res_addr[0]), .Y(N436) );
  XOR2X1 U326 ( .A(\r479/carry [4]), .B(res_di[4]), .Y(N381) );
  XOR2X1 U327 ( .A(\add_108_2/carry [4]), .B(res_do[4]), .Y(N328) );
  NOR2X1 U328 ( .A(n224), .B(n160), .Y(n218) );
  NOR2X1 U329 ( .A(n224), .B(n223), .Y(n217) );
  NOR2X1 U330 ( .A(n223), .B(n159), .Y(n215) );
  NOR2X1 U331 ( .A(n160), .B(n159), .Y(n214) );
  AO22X1 U332 ( .A0(sti_di[5]), .A1(n215), .B0(sti_di[4]), .B1(n214), .Y(n209)
         );
  AOI221XL U333 ( .A0(sti_di[6]), .A1(n218), .B0(sti_di[7]), .B1(n217), .C0(
        n209), .Y(n212) );
  AO22X1 U334 ( .A0(sti_di[1]), .A1(n215), .B0(sti_di[0]), .B1(n214), .Y(n210)
         );
  AOI221XL U335 ( .A0(sti_di[2]), .A1(n218), .B0(sti_di[3]), .B1(n217), .C0(
        n210), .Y(n211) );
  OA22X1 U336 ( .A0(n225), .A1(n212), .B0(n158), .B1(n211), .Y(n222) );
  AO22X1 U337 ( .A0(sti_di[13]), .A1(n215), .B0(sti_di[12]), .B1(n214), .Y(
        n213) );
  AOI221XL U338 ( .A0(sti_di[14]), .A1(n218), .B0(sti_di[15]), .B1(n217), .C0(
        n213), .Y(n220) );
  AO22X1 U339 ( .A0(sti_di[9]), .A1(n215), .B0(sti_di[8]), .B1(n214), .Y(n216)
         );
  AOI221XL U340 ( .A0(sti_di[10]), .A1(n218), .B0(sti_di[11]), .B1(n217), .C0(
        n216), .Y(n219) );
  OAI22XL U341 ( .A0(n220), .A1(n225), .B0(n158), .B1(n219), .Y(n221) );
  OAI2BB2XL U342 ( .B0(n222), .B1(n157), .A0N(n157), .A1N(n221), .Y(N40) );
  NAND2BX1 U343 ( .AN(res_di[2]), .B(N234), .Y(n228) );
  OAI22XL U344 ( .A0(res_di[3]), .A1(n235), .B0(res_di[3]), .B1(n228), .Y(n232) );
  NOR2BX1 U345 ( .AN(res_di[2]), .B(N234), .Y(n226) );
  OA22X1 U346 ( .A0(n226), .A1(res_di[3]), .B0(n226), .B1(n235), .Y(n230) );
  AOI21X1 U347 ( .A0(res_di[1]), .A1(n234), .B0(res_di[0]), .Y(n227) );
  AOI2BB2X1 U348 ( .B0(n227), .B1(n186), .A0N(res_di[1]), .A1N(n234), .Y(n229)
         );
  OAI22XL U349 ( .A0(n230), .A1(n229), .B0(n228), .B1(n235), .Y(n231) );
  OAI2BB2XL U350 ( .B0(n232), .B1(n231), .A0N(n236), .A1N(res_di[4]), .Y(n233)
         );
  OAI211X1 U351 ( .A0(res_di[4]), .A1(n236), .B0(n237), .C0(n233), .Y(N322) );
  OAI211X1 U352 ( .A0(n238), .A1(n239), .B0(n240), .C0(n241), .Y(n179) );
  XNOR2X1 U353 ( .A(n242), .B(n225), .Y(n238) );
  XNOR2X1 U354 ( .A(n243), .B(n160), .Y(n178) );
  NAND3BX1 U355 ( .AN(n244), .B(n245), .C(n239), .Y(n243) );
  NAND2X1 U356 ( .A(n246), .B(n247), .Y(n177) );
  MX3XL U357 ( .A(n223), .B(n248), .C(n249), .S0(n239), .S1(n159), .Y(n246) );
  NAND2X1 U358 ( .A(n250), .B(n223), .Y(n249) );
  CLKMX2X2 U359 ( .A(sti_addr[1]), .B(N62), .S0(n251), .Y(n176) );
  CLKMX2X2 U360 ( .A(sti_addr[0]), .B(N61), .S0(n251), .Y(n175) );
  CLKMX2X2 U361 ( .A(sti_addr[2]), .B(N63), .S0(n251), .Y(n174) );
  CLKMX2X2 U362 ( .A(sti_addr[3]), .B(N64), .S0(n251), .Y(n173) );
  CLKMX2X2 U363 ( .A(sti_addr[4]), .B(N65), .S0(n251), .Y(n172) );
  CLKMX2X2 U364 ( .A(sti_addr[5]), .B(N66), .S0(n251), .Y(n171) );
  CLKMX2X2 U365 ( .A(sti_addr[6]), .B(N67), .S0(n251), .Y(n170) );
  CLKMX2X2 U366 ( .A(sti_addr[7]), .B(N68), .S0(n251), .Y(n169) );
  CLKMX2X2 U367 ( .A(sti_addr[8]), .B(N69), .S0(n251), .Y(n168) );
  CLKMX2X2 U368 ( .A(sti_addr[9]), .B(N70), .S0(n251), .Y(n167) );
  NAND3X1 U369 ( .A(n253), .B(n254), .C(n255), .Y(n166) );
  AOI222XL U370 ( .A0(N40), .A1(n250), .B0(res_do[0]), .B1(n256), .C0(N227), 
        .C1(n257), .Y(n255) );
  CLKINVX1 U371 ( .A(n258), .Y(n257) );
  AOI22X1 U372 ( .A0(N227), .A1(n259), .B0(n186), .B1(n260), .Y(n254) );
  AOI22X1 U373 ( .A0(n186), .A1(n261), .B0(n262), .B1(res_di[0]), .Y(n253) );
  OAI211X1 U374 ( .A0(n263), .A1(n258), .B0(n264), .C0(n265), .Y(n165) );
  AOI222XL U375 ( .A0(res_di[1]), .A1(n262), .B0(N378), .B1(n259), .C0(N325), 
        .C1(n260), .Y(n265) );
  AOI22X1 U376 ( .A0(N233), .A1(n261), .B0(res_do[1]), .B1(n256), .Y(n264) );
  OAI211X1 U377 ( .A0(n266), .A1(n258), .B0(n267), .C0(n268), .Y(n164) );
  AOI222XL U378 ( .A0(res_di[2]), .A1(n262), .B0(N379), .B1(n259), .C0(N326), 
        .C1(n260), .Y(n268) );
  AOI22X1 U379 ( .A0(N234), .A1(n261), .B0(res_do[2]), .B1(n256), .Y(n267) );
  CLKINVX1 U380 ( .A(N229), .Y(n266) );
  OAI211X1 U381 ( .A0(n269), .A1(n258), .B0(n270), .C0(n271), .Y(n163) );
  AOI222XL U382 ( .A0(res_di[3]), .A1(n262), .B0(N380), .B1(n259), .C0(N327), 
        .C1(n260), .Y(n271) );
  AOI22X1 U383 ( .A0(N235), .A1(n261), .B0(res_do[3]), .B1(n256), .Y(n270) );
  CLKINVX1 U384 ( .A(N230), .Y(n269) );
  OAI211X1 U385 ( .A0(n272), .A1(n258), .B0(n273), .C0(n274), .Y(n162) );
  AOI222XL U386 ( .A0(res_di[4]), .A1(n262), .B0(N381), .B1(n259), .C0(N328), 
        .C1(n260), .Y(n274) );
  NOR2X1 U387 ( .A(n275), .B(N322), .Y(n260) );
  AOI22X1 U388 ( .A0(N236), .A1(n261), .B0(res_do[4]), .B1(n256), .Y(n273) );
  OAI211X1 U389 ( .A0(n357), .A1(n283), .B0(n284), .C0(n285), .Y(n282) );
  NAND2X1 U390 ( .A(n286), .B(n287), .Y(n279) );
  AO21X1 U391 ( .A0(n184), .A1(N231), .B0(N374), .Y(n289) );
  ACHCINX2 U392 ( .CIN(res_do[3]), .A(N230), .B(n290), .CO(n288) );
  ACHCINX2 U393 ( .CIN(res_do[2]), .A(N229), .B(n291), .CO(n290) );
  AOI21X1 U394 ( .A0(n263), .A1(res_do[1]), .B0(n292), .Y(n291) );
  AOI211X1 U395 ( .A0(N228), .A1(n182), .B0(n186), .C0(N227), .Y(n292) );
  CLKINVX1 U396 ( .A(N228), .Y(n263) );
  AOI21X1 U397 ( .A0(n180), .A1(n287), .B0(n192), .Y(n277) );
  NOR2X1 U398 ( .A(n241), .B(n281), .Y(n261) );
  NAND2X1 U399 ( .A(n191), .B(n281), .Y(n258) );
  AOI2BB2X1 U400 ( .B0(n295), .B1(n296), .A0N(n184), .A1N(res_di[4]), .Y(n278)
         );
  OAI211X1 U401 ( .A0(n183), .A1(n297), .B0(n298), .C0(n299), .Y(n296) );
  OAI2BB1X1 U402 ( .A0N(n183), .A1N(n297), .B0(n300), .Y(n299) );
  OAI222XL U403 ( .A0(res_do[3]), .A1(n300), .B0(res_do[2]), .B1(n301), .C0(
        n302), .C1(n303), .Y(n298) );
  NOR2X1 U404 ( .A(res_di[1]), .B(n182), .Y(n303) );
  AOI211X1 U405 ( .A0(res_di[1]), .A1(n182), .B0(n186), .C0(res_di[0]), .Y(
        n302) );
  NAND2X1 U406 ( .A(res_do[2]), .B(n301), .Y(n297) );
  CLKINVX1 U407 ( .A(res_di[2]), .Y(n301) );
  NAND2X1 U408 ( .A(res_di[4]), .B(n184), .Y(n295) );
  CLKINVX1 U409 ( .A(N231), .Y(n272) );
  NAND2X1 U410 ( .A(n357), .B(n304), .Y(n156) );
  NAND4BX1 U411 ( .AN(n305), .B(n306), .C(n307), .D(n308), .Y(n304) );
  NOR4X1 U412 ( .A(res_addr[6]), .B(res_addr[5]), .C(res_addr[4]), .D(
        res_addr[3]), .Y(n308) );
  NOR4X1 U413 ( .A(res_addr[2]), .B(res_addr[1]), .C(res_addr[0]), .D(n356), 
        .Y(n307) );
  AND4X1 U414 ( .A(res_addr[13]), .B(res_addr[7]), .C(res_addr[8]), .D(
        res_addr[9]), .Y(n306) );
  NAND4BX1 U415 ( .AN(n309), .B(res_addr[10]), .C(res_addr[11]), .D(
        res_addr[12]), .Y(n305) );
  XOR2X1 U416 ( .A(n358), .B(n252), .Y(n155) );
  AND3X1 U417 ( .A(n242), .B(n225), .C(n250), .Y(n252) );
  OAI21XL U418 ( .A0(n180), .A1(n310), .B0(n356), .Y(n154) );
  NAND2X1 U419 ( .A(n149), .B(n311), .Y(n153) );
  NAND4X1 U420 ( .A(n312), .B(n313), .C(n314), .D(n315), .Y(n311) );
  NOR4X1 U421 ( .A(res_addr[9]), .B(res_addr[8]), .C(res_addr[6]), .D(
        res_addr[5]), .Y(n315) );
  NOR4X1 U422 ( .A(res_addr[4]), .B(res_addr[3]), .C(res_addr[2]), .D(
        res_addr[1]), .Y(n314) );
  NOR4X1 U423 ( .A(res_addr[13]), .B(res_addr[12]), .C(res_addr[11]), .D(
        res_addr[10]), .Y(n313) );
  NOR4BX1 U424 ( .AN(res_addr[7]), .B(res_addr[0]), .C(n357), .D(n309), .Y(
        n312) );
  NAND2X1 U425 ( .A(n316), .B(n317), .Y(N530) );
  AOI222XL U426 ( .A0(N347), .A1(n318), .B0(N137), .B1(n319), .C0(N315), .C1(
        n190), .Y(n317) );
  AOI222XL U427 ( .A0(N54), .A1(n193), .B0(N448), .B1(n192), .C0(N224), .C1(
        n191), .Y(n316) );
  NAND2X1 U428 ( .A(n321), .B(n322), .Y(N529) );
  AOI222XL U429 ( .A0(N346), .A1(n318), .B0(N136), .B1(n319), .C0(N314), .C1(
        n190), .Y(n322) );
  AOI222XL U430 ( .A0(N53), .A1(n193), .B0(N447), .B1(n192), .C0(N223), .C1(
        n191), .Y(n321) );
  NAND2X1 U431 ( .A(n323), .B(n324), .Y(N528) );
  AOI222XL U432 ( .A0(N345), .A1(n318), .B0(N135), .B1(n319), .C0(N313), .C1(
        n190), .Y(n324) );
  AOI222XL U433 ( .A0(N52), .A1(n193), .B0(N446), .B1(n192), .C0(N222), .C1(
        n191), .Y(n323) );
  NAND2X1 U434 ( .A(n325), .B(n326), .Y(N527) );
  AOI222XL U435 ( .A0(N344), .A1(n318), .B0(N134), .B1(n319), .C0(N312), .C1(
        n190), .Y(n326) );
  AOI222XL U436 ( .A0(N51), .A1(n193), .B0(N445), .B1(n192), .C0(N221), .C1(
        n191), .Y(n325) );
  NAND2X1 U437 ( .A(n327), .B(n328), .Y(N526) );
  AOI222XL U438 ( .A0(N343), .A1(n318), .B0(N133), .B1(n319), .C0(N311), .C1(
        n190), .Y(n328) );
  AOI222XL U439 ( .A0(N50), .A1(n193), .B0(N444), .B1(n192), .C0(N220), .C1(
        n191), .Y(n327) );
  NAND2X1 U440 ( .A(n329), .B(n330), .Y(N525) );
  AOI222XL U441 ( .A0(N342), .A1(n318), .B0(N132), .B1(n319), .C0(N310), .C1(
        n190), .Y(n330) );
  AOI222XL U442 ( .A0(N49), .A1(n193), .B0(N443), .B1(n192), .C0(N219), .C1(
        n191), .Y(n329) );
  NAND2X1 U443 ( .A(n331), .B(n332), .Y(N524) );
  AOI222XL U444 ( .A0(N341), .A1(n318), .B0(N131), .B1(n319), .C0(N309), .C1(
        n190), .Y(n332) );
  AOI222XL U445 ( .A0(N48), .A1(n193), .B0(N442), .B1(n192), .C0(N218), .C1(
        n191), .Y(n331) );
  NAND2X1 U446 ( .A(n333), .B(n334), .Y(N523) );
  AOI222XL U447 ( .A0(N340), .A1(n318), .B0(N130), .B1(n319), .C0(N308), .C1(
        n190), .Y(n334) );
  AOI222XL U448 ( .A0(N47), .A1(n193), .B0(N441), .B1(n192), .C0(N217), .C1(
        n191), .Y(n333) );
  NAND2X1 U449 ( .A(n335), .B(n336), .Y(N522) );
  AOI222XL U450 ( .A0(N339), .A1(n318), .B0(N129), .B1(n319), .C0(N307), .C1(
        n190), .Y(n336) );
  AOI222XL U451 ( .A0(N46), .A1(n193), .B0(N440), .B1(n192), .C0(N216), .C1(
        n191), .Y(n335) );
  NAND2X1 U452 ( .A(n337), .B(n338), .Y(N521) );
  AOI222XL U453 ( .A0(N338), .A1(n318), .B0(N128), .B1(n319), .C0(N306), .C1(
        n190), .Y(n338) );
  AOI222XL U454 ( .A0(N45), .A1(n193), .B0(N439), .B1(n192), .C0(N215), .C1(
        n191), .Y(n337) );
  NAND2X1 U455 ( .A(n339), .B(n340), .Y(N520) );
  AOI222XL U456 ( .A0(N337), .A1(n318), .B0(N127), .B1(n319), .C0(N305), .C1(
        n190), .Y(n340) );
  AOI222XL U457 ( .A0(N44), .A1(n193), .B0(N438), .B1(n192), .C0(N214), .C1(
        n191), .Y(n339) );
  NAND2X1 U458 ( .A(n341), .B(n342), .Y(N519) );
  AOI222XL U459 ( .A0(N336), .A1(n318), .B0(N126), .B1(n319), .C0(N304), .C1(
        n190), .Y(n342) );
  AOI222XL U460 ( .A0(N43), .A1(n193), .B0(N437), .B1(n192), .C0(N213), .C1(
        n191), .Y(n341) );
  NAND2X1 U461 ( .A(n343), .B(n344), .Y(N518) );
  AOI222XL U462 ( .A0(N335), .A1(n318), .B0(N125), .B1(n319), .C0(N303), .C1(
        n190), .Y(n344) );
  AOI222XL U463 ( .A0(N42), .A1(n193), .B0(N436), .B1(n192), .C0(N212), .C1(
        n191), .Y(n343) );
  NAND2X1 U464 ( .A(n345), .B(n346), .Y(N517) );
  AOI222XL U465 ( .A0(N334), .A1(n318), .B0(n185), .B1(n319), .C0(n185), .C1(
        n190), .Y(n346) );
  NAND2X1 U466 ( .A(n244), .B(n180), .Y(n275) );
  AOI222XL U467 ( .A0(N41), .A1(n193), .B0(n185), .B1(n192), .C0(n185), .C1(
        n191), .Y(n345) );
  NAND2X1 U468 ( .A(n348), .B(n286), .Y(n241) );
  NAND2X1 U469 ( .A(n348), .B(n180), .Y(n240) );
  NOR2X1 U470 ( .A(n180), .B(n356), .Y(n286) );
  NAND2X1 U471 ( .A(n285), .B(n349), .Y(n347) );
  NOR2BX1 U472 ( .AN(n309), .B(n287), .Y(n285) );
  NAND2X1 U473 ( .A(n247), .B(n245), .Y(n287) );
  NAND2X1 U474 ( .A(n242), .B(n349), .Y(n245) );
  NAND4BX1 U475 ( .AN(res_di[4]), .B(n300), .C(n350), .D(n351), .Y(n309) );
  NOR4X1 U476 ( .A(res_di[2]), .B(res_di[1]), .C(res_di[0]), .D(n283), .Y(n351) );
  NAND3X1 U477 ( .A(n349), .B(n160), .C(n159), .Y(n283) );
  NOR3X1 U478 ( .A(res_di[5]), .B(res_di[7]), .C(res_di[6]), .Y(n350) );
  CLKINVX1 U479 ( .A(res_di[3]), .Y(n300) );
  NAND4X1 U480 ( .A(n352), .B(n353), .C(n354), .D(n355), .Y(n310) );
  AND4X1 U481 ( .A(n225), .B(n242), .C(n358), .D(sti_addr[1]), .Y(n355) );
  NOR2X1 U482 ( .A(n160), .B(n159), .Y(n242) );
  AND3X1 U483 ( .A(sti_addr[3]), .B(sti_addr[0]), .C(sti_addr[2]), .Y(n354) );
  AND3X1 U484 ( .A(sti_addr[6]), .B(sti_addr[4]), .C(sti_addr[5]), .Y(n353) );
  AND3X1 U485 ( .A(sti_addr[9]), .B(sti_addr[7]), .C(sti_addr[8]), .Y(n352) );
  CLKINVX1 U486 ( .A(n284), .Y(N509) );
  NOR2X1 U487 ( .A(n348), .B(n250), .Y(n284) );
  CLKINVX1 U488 ( .A(n239), .Y(n250) );
  NAND2X1 U489 ( .A(n356), .B(n357), .Y(n239) );
  CLKINVX1 U490 ( .A(n349), .Y(n248) );
  NOR2X1 U491 ( .A(n225), .B(n358), .Y(n349) );
endmodule


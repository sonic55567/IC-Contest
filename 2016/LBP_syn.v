/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : Q-2019.12
// Date      : Wed Mar 23 16:18:45 2022
/////////////////////////////////////////////////////////////


module LBP_DW01_inc_0_DW01_inc_2 ( A, SUM );
  input [13:0] A;
  output [13:0] SUM;

  wire   [13:2] carry;

  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_12 ( .A(A[12]), .B(carry[12]), .CO(carry[13]), .S(SUM[12]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADDHXL U1_1_11 ( .A(A[11]), .B(carry[11]), .CO(carry[12]), .S(SUM[11]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  XOR2X1 U1 ( .A(carry[13]), .B(A[13]), .Y(SUM[13]) );
  INVXL U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module LBP ( clk, reset, gray_addr, gray_req, gray_ready, gray_data, lbp_addr, 
        lbp_valid, lbp_data, finish );
  output [13:0] gray_addr;
  input [7:0] gray_data;
  output [13:0] lbp_addr;
  output [7:0] lbp_data;
  input clk, reset, gray_ready;
  output gray_req, lbp_valid, finish;
  wire   n469, n470, n471, n472, n473, n474, n475, n476, n477, n478, n479,
         n480, n481, n482, n483, n484, n485, n486, n487, n488, n489, n490,
         n491, n492, n493, n494, n495, n496, n497, n498, n499, n500, N37, N38,
         N39, N40, N41, N42, N43, N44, N45, N46, N47, N48, N49, N50, N98, N99,
         N100, N101, N102, N103, N104, N105, N106, N107, N108, N109, N110,
         N111, N158, N160, N161, N162, N163, N164, N165, N166, N167, N168,
         N169, N170, N171, N180, N181, N182, N183, N184, N185, N186, N187,
         N188, N189, N190, N191, N260, N261, N262, N263, N264, N265, N266,
         N283, N284, N285, N286, N287, N288, N290, N291, N292, N293, N294,
         N295, N307, N308, N309, N310, N311, N312, N313, N314, N315, N316,
         N317, N318, N319, N320, n40, n41, n42, n45, n47, n48, n49, n50, n51,
         n53, n54, n55, n56, n58, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n75, n76, n77, n79, n80, n82, n83, n85,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, \r444/carry[2] , \r444/carry[3] ,
         \r444/carry[4] , \r444/carry[5] , \r444/carry[6] , \r444/carry[7] ,
         \r444/carry[8] , \r444/carry[9] , \r444/carry[10] , \r444/carry[11] ,
         \r444/carry[12] , n350, n351, n352, n353, n380, n382, n383, n384,
         n385, n386, n387, n388, n389, n390, n391, n392, n393, n394, n395,
         n396, n397, n398, n399, n400, n401, n402, n403, n404, n405, n406,
         n407, n408, n409, n410, n411, n412, n413, n414, n415, n416, n417,
         n418, n419, n420, n421, n422, n423, n424, n425, n426, n427, n428,
         n441, n442, n443, n444, n445, n446, n447, n448, n449, n450, n451,
         n452, n453, n454, n455, n456, n457, n458, n459, n460, n461, n462,
         n463, n464, n465, n466, n467, n468;
  wire   [2:0] state;
  wire   [3:0] count;
  wire   [7:0] center;
  wire   [14:0] \sub_134/carry ;
  wire   [13:1] \add_94/carry ;
  wire   [13:1] \r447/carry ;

  LBP_DW01_inc_0_DW01_inc_2 r442 ( .A({n469, gray_addr[12:1], N158}), .SUM({
        N50, N49, N48, N47, N46, N45, N44, N43, N42, N41, N40, N39, N38, N37})
         );
  EDFFX1 \buffer_reg[0]  ( .D(n384), .E(n461), .CK(clk), .Q(N260) );
  DFFQX1 \buffer_reg[4]  ( .D(n171), .CK(clk), .Q(N264) );
  DFFQX1 \buffer_reg[2]  ( .D(n173), .CK(clk), .Q(N262) );
  DFFQX1 \buffer_reg[5]  ( .D(n170), .CK(clk), .Q(N265) );
  DFFQX1 \buffer_reg[3]  ( .D(n172), .CK(clk), .Q(N263) );
  DFFQX1 \buffer_reg[1]  ( .D(n174), .CK(clk), .Q(N261) );
  EDFFX1 \center_reg[0]  ( .D(gray_data[0]), .E(n142), .CK(clk), .Q(center[0])
         );
  EDFFX1 \center_reg[5]  ( .D(gray_data[5]), .E(n142), .CK(clk), .QN(n351) );
  EDFFX1 \center_reg[3]  ( .D(gray_data[3]), .E(n142), .CK(clk), .QN(n352) );
  EDFFX1 \center_reg[1]  ( .D(gray_data[1]), .E(n142), .CK(clk), .QN(n353) );
  EDFFX1 \center_reg[2]  ( .D(gray_data[2]), .E(n142), .CK(clk), .Q(center[2])
         );
  DFFRX1 \gray_addr_reg[12]  ( .D(n176), .CK(clk), .RN(n442), .Q(n470), .QN(
        n128) );
  EDFFX1 \center_reg[6]  ( .D(gray_data[6]), .E(n142), .CK(clk), .Q(center[6])
         );
  DFFRX1 \state_reg[1]  ( .D(n193), .CK(clk), .RN(n441), .Q(state[1]), .QN(
        n350) );
  DFFRX1 \state_reg[0]  ( .D(n192), .CK(clk), .RN(n442), .Q(state[0]) );
  EDFFX1 \center_reg[4]  ( .D(gray_data[4]), .E(n142), .CK(clk), .Q(center[4])
         );
  DFFRX1 \gray_addr_reg[9]  ( .D(n179), .CK(clk), .RN(n442), .Q(n473), .QN(
        n131) );
  DFFRX1 \gray_addr_reg[10]  ( .D(n178), .CK(clk), .RN(n442), .Q(n472), .QN(
        n130) );
  DFFRX1 \gray_addr_reg[11]  ( .D(n177), .CK(clk), .RN(n442), .Q(n471), .QN(
        n129) );
  DFFRX1 \count_reg[2]  ( .D(n190), .CK(clk), .RN(n441), .Q(count[2]), .QN(
        n144) );
  DFFRX1 \gray_addr_reg[6]  ( .D(n182), .CK(clk), .RN(n460), .Q(N288), .QN(
        n134) );
  DFFRX1 \gray_addr_reg[7]  ( .D(n181), .CK(clk), .RN(n460), .Q(n475), .QN(
        n133) );
  DFFRX1 \gray_addr_reg[8]  ( .D(n180), .CK(clk), .RN(n460), .Q(n474), .QN(
        n132) );
  DFFRX1 \gray_addr_reg[4]  ( .D(n184), .CK(clk), .RN(n441), .Q(N286), .QN(
        n136) );
  DFFRX1 \gray_addr_reg[5]  ( .D(n183), .CK(clk), .RN(n441), .Q(N287), .QN(
        n135) );
  DFFRX1 \gray_addr_reg[1]  ( .D(n188), .CK(clk), .RN(n441), .Q(N283), .QN(
        n139) );
  DFFRX1 \gray_addr_reg[2]  ( .D(n186), .CK(clk), .RN(n442), .Q(N284), .QN(
        n138) );
  DFFRX1 \gray_addr_reg[3]  ( .D(n185), .CK(clk), .RN(n442), .Q(N285), .QN(
        n137) );
  DFFRX1 \count_reg[3]  ( .D(n194), .CK(clk), .RN(n441), .Q(count[3]), .QN(
        n143) );
  DFFRX1 \count_reg[1]  ( .D(n189), .CK(clk), .RN(n441), .Q(count[1]), .QN(
        n145) );
  DFFRX1 \count_reg[0]  ( .D(n195), .CK(clk), .RN(n442), .Q(count[0]), .QN(
        n146) );
  DFFQXL \buffer_reg[6]  ( .D(n169), .CK(clk), .Q(N266) );
  DFFRX1 \gray_addr_reg[0]  ( .D(n187), .CK(clk), .RN(n442), .Q(N158), .QN(
        n140) );
  DFFRX1 \gray_addr_reg[13]  ( .D(n175), .CK(clk), .RN(n442), .Q(n469), .QN(
        n127) );
  DFFRX1 lbp_valid_reg ( .D(n124), .CK(clk), .RN(n442), .Q(n491), .QN(n122) );
  DFFRX1 \lbp_data_reg[7]  ( .D(n153), .CK(clk), .RN(n441), .Q(n492), .QN(n114) );
  DFFRX1 \lbp_data_reg[6]  ( .D(n152), .CK(clk), .RN(n441), .Q(n493), .QN(n115) );
  DFFRX1 \lbp_data_reg[5]  ( .D(n151), .CK(clk), .RN(n441), .Q(n494), .QN(n116) );
  DFFRX1 \lbp_data_reg[4]  ( .D(n150), .CK(clk), .RN(n441), .Q(n495), .QN(n117) );
  DFFRX1 \lbp_data_reg[3]  ( .D(n149), .CK(clk), .RN(n441), .Q(n496), .QN(n118) );
  DFFRX1 \lbp_data_reg[2]  ( .D(n148), .CK(clk), .RN(n441), .Q(n497), .QN(n119) );
  DFFRX1 \lbp_data_reg[1]  ( .D(n147), .CK(clk), .RN(n441), .Q(n498), .QN(n120) );
  DFFRX1 \lbp_data_reg[0]  ( .D(n168), .CK(clk), .RN(n441), .Q(n499), .QN(n99)
         );
  DFFRX1 gray_req_reg ( .D(n191), .CK(clk), .RN(n441), .Q(n476), .QN(n98) );
  DFFRX1 \lbp_addr_reg[13]  ( .D(n167), .CK(clk), .RN(n441), .Q(n477), .QN(
        n100) );
  DFFRX1 \lbp_addr_reg[12]  ( .D(n166), .CK(clk), .RN(n442), .Q(n478), .QN(
        n101) );
  DFFRX1 \lbp_addr_reg[11]  ( .D(n165), .CK(clk), .RN(n442), .Q(n479), .QN(
        n102) );
  DFFRX1 \lbp_addr_reg[10]  ( .D(n164), .CK(clk), .RN(n442), .Q(n480), .QN(
        n103) );
  DFFRX1 \lbp_addr_reg[9]  ( .D(n163), .CK(clk), .RN(n442), .Q(n481), .QN(n104) );
  DFFRX1 \lbp_addr_reg[8]  ( .D(n162), .CK(clk), .RN(n442), .Q(n482), .QN(n105) );
  DFFRX1 \lbp_addr_reg[7]  ( .D(n161), .CK(clk), .RN(n442), .Q(n483), .QN(n106) );
  DFFRX1 \lbp_addr_reg[6]  ( .D(n160), .CK(clk), .RN(n442), .Q(n484), .QN(n107) );
  DFFRX1 \lbp_addr_reg[5]  ( .D(n159), .CK(clk), .RN(n442), .Q(n485), .QN(n108) );
  DFFRX1 \lbp_addr_reg[4]  ( .D(n158), .CK(clk), .RN(n442), .Q(n486), .QN(n109) );
  DFFRX1 \lbp_addr_reg[3]  ( .D(n157), .CK(clk), .RN(n442), .Q(n487), .QN(n110) );
  DFFRX1 \lbp_addr_reg[2]  ( .D(n156), .CK(clk), .RN(n442), .Q(n488), .QN(n111) );
  DFFRX1 \lbp_addr_reg[1]  ( .D(n155), .CK(clk), .RN(n442), .Q(n489), .QN(n112) );
  DFFRX1 \lbp_addr_reg[0]  ( .D(n154), .CK(clk), .RN(n442), .Q(n490), .QN(n113) );
  DFFRX1 finish_reg ( .D(n123), .CK(clk), .RN(n441), .Q(n500), .QN(n121) );
  EDFFXL \center_reg[7]  ( .D(gray_data[7]), .E(n142), .CK(clk), .QN(n458) );
  OAI22X1 U280 ( .A0(n451), .A1(n450), .B0(n449), .B1(n352), .Y(n454) );
  OR2X1 U281 ( .A(gray_addr[1]), .B(N158), .Y(\r444/carry[2] ) );
  BUFX12 U282 ( .A(n500), .Y(finish) );
  BUFX12 U283 ( .A(n490), .Y(lbp_addr[0]) );
  BUFX12 U284 ( .A(n489), .Y(lbp_addr[1]) );
  BUFX12 U285 ( .A(n488), .Y(lbp_addr[2]) );
  BUFX12 U286 ( .A(n487), .Y(lbp_addr[3]) );
  BUFX12 U287 ( .A(n486), .Y(lbp_addr[4]) );
  BUFX12 U288 ( .A(n485), .Y(lbp_addr[5]) );
  BUFX12 U289 ( .A(n484), .Y(lbp_addr[6]) );
  BUFX12 U290 ( .A(n483), .Y(lbp_addr[7]) );
  BUFX12 U291 ( .A(n482), .Y(lbp_addr[8]) );
  BUFX12 U292 ( .A(n481), .Y(lbp_addr[9]) );
  BUFX12 U293 ( .A(n480), .Y(lbp_addr[10]) );
  BUFX12 U294 ( .A(n479), .Y(lbp_addr[11]) );
  BUFX12 U295 ( .A(n478), .Y(lbp_addr[12]) );
  BUFX12 U296 ( .A(n477), .Y(lbp_addr[13]) );
  BUFX12 U297 ( .A(n476), .Y(gray_req) );
  BUFX12 U298 ( .A(n499), .Y(lbp_data[0]) );
  BUFX12 U299 ( .A(n498), .Y(lbp_data[1]) );
  BUFX12 U300 ( .A(n497), .Y(lbp_data[2]) );
  BUFX12 U301 ( .A(n496), .Y(lbp_data[3]) );
  BUFX12 U302 ( .A(n495), .Y(lbp_data[4]) );
  BUFX12 U303 ( .A(n494), .Y(lbp_data[5]) );
  BUFX12 U304 ( .A(n493), .Y(lbp_data[6]) );
  BUFX12 U305 ( .A(n492), .Y(lbp_data[7]) );
  BUFX12 U306 ( .A(n491), .Y(lbp_valid) );
  BUFX12 U307 ( .A(n469), .Y(gray_addr[13]) );
  XOR2XL U308 ( .A(n469), .B(\add_94/carry [13]), .Y(N191) );
  XOR2XL U309 ( .A(n469), .B(\r447/carry [13]), .Y(N171) );
  NOR2X1 U310 ( .A(gray_addr[12]), .B(\r444/carry[12] ), .Y(n383) );
  NAND2X1 U311 ( .A(n380), .B(n62), .Y(n175) );
  AOI22X1 U312 ( .A0(N320), .A1(n427), .B0(N50), .B1(n428), .Y(n62) );
  AOI22X1 U313 ( .A0(N319), .A1(n427), .B0(N49), .B1(n428), .Y(n65) );
  OAI21XL U314 ( .A0(n128), .A1(n426), .B0(n65), .Y(n176) );
  OAI221X1 U315 ( .A0(center[6]), .A1(n459), .B0(n455), .B1(n454), .C0(n453), 
        .Y(n456) );
  INVX8 U316 ( .A(n382), .Y(n47) );
  AOI22XL U317 ( .A0(N308), .A1(n427), .B0(N38), .B1(n428), .Y(n77) );
  XNOR2XL U318 ( .A(n469), .B(\sub_134/carry [13]), .Y(N295) );
  OR2X1 U319 ( .A(n127), .B(n426), .Y(n380) );
  INVX16 U320 ( .A(n140), .Y(gray_addr[0]) );
  OAI222X1 U321 ( .A0(center[6]), .A1(n446), .B0(n459), .B1(n446), .C0(
        center[6]), .C1(n459), .Y(n457) );
  OAI222X1 U322 ( .A0(gray_data[5]), .A1(n351), .B0(gray_data[5]), .B1(n445), 
        .C0(n351), .C1(n445), .Y(n446) );
  CLKINVX1 U323 ( .A(n40), .Y(n463) );
  CLKINVX1 U324 ( .A(reset), .Y(n460) );
  NAND3X1 U325 ( .A(n53), .B(n467), .C(n60), .Y(n41) );
  NOR2X1 U326 ( .A(count[3]), .B(n146), .Y(n53) );
  AND3X8 U327 ( .A(n384), .B(n441), .C(n467), .Y(n382) );
  CLKBUFX3 U328 ( .A(n463), .Y(n443) );
  CLKBUFX3 U329 ( .A(n463), .Y(n444) );
  CLKINVX1 U330 ( .A(n85), .Y(n464) );
  CLKBUFX3 U331 ( .A(n64), .Y(n428) );
  NOR2BX1 U332 ( .AN(n426), .B(n466), .Y(n64) );
  BUFX4 U333 ( .A(n460), .Y(n441) );
  CLKINVX1 U334 ( .A(n41), .Y(n461) );
  CLKBUFX3 U335 ( .A(n416), .Y(n425) );
  NOR2BX1 U336 ( .AN(n387), .B(n144), .Y(n416) );
  OAI21X1 U337 ( .A0(n466), .A1(n79), .B0(n40), .Y(n85) );
  NAND2X1 U338 ( .A(n90), .B(n467), .Y(n40) );
  CLKINVX1 U339 ( .A(n45), .Y(n467) );
  CLKINVX1 U340 ( .A(n97), .Y(n462) );
  NAND2X1 U341 ( .A(n462), .B(n465), .Y(n82) );
  CLKBUFX3 U342 ( .A(n61), .Y(n426) );
  AO21X1 U343 ( .A0(n79), .A1(n80), .B0(n462), .Y(n61) );
  CLKBUFX3 U344 ( .A(n63), .Y(n427) );
  NOR2BX1 U345 ( .AN(n426), .B(n45), .Y(n63) );
  NAND3X1 U346 ( .A(count[1]), .B(n468), .C(n53), .Y(n48) );
  CLKINVX1 U347 ( .A(n80), .Y(n466) );
  BUFX4 U348 ( .A(n460), .Y(n442) );
  XOR2X1 U349 ( .A(n469), .B(n383), .Y(N111) );
  AOI222XL U350 ( .A0(N171), .A1(n423), .B0(N111), .B1(n424), .C0(N191), .C1(
        n425), .Y(n419) );
  OAI31XL U351 ( .A0(n49), .A1(n468), .A2(n47), .B0(n58), .Y(n174) );
  NAND2X1 U352 ( .A(N261), .B(n41), .Y(n58) );
  OAI31XL U353 ( .A0(n54), .A1(count[3]), .A2(n47), .B0(n55), .Y(n172) );
  NAND3X1 U354 ( .A(n146), .B(n468), .C(n145), .Y(n54) );
  NAND2X1 U355 ( .A(N263), .B(n41), .Y(n55) );
  OAI31XL U356 ( .A0(n49), .A1(n144), .A2(n47), .B0(n50), .Y(n170) );
  NAND2X1 U357 ( .A(N265), .B(n41), .Y(n50) );
  OAI2BB2XL U358 ( .B0(n47), .B1(n48), .A0N(N266), .A1N(n41), .Y(n169) );
  OAI2BB2XL U359 ( .B0(n114), .B1(n443), .A0N(n384), .A1N(n444), .Y(n153) );
  OAI2BB2XL U360 ( .B0(n100), .B1(n443), .A0N(N111), .A1N(n443), .Y(n167) );
  OAI2BB2XL U361 ( .B0(n101), .B1(n463), .A0N(N110), .A1N(n443), .Y(n166) );
  OAI21XL U362 ( .A0(n129), .A1(n426), .B0(n66), .Y(n177) );
  AOI22X1 U363 ( .A0(N318), .A1(n427), .B0(N48), .B1(n428), .Y(n66) );
  OAI21XL U364 ( .A0(n130), .A1(n426), .B0(n67), .Y(n178) );
  AOI22X1 U365 ( .A0(N317), .A1(n427), .B0(N47), .B1(n428), .Y(n67) );
  AOI2BB1X4 U366 ( .A0N(gray_data[7]), .A1N(n458), .B0(n385), .Y(n384) );
  AOI22X1 U367 ( .A0(n458), .A1(gray_data[7]), .B0(n457), .B1(n456), .Y(n385)
         );
  OAI2BB1X1 U368 ( .A0N(N264), .A1N(n41), .B0(n51), .Y(n171) );
  NAND4X1 U369 ( .A(n382), .B(n53), .C(n145), .D(n468), .Y(n51) );
  OAI2BB1X1 U370 ( .A0N(N262), .A1N(n41), .B0(n56), .Y(n173) );
  NAND4X1 U371 ( .A(n382), .B(n53), .C(n144), .D(count[1]), .Y(n56) );
  NOR4X4 U372 ( .A(n42), .B(count[3]), .C(n468), .D(n45), .Y(n142) );
  NAND3X1 U373 ( .A(n146), .B(n441), .C(n145), .Y(n42) );
  BUFX16 U374 ( .A(N283), .Y(gray_addr[1]) );
  BUFX16 U375 ( .A(N284), .Y(gray_addr[2]) );
  BUFX16 U376 ( .A(N285), .Y(gray_addr[3]) );
  NOR3X1 U377 ( .A(n468), .B(reset), .C(count[1]), .Y(n60) );
  OAI2BB2XL U378 ( .B0(n103), .B1(n443), .A0N(N108), .A1N(n443), .Y(n164) );
  OAI2BB2XL U379 ( .B0(n104), .B1(n443), .A0N(N107), .A1N(n444), .Y(n163) );
  OAI2BB2XL U380 ( .B0(n102), .B1(n463), .A0N(N109), .A1N(n444), .Y(n165) );
  OAI21XL U381 ( .A0(n133), .A1(n426), .B0(n70), .Y(n181) );
  AOI22X1 U382 ( .A0(N314), .A1(n427), .B0(N44), .B1(n428), .Y(n70) );
  OAI21XL U383 ( .A0(n132), .A1(n426), .B0(n69), .Y(n180) );
  AOI22X1 U384 ( .A0(N315), .A1(n427), .B0(N45), .B1(n428), .Y(n69) );
  OAI21XL U385 ( .A0(n131), .A1(n426), .B0(n68), .Y(n179) );
  AOI22X1 U386 ( .A0(N316), .A1(n427), .B0(N46), .B1(n428), .Y(n68) );
  CLKINVX1 U387 ( .A(gray_data[6]), .Y(n459) );
  BUFX16 U388 ( .A(N286), .Y(gray_addr[4]) );
  BUFX16 U389 ( .A(N287), .Y(gray_addr[5]) );
  OAI2BB2XL U390 ( .B0(n105), .B1(n443), .A0N(N106), .A1N(n444), .Y(n162) );
  OAI2BB2XL U391 ( .B0(n106), .B1(n443), .A0N(N105), .A1N(n444), .Y(n161) );
  OAI21XL U392 ( .A0(n136), .A1(n426), .B0(n73), .Y(n184) );
  AOI22X1 U393 ( .A0(N311), .A1(n427), .B0(N41), .B1(n428), .Y(n73) );
  OAI21XL U394 ( .A0(n134), .A1(n426), .B0(n71), .Y(n182) );
  AOI22X1 U395 ( .A0(N313), .A1(n427), .B0(N43), .B1(n428), .Y(n71) );
  OAI21XL U396 ( .A0(n135), .A1(n426), .B0(n72), .Y(n183) );
  AOI22X1 U397 ( .A0(N312), .A1(n427), .B0(N42), .B1(n428), .Y(n72) );
  INVXL U398 ( .A(N158), .Y(N98) );
  BUFX16 U399 ( .A(n475), .Y(gray_addr[7]) );
  BUFX16 U400 ( .A(n474), .Y(gray_addr[8]) );
  BUFX16 U401 ( .A(N288), .Y(gray_addr[6]) );
  OAI2BB2XL U402 ( .B0(n107), .B1(n443), .A0N(N104), .A1N(n444), .Y(n160) );
  OAI2BB2XL U403 ( .B0(n108), .B1(n443), .A0N(N103), .A1N(n444), .Y(n159) );
  OAI2BB2XL U404 ( .B0(n109), .B1(n443), .A0N(N102), .A1N(n444), .Y(n158) );
  OAI21XL U405 ( .A0(n137), .A1(n426), .B0(n74), .Y(n185) );
  AOI22X1 U406 ( .A0(N310), .A1(n427), .B0(N40), .B1(n428), .Y(n74) );
  OAI21XL U407 ( .A0(n138), .A1(n426), .B0(n75), .Y(n186) );
  AOI22X1 U408 ( .A0(N309), .A1(n427), .B0(N39), .B1(n428), .Y(n75) );
  OAI21XL U409 ( .A0(n140), .A1(n426), .B0(n76), .Y(n187) );
  AOI22X1 U410 ( .A0(N307), .A1(n427), .B0(N37), .B1(n428), .Y(n76) );
  OAI21XL U411 ( .A0(n139), .A1(n426), .B0(n77), .Y(n188) );
  BUFX16 U412 ( .A(n473), .Y(gray_addr[9]) );
  BUFX16 U413 ( .A(n472), .Y(gray_addr[10]) );
  BUFX16 U414 ( .A(n471), .Y(gray_addr[11]) );
  OAI2BB2XL U415 ( .B0(n110), .B1(n443), .A0N(N101), .A1N(n444), .Y(n157) );
  OAI2BB2XL U416 ( .B0(n112), .B1(n443), .A0N(N99), .A1N(n444), .Y(n155) );
  OAI2BB2XL U417 ( .B0(n113), .B1(n443), .A0N(N98), .A1N(n444), .Y(n154) );
  OAI2BB2XL U418 ( .B0(n111), .B1(n463), .A0N(N100), .A1N(n444), .Y(n156) );
  CLKBUFX3 U419 ( .A(n414), .Y(n421) );
  XNOR2X1 U420 ( .A(n386), .B(count[1]), .Y(n414) );
  CLKBUFX3 U421 ( .A(n417), .Y(n424) );
  NOR2BX1 U422 ( .AN(n387), .B(count[2]), .Y(n417) );
  OAI211X1 U423 ( .A0(n91), .A1(n92), .B0(n93), .C0(n89), .Y(n79) );
  NAND3X1 U424 ( .A(n128), .B(n129), .C(n127), .Y(n92) );
  NAND4X1 U425 ( .A(n130), .B(n131), .C(n132), .D(n133), .Y(n91) );
  NAND4X1 U426 ( .A(n135), .B(n136), .C(n134), .D(n94), .Y(n93) );
  INVX3 U427 ( .A(n144), .Y(n468) );
  BUFX16 U428 ( .A(n470), .Y(gray_addr[12]) );
  OAI21X1 U429 ( .A0(n143), .A1(n90), .B0(n467), .Y(n97) );
  NOR4X1 U430 ( .A(n468), .B(count[1]), .C(n465), .D(n143), .Y(n90) );
  NAND2X1 U431 ( .A(state[0]), .B(n350), .Y(n45) );
  XOR2X1 U432 ( .A(n82), .B(n145), .Y(n189) );
  XOR2X1 U433 ( .A(state[0]), .B(n85), .Y(n192) );
  OAI22XL U434 ( .A0(n98), .A1(n85), .B0(n464), .B1(n466), .Y(n191) );
  CLKINVX1 U435 ( .A(n146), .Y(n465) );
  XOR2X1 U436 ( .A(n468), .B(n83), .Y(n190) );
  NOR2X1 U437 ( .A(n145), .B(n82), .Y(n83) );
  NOR2X1 U438 ( .A(state[0]), .B(state[1]), .Y(n80) );
  OAI2BB2XL U439 ( .B0(n115), .B1(n463), .A0N(N266), .A1N(n444), .Y(n152) );
  OAI2BB2XL U440 ( .B0(n116), .B1(n463), .A0N(N265), .A1N(n444), .Y(n151) );
  OAI2BB2XL U441 ( .B0(n117), .B1(n443), .A0N(N264), .A1N(n444), .Y(n150) );
  OAI2BB2XL U442 ( .B0(n118), .B1(n444), .A0N(N263), .A1N(n444), .Y(n149) );
  OAI2BB2XL U443 ( .B0(n119), .B1(n443), .A0N(N262), .A1N(n443), .Y(n148) );
  OAI2BB2XL U444 ( .B0(n120), .B1(n444), .A0N(N261), .A1N(n444), .Y(n147) );
  OAI2BB2XL U445 ( .B0(n99), .B1(n443), .A0N(N260), .A1N(n444), .Y(n168) );
  OAI21XL U446 ( .A0(n87), .A1(n88), .B0(n350), .Y(n193) );
  OR4X1 U447 ( .A(n131), .B(n130), .C(n96), .D(n129), .Y(n87) );
  OR4X1 U448 ( .A(n89), .B(n464), .C(n133), .D(n132), .Y(n88) );
  OR2X1 U449 ( .A(n127), .B(n128), .Y(n96) );
  AND4X1 U450 ( .A(n140), .B(n139), .C(n138), .D(n137), .Y(n94) );
  OR4X1 U451 ( .A(n139), .B(n138), .C(n140), .D(n95), .Y(n89) );
  OR4X1 U452 ( .A(n134), .B(n135), .C(n136), .D(n137), .Y(n95) );
  CLKBUFX3 U453 ( .A(n415), .Y(n422) );
  NOR3BXL U454 ( .AN(count[3]), .B(n421), .C(count[0]), .Y(n415) );
  CLKBUFX3 U455 ( .A(n418), .Y(n423) );
  NOR2BX1 U456 ( .AN(count[0]), .B(n421), .Y(n418) );
  OAI32X1 U457 ( .A0(n97), .A1(n465), .A2(count[3]), .B0(n146), .B1(n462), .Y(
        n195) );
  OAI22XL U458 ( .A0(n143), .A1(n462), .B0(n48), .B1(n97), .Y(n194) );
  NAND3X1 U459 ( .A(n146), .B(count[1]), .C(n143), .Y(n49) );
  NAND2X1 U460 ( .A(n122), .B(n40), .Y(n124) );
  OAI21XL U461 ( .A0(state[0]), .A1(n350), .B0(n121), .Y(n123) );
  NAND2X1 U462 ( .A(count[0]), .B(n144), .Y(n386) );
  AOI22X1 U463 ( .A0(gray_addr[0]), .A1(n422), .B0(N37), .B1(n421), .Y(n389)
         );
  NOR3X1 U464 ( .A(count[3]), .B(count[0]), .C(n421), .Y(n387) );
  AOI222XL U465 ( .A0(gray_addr[0]), .A1(n423), .B0(N98), .B1(n424), .C0(N158), 
        .C1(n425), .Y(n388) );
  NAND2X1 U466 ( .A(n389), .B(n388), .Y(N307) );
  AOI22X1 U467 ( .A0(gray_addr[1]), .A1(n422), .B0(N38), .B1(n421), .Y(n391)
         );
  AOI222XL U468 ( .A0(n139), .A1(n423), .B0(N99), .B1(n424), .C0(n139), .C1(
        n425), .Y(n390) );
  NAND2X1 U469 ( .A(n391), .B(n390), .Y(N308) );
  AOI22X1 U470 ( .A0(gray_addr[2]), .A1(n422), .B0(N39), .B1(n421), .Y(n393)
         );
  AOI222XL U471 ( .A0(N160), .A1(n423), .B0(N100), .B1(n424), .C0(N180), .C1(
        n425), .Y(n392) );
  NAND2X1 U472 ( .A(n393), .B(n392), .Y(N309) );
  AOI22X1 U473 ( .A0(gray_addr[3]), .A1(n422), .B0(N40), .B1(n421), .Y(n395)
         );
  AOI222XL U474 ( .A0(N161), .A1(n423), .B0(N101), .B1(n424), .C0(N181), .C1(
        n425), .Y(n394) );
  NAND2X1 U475 ( .A(n395), .B(n394), .Y(N310) );
  AOI22X1 U476 ( .A0(gray_addr[4]), .A1(n422), .B0(N41), .B1(n421), .Y(n397)
         );
  AOI222XL U477 ( .A0(N162), .A1(n423), .B0(N102), .B1(n424), .C0(N182), .C1(
        n425), .Y(n396) );
  NAND2X1 U478 ( .A(n397), .B(n396), .Y(N311) );
  AOI22X1 U479 ( .A0(gray_addr[5]), .A1(n422), .B0(N42), .B1(n421), .Y(n399)
         );
  AOI222XL U480 ( .A0(N163), .A1(n423), .B0(N103), .B1(n424), .C0(N183), .C1(
        n425), .Y(n398) );
  NAND2X1 U481 ( .A(n399), .B(n398), .Y(N312) );
  AOI22X1 U482 ( .A0(gray_addr[6]), .A1(n422), .B0(N43), .B1(n421), .Y(n401)
         );
  AOI222XL U483 ( .A0(N164), .A1(n423), .B0(N104), .B1(n424), .C0(N184), .C1(
        n425), .Y(n400) );
  NAND2X1 U484 ( .A(n401), .B(n400), .Y(N313) );
  AOI22X1 U485 ( .A0(n133), .A1(n422), .B0(N44), .B1(n421), .Y(n403) );
  AOI222XL U486 ( .A0(N165), .A1(n423), .B0(N105), .B1(n424), .C0(N185), .C1(
        n425), .Y(n402) );
  NAND2X1 U487 ( .A(n403), .B(n402), .Y(N314) );
  AOI22X1 U488 ( .A0(N290), .A1(n422), .B0(N45), .B1(n421), .Y(n405) );
  AOI222XL U489 ( .A0(N166), .A1(n423), .B0(N106), .B1(n424), .C0(N186), .C1(
        n425), .Y(n404) );
  NAND2X1 U490 ( .A(n405), .B(n404), .Y(N315) );
  AOI22X1 U491 ( .A0(N291), .A1(n422), .B0(N46), .B1(n421), .Y(n407) );
  AOI222XL U492 ( .A0(N167), .A1(n423), .B0(N107), .B1(n424), .C0(N187), .C1(
        n425), .Y(n406) );
  NAND2X1 U493 ( .A(n407), .B(n406), .Y(N316) );
  AOI22X1 U494 ( .A0(N292), .A1(n422), .B0(N47), .B1(n421), .Y(n409) );
  AOI222XL U495 ( .A0(N168), .A1(n423), .B0(N108), .B1(n424), .C0(N188), .C1(
        n425), .Y(n408) );
  NAND2X1 U496 ( .A(n409), .B(n408), .Y(N317) );
  AOI22X1 U497 ( .A0(N293), .A1(n422), .B0(N48), .B1(n421), .Y(n411) );
  AOI222XL U498 ( .A0(N169), .A1(n423), .B0(N109), .B1(n424), .C0(N189), .C1(
        n425), .Y(n410) );
  NAND2X1 U499 ( .A(n411), .B(n410), .Y(N318) );
  AOI22X1 U500 ( .A0(N294), .A1(n422), .B0(N49), .B1(n421), .Y(n413) );
  AOI222XL U501 ( .A0(N170), .A1(n423), .B0(N110), .B1(n424), .C0(N190), .C1(
        n425), .Y(n412) );
  NAND2X1 U502 ( .A(n413), .B(n412), .Y(N319) );
  AOI22X1 U503 ( .A0(N295), .A1(n422), .B0(N50), .B1(n421), .Y(n420) );
  NAND2X1 U504 ( .A(n420), .B(n419), .Y(N320) );
  NAND2BXL U505 ( .AN(gray_data[4]), .B(center[4]), .Y(n445) );
  AND2X1 U506 ( .A(\add_94/carry [12]), .B(gray_addr[12]), .Y(
        \add_94/carry [13]) );
  XOR2X1 U507 ( .A(gray_addr[12]), .B(\add_94/carry [12]), .Y(N190) );
  XNOR2X1 U508 ( .A(\r444/carry[12] ), .B(gray_addr[12]), .Y(N110) );
  AND2X1 U509 ( .A(\r447/carry [12]), .B(gray_addr[12]), .Y(\r447/carry [13])
         );
  XOR2X1 U510 ( .A(gray_addr[12]), .B(\r447/carry [12]), .Y(N170) );
  OR2X1 U511 ( .A(gray_addr[12]), .B(\sub_134/carry [12]), .Y(
        \sub_134/carry [13]) );
  XNOR2X1 U512 ( .A(\sub_134/carry [12]), .B(gray_addr[12]), .Y(N294) );
  AND2X1 U513 ( .A(\add_94/carry [11]), .B(gray_addr[11]), .Y(
        \add_94/carry [12]) );
  XOR2X1 U514 ( .A(gray_addr[11]), .B(\add_94/carry [11]), .Y(N189) );
  OR2X1 U515 ( .A(gray_addr[11]), .B(\r444/carry[11] ), .Y(\r444/carry[12] )
         );
  XNOR2X1 U516 ( .A(\r444/carry[11] ), .B(gray_addr[11]), .Y(N109) );
  AND2X1 U517 ( .A(\r447/carry [11]), .B(gray_addr[11]), .Y(\r447/carry [12])
         );
  XOR2X1 U518 ( .A(gray_addr[11]), .B(\r447/carry [11]), .Y(N169) );
  OR2X1 U519 ( .A(gray_addr[11]), .B(\sub_134/carry [11]), .Y(
        \sub_134/carry [12]) );
  XNOR2X1 U520 ( .A(\sub_134/carry [11]), .B(gray_addr[11]), .Y(N293) );
  AND2X1 U521 ( .A(\add_94/carry [10]), .B(gray_addr[10]), .Y(
        \add_94/carry [11]) );
  XOR2X1 U522 ( .A(gray_addr[10]), .B(\add_94/carry [10]), .Y(N188) );
  OR2X1 U523 ( .A(gray_addr[10]), .B(\r444/carry[10] ), .Y(\r444/carry[11] )
         );
  XNOR2X1 U524 ( .A(\r444/carry[10] ), .B(gray_addr[10]), .Y(N108) );
  AND2X1 U525 ( .A(\r447/carry [10]), .B(gray_addr[10]), .Y(\r447/carry [11])
         );
  XOR2X1 U526 ( .A(gray_addr[10]), .B(\r447/carry [10]), .Y(N168) );
  OR2X1 U527 ( .A(gray_addr[10]), .B(\sub_134/carry [10]), .Y(
        \sub_134/carry [11]) );
  XNOR2X1 U528 ( .A(\sub_134/carry [10]), .B(gray_addr[10]), .Y(N292) );
  AND2X1 U529 ( .A(\add_94/carry [9]), .B(gray_addr[9]), .Y(\add_94/carry [10]) );
  XOR2X1 U530 ( .A(gray_addr[9]), .B(\add_94/carry [9]), .Y(N187) );
  OR2X1 U531 ( .A(gray_addr[9]), .B(\r444/carry[9] ), .Y(\r444/carry[10] ) );
  XNOR2X1 U532 ( .A(\r444/carry[9] ), .B(gray_addr[9]), .Y(N107) );
  AND2X1 U533 ( .A(\r447/carry [9]), .B(gray_addr[9]), .Y(\r447/carry [10]) );
  XOR2X1 U534 ( .A(gray_addr[9]), .B(\r447/carry [9]), .Y(N167) );
  OR2X1 U535 ( .A(gray_addr[9]), .B(\sub_134/carry [9]), .Y(
        \sub_134/carry [10]) );
  XNOR2X1 U536 ( .A(\sub_134/carry [9]), .B(gray_addr[9]), .Y(N291) );
  AND2X1 U537 ( .A(\add_94/carry [8]), .B(gray_addr[8]), .Y(\add_94/carry [9])
         );
  XOR2X1 U538 ( .A(gray_addr[8]), .B(\add_94/carry [8]), .Y(N186) );
  OR2X1 U539 ( .A(gray_addr[8]), .B(\r444/carry[8] ), .Y(\r444/carry[9] ) );
  XNOR2X1 U540 ( .A(\r444/carry[8] ), .B(gray_addr[8]), .Y(N106) );
  AND2X1 U541 ( .A(\r447/carry [8]), .B(gray_addr[8]), .Y(\r447/carry [9]) );
  XOR2X1 U542 ( .A(gray_addr[8]), .B(\r447/carry [8]), .Y(N166) );
  OR2X1 U543 ( .A(gray_addr[8]), .B(gray_addr[7]), .Y(\sub_134/carry [9]) );
  XNOR2X1 U544 ( .A(gray_addr[7]), .B(gray_addr[8]), .Y(N290) );
  AND2X1 U545 ( .A(\add_94/carry [7]), .B(gray_addr[7]), .Y(\add_94/carry [8])
         );
  XOR2X1 U546 ( .A(gray_addr[7]), .B(\add_94/carry [7]), .Y(N185) );
  AND2X1 U547 ( .A(\r444/carry[7] ), .B(gray_addr[7]), .Y(\r444/carry[8] ) );
  XOR2X1 U548 ( .A(gray_addr[7]), .B(\r444/carry[7] ), .Y(N105) );
  AND2X1 U549 ( .A(\r447/carry [7]), .B(gray_addr[7]), .Y(\r447/carry [8]) );
  XOR2X1 U550 ( .A(gray_addr[7]), .B(\r447/carry [7]), .Y(N165) );
  AND2X1 U551 ( .A(\add_94/carry [6]), .B(gray_addr[6]), .Y(\add_94/carry [7])
         );
  XOR2X1 U552 ( .A(gray_addr[6]), .B(\add_94/carry [6]), .Y(N184) );
  OR2X1 U553 ( .A(gray_addr[6]), .B(\r444/carry[6] ), .Y(\r444/carry[7] ) );
  XNOR2X1 U554 ( .A(\r444/carry[6] ), .B(gray_addr[6]), .Y(N104) );
  OR2X1 U555 ( .A(gray_addr[6]), .B(\r447/carry [6]), .Y(\r447/carry [7]) );
  XNOR2X1 U556 ( .A(\r447/carry [6]), .B(gray_addr[6]), .Y(N164) );
  AND2X1 U557 ( .A(\add_94/carry [5]), .B(gray_addr[5]), .Y(\add_94/carry [6])
         );
  XOR2X1 U558 ( .A(gray_addr[5]), .B(\add_94/carry [5]), .Y(N183) );
  OR2X1 U559 ( .A(gray_addr[5]), .B(\r444/carry[5] ), .Y(\r444/carry[6] ) );
  XNOR2X1 U560 ( .A(\r444/carry[5] ), .B(gray_addr[5]), .Y(N103) );
  OR2X1 U561 ( .A(gray_addr[5]), .B(\r447/carry [5]), .Y(\r447/carry [6]) );
  XNOR2X1 U562 ( .A(\r447/carry [5]), .B(gray_addr[5]), .Y(N163) );
  AND2X1 U563 ( .A(\add_94/carry [4]), .B(gray_addr[4]), .Y(\add_94/carry [5])
         );
  XOR2X1 U564 ( .A(gray_addr[4]), .B(\add_94/carry [4]), .Y(N182) );
  OR2X1 U565 ( .A(gray_addr[4]), .B(\r444/carry[4] ), .Y(\r444/carry[5] ) );
  XNOR2X1 U566 ( .A(\r444/carry[4] ), .B(gray_addr[4]), .Y(N102) );
  OR2X1 U567 ( .A(gray_addr[4]), .B(\r447/carry [4]), .Y(\r447/carry [5]) );
  XNOR2X1 U568 ( .A(\r447/carry [4]), .B(gray_addr[4]), .Y(N162) );
  AND2X1 U569 ( .A(\add_94/carry [3]), .B(gray_addr[3]), .Y(\add_94/carry [4])
         );
  XOR2X1 U570 ( .A(gray_addr[3]), .B(\add_94/carry [3]), .Y(N181) );
  OR2X1 U571 ( .A(gray_addr[3]), .B(\r444/carry[3] ), .Y(\r444/carry[4] ) );
  XNOR2X1 U572 ( .A(\r444/carry[3] ), .B(gray_addr[3]), .Y(N101) );
  OR2X1 U573 ( .A(gray_addr[3]), .B(\r447/carry [3]), .Y(\r447/carry [4]) );
  XNOR2X1 U574 ( .A(\r447/carry [3]), .B(gray_addr[3]), .Y(N161) );
  AND2X1 U575 ( .A(gray_addr[1]), .B(gray_addr[2]), .Y(\add_94/carry [3]) );
  XOR2X1 U576 ( .A(gray_addr[2]), .B(gray_addr[1]), .Y(N180) );
  OR2X1 U577 ( .A(gray_addr[2]), .B(\r444/carry[2] ), .Y(\r444/carry[3] ) );
  XNOR2X1 U578 ( .A(\r444/carry[2] ), .B(gray_addr[2]), .Y(N100) );
  OR2X1 U579 ( .A(gray_addr[2]), .B(gray_addr[1]), .Y(\r447/carry [3]) );
  XNOR2X1 U580 ( .A(gray_addr[1]), .B(gray_addr[2]), .Y(N160) );
  XNOR2X1 U581 ( .A(N158), .B(gray_addr[1]), .Y(N99) );
  NAND2BX1 U582 ( .AN(gray_data[2]), .B(center[2]), .Y(n449) );
  OAI22XL U583 ( .A0(gray_data[3]), .A1(n352), .B0(gray_data[3]), .B1(n449), 
        .Y(n455) );
  NOR2BX1 U584 ( .AN(gray_data[2]), .B(center[2]), .Y(n447) );
  OA22X1 U585 ( .A0(n447), .A1(gray_data[3]), .B0(n447), .B1(n352), .Y(n451)
         );
  AOI21X1 U586 ( .A0(gray_data[1]), .A1(n353), .B0(gray_data[0]), .Y(n448) );
  AOI2BB2X1 U587 ( .B0(n448), .B1(center[0]), .A0N(gray_data[1]), .A1N(n353), 
        .Y(n450) );
  NOR2BX1 U588 ( .AN(gray_data[4]), .B(center[4]), .Y(n452) );
  OAI22XL U589 ( .A0(n452), .A1(n351), .B0(gray_data[5]), .B1(n452), .Y(n453)
         );
endmodule


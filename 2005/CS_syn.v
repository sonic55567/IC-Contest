/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : Q-2019.12
// Date      : Thu Jan 20 21:10:37 2022
/////////////////////////////////////////////////////////////


module CS_DW01_add_10 ( A, B, CI, SUM, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] SUM;
  input CI;
  output CO;
  wire   n20, n21, n22, n1, n2, n3, n8, n9, n10, n11, n13, n14, n15, n16, n17,
         n18, n19;
  wire   [11:1] carry;

  ADDFHX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(n21) );
  ADDFHX4 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFHX4 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(n22) );
  ADDFHX2 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFHX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(n20) );
  XOR3X4 U1_11 ( .A(A[11]), .B(B[11]), .C(carry[11]), .Y(SUM[11]) );
  NAND3X1 U1 ( .A(n14), .B(n15), .C(n16), .Y(carry[8]) );
  BUFX12 U2 ( .A(n21), .Y(SUM[4]) );
  INVX12 U3 ( .A(n2), .Y(SUM[5]) );
  XNOR2X1 U4 ( .A(carry[5]), .B(n8), .Y(n2) );
  BUFX12 U5 ( .A(n20), .Y(SUM[6]) );
  INVX12 U6 ( .A(n1), .Y(SUM[7]) );
  XNOR2X1 U7 ( .A(carry[7]), .B(n13), .Y(n1) );
  XOR2X1 U8 ( .A(B[7]), .B(A[7]), .Y(n13) );
  INVXL U9 ( .A(n22), .Y(n3) );
  INVX12 U10 ( .A(n3), .Y(SUM[3]) );
  NAND2X1 U11 ( .A(A[5]), .B(carry[5]), .Y(n10) );
  NAND2X1 U12 ( .A(B[7]), .B(carry[7]), .Y(n14) );
  OAI211X2 U13 ( .A0(A[1]), .A1(B[1]), .B0(A[0]), .C0(B[0]), .Y(n19) );
  OAI2BB1X4 U14 ( .A0N(n17), .A1N(A[2]), .B0(n18), .Y(carry[3]) );
  OAI21X4 U15 ( .A0(A[2]), .A1(n17), .B0(B[2]), .Y(n18) );
  XOR2XL U16 ( .A(B[5]), .B(A[5]), .Y(n8) );
  NAND2X1 U17 ( .A(B[5]), .B(carry[5]), .Y(n9) );
  NAND2XL U18 ( .A(A[5]), .B(B[5]), .Y(n11) );
  NAND3X1 U19 ( .A(n9), .B(n10), .C(n11), .Y(carry[6]) );
  NAND2X1 U20 ( .A(A[7]), .B(carry[7]), .Y(n15) );
  OAI2BB1X2 U21 ( .A0N(A[1]), .A1N(B[1]), .B0(n19), .Y(n17) );
  NAND2XL U22 ( .A(A[7]), .B(B[7]), .Y(n16) );
endmodule


module CS_DW01_add_9 ( A, B, CI, SUM, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [11:1] carry;

  XOR3X1 U1_11 ( .A(A[11]), .B(B[11]), .C(carry[11]), .Y(SUM[11]) );
  ADDFXL U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFXL U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFXL U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFXL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFXL U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module CS ( Y, X, reset, clk );
  output [9:0] Y;
  input [7:0] X;
  input reset, clk;
  wire   n686, n687, n688, n689, \buff[8][7] , \buff[8][6] , \buff[8][5] ,
         \buff[8][4] , \buff[8][3] , \buff[7][7] , \buff[7][6] , \buff[7][5] ,
         \buff[7][4] , \buff[7][3] , \buff[6][7] , \buff[6][6] , \buff[6][5] ,
         \buff[6][4] , \buff[6][3] , \buff[5][7] , \buff[5][6] , \buff[5][5] ,
         \buff[5][4] , \buff[5][3] , \buff[4][7] , \buff[4][6] , \buff[4][5] ,
         \buff[4][4] , \buff[4][3] , \buff[3][7] , \buff[3][6] , \buff[3][5] ,
         \buff[3][4] , \buff[3][3] , \buff[2][7] , \buff[2][6] , \buff[2][5] ,
         \buff[2][4] , \buff[2][3] , \buff[1][7] , \buff[1][6] , \buff[1][5] ,
         \buff[1][4] , \buff[1][3] , \buff[0][7] , \buff[0][6] , \buff[0][5] ,
         \buff[0][4] , \buff[0][3] , N22, N23, N24, N25, N26, N27, N28, N29,
         N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40, N41, N42, N44,
         N45, N46, N47, N50, N51, N52, N53, N54, N55, N56, N57, N58, N59, N60,
         N61, N62, N63, N64, N65, N66, N68, N69, N74, N75, N76, N77, N78, N79,
         N80, N81, N82, N83, N84, N85, N86, N87, N88, N89, N90, N92, N93, N94,
         N95, N98, N99, N100, N101, N102, N103, N104, N105, N106, N107, N108,
         N109, N110, N111, N112, N113, N114, N116, N117, N118, N119, N122,
         N123, N124, N125, N126, N127, N128, N129, N130, N131, N132, N133,
         N134, N135, N136, N137, N138, N140, N141, N142, N143, N146, N147,
         N148, N149, N150, N151, N152, N153, N154, N155, N156, N157, N158,
         N159, N160, N161, N162, N164, N165, N170, N171, N172, N173, N174,
         N175, N176, N177, N178, N179, N180, N181, N182, N183, N184, N185,
         N186, N188, N189, N190, N191, N194, N195, N196, N197, N198, N199,
         N200, N201, N202, N203, N204, N205, N206, N207, N208, N209, N210,
         N212, N213, N214, N215, N218, N219, N220, N221, N222, N223, N224,
         N225, N226, N227, N228, N229, N230, N231, N232, N233, N234, N236,
         N237, N238, N239, n126, n127, n128, n129, n133, n134, N253, N252,
         N251, N250, N249, N248, N247, N246, N245, N244, N243, N242, N21, N17,
         N16, N15, N14, N13, N12, N11, N10, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n232,
         n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243,
         n244, n245, n246, n247, n248, n249, n250, n251, n252, n253, n254,
         n255, n256, n257, n258, n259, n260, n261, n262, n263, n264, n265,
         n266, n267, n268, n269, n270, n271, n272, n273, n274, n275, n276,
         n277, n278, n279, n280, n281, n282, n283, n284, n285, n286, n287,
         n288, n289, n290, n291, n292, n293, n294, n295, n296, n297, n298,
         n299, n300, n301, n302, n303, n304, n305, n306, n307, n308, n309,
         n310, n311, n312, n313, n314, n315, n316, n317, n318, n319, n320,
         n321, n322, n323, n324, n325, n326, n327, n328, n329, n330, n331,
         n332, n333, n334, n335, n336, n337, n338, n339, n340, n341, n342,
         n343, n344, n345, n346, n347, n348, n349, n350, n351, n352, n353,
         n354, n355, n356, n357, n358, n359, n360, n361, n362, n363, n364,
         n365, n366, n367, n368, n369, n370, n371, n372, n373, n374, n375,
         n376, n377, n378, n379, n380, n381, n382, n383, n384, n385, n386,
         n387, n388, n389, n390, n391, n392, n393, n394, n395, n396, n397,
         n398, n399, n400, n401, n402, n403, n404, n405, n406, n407, n408,
         n409, n410, n411, n412, n413, n414, n415, n416, n417, n418, n419,
         n420, n421, n422, n423, n424, n425, n426, n427, n428, n429, n430,
         n431, n432, n433, n434, n435, n436, n437, n438, n439, n440, n441,
         n442, n443, n444, n445, n446, n447, n448, n449, n450, n451, n452,
         n453, n454, n455, n456, n457, n458, n459, n460, n461, n462, n463,
         n464, n465, n466, n467, n468, n469, n470, n471, n472, n473, n474,
         n475, n476, n477, n478, n479, n480, n481, n482, n483, n484, n485,
         n486, n487, n488, n489, n490, n491, n492, n493, n494, n495, n496,
         n497, n498, n499, n500, n501, n502, n503, n504, n505, n506, n507,
         n508, n509, n510, n511, n512, n513, n514, n515, n516, n517, n518,
         n519, n520, n521, n522, n523, n524, n525, n526, n527, n528, n529,
         n530, n531, n532, n533, n534, n535, n536, n537, n538, n539, n540,
         n541, n542, n543, n544, n545, n546, n547, n548, n549, n550, n551,
         n552, n553, n554, n555, n556, n557, n558, n559, n560, n561, n562,
         n563, n564, n565, n566, n567, n568, n569, n570, n571, n572, n573,
         n574, n575, n576, n577, n578, n579, n580, n581, n582, n583, n584,
         n585, n586, n587, n588, n589, n590, n591, n592, n593, n594, n595,
         n596, n597, n598, n599, n600, n601, n602, n603, n604, n605, n606,
         n607, n608, n609, n610, n611, n612, n613, n614, n615, n616, n617,
         n618, n619, n620, n621, n622, n623, n624, n625, n626, n627, n628,
         n629, n630, n631, n632, n633, n634, n635, n636, n637, n638, n639,
         n640, n641, n642, n643, n644, n645, n646, n647, n648, n649, n650,
         n651, n652, n653, n654, n655, n656, n657, n658, n659, n660, n661,
         n662, n663, n664, n665, n666, n667, n668, n669, n670, n671, n672,
         n673, n674, n675, n676, n677, n678, n679, n680, n681, n682;
  wire   [11:0] buff_sum;
  wire   [7:0] appr;
  wire   [11:1] \add_45_I9/carry ;
  wire   [11:1] \add_45_I8/carry ;
  wire   [11:1] \add_45_I7/carry ;
  wire   [11:1] \add_45_I6/carry ;
  wire   [11:1] \add_45_I5/carry ;
  wire   [11:1] \add_45_I4/carry ;
  wire   [11:1] \add_45_I3/carry ;
  wire   [11:1] \add_45_I2/carry ;
  wire   [11:1] \add_45/carry ;
  wire   [12:0] \sub_1_root_sub_0_root_add_29/carry ;
  wire   [11:1] \add_51/carry ;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2;
  assign Y[9] = 1'b0;

  DFFRX4 \buff_reg[0][3]  ( .D(X[3]), .CK(clk), .RN(n228), .Q(\buff[0][3] ) );
  AO22X4 U52 ( .A0(n127), .A1(N198), .B0(\buff[7][4] ), .B1(n676), .Y(N222) );
  AO22X4 U61 ( .A0(\buff[6][4] ), .A1(n677), .B0(n128), .B1(N174), .Y(N198) );
  AO22X4 U63 ( .A0(N180), .A1(n677), .B0(n128), .B1(N172), .Y(N196) );
  AO22X4 U70 ( .A0(n129), .A1(N150), .B0(\buff[5][4] ), .B1(n189), .Y(N174) );
  CS_DW01_add_10 add_51_2 ( .A({n227, n226, n235, n225, n224, n234, n223, n222, 
        buff_sum[3], n220, n219, n217}), .B({N253, N252, N251, N250, N249, 
        N248, N247, N246, N245, N244, N243, N242}), .CI(1'b0), .SUM({n686, 
        n687, n688, n689, Y[4:0], SYNOPSYS_UNCONNECTED__0, 
        SYNOPSYS_UNCONNECTED__1, SYNOPSYS_UNCONNECTED__2}) );
  CS_DW01_add_9 add_0_root_sub_0_root_add_29 ( .A({n227, n226, n235, n225, 
        n224, n234, n223, n222, n221, n220, n218, n217}), .B({N21, N21, N21, 
        N21, N17, N16, N15, N14, N13, N12, N11, N10}), .CI(1'b0), .SUM({N33, 
        N32, N31, N30, N29, N28, N27, N26, N25, N24, N23, N22}) );
  ADDFHX4 \add_45/U1_4  ( .A(N35), .B(\buff[0][4] ), .CI(\add_45/carry [4]), 
        .CO(\add_45/carry [5]), .S(N38) );
  DFFRX1 \buff_reg[7][0]  ( .D(N178), .CK(clk), .RN(n230), .Q(N202), .QN(n213)
         );
  DFFRX2 \buff_reg[7][2]  ( .D(N180), .CK(clk), .RN(n231), .Q(N204) );
  DFFRX1 \buff_reg[6][0]  ( .D(N154), .CK(clk), .RN(n230), .Q(N178), .QN(n210)
         );
  DFFRX2 \buff_reg[6][2]  ( .D(N156), .CK(clk), .RN(n231), .Q(N180) );
  DFFRX1 \buff_reg[5][0]  ( .D(N130), .CK(clk), .RN(n230), .Q(N154), .QN(n207)
         );
  DFFRX2 \buff_reg[5][6]  ( .D(\buff[4][6] ), .CK(clk), .RN(n232), .Q(
        \buff[5][6] ), .QN(n206) );
  DFFRX1 \buff_reg[4][0]  ( .D(N106), .CK(clk), .RN(n230), .Q(N130), .QN(n204)
         );
  DFFRX1 \buff_reg[3][0]  ( .D(N82), .CK(clk), .RN(n230), .Q(N106), .QN(n201)
         );
  DFFRX2 \buff_reg[2][6]  ( .D(\buff[1][6] ), .CK(clk), .RN(n233), .Q(
        \buff[2][6] ), .QN(n196) );
  DFFRX1 \buff_reg[2][0]  ( .D(N58), .CK(clk), .RN(n230), .Q(N82), .QN(n198)
         );
  DFFRX1 \buff_reg[8][0]  ( .D(N202), .CK(clk), .RN(n230), .Q(N226), .QN(n216)
         );
  DFFRX4 \buff_reg[0][1]  ( .D(X[1]), .CK(clk), .RN(n231), .Q(N35) );
  DFFRX4 \buff_reg[0][0]  ( .D(X[0]), .CK(clk), .RN(n230), .Q(N34), .QN(n190)
         );
  DFFRX2 \buff_reg[0][5]  ( .D(X[5]), .CK(clk), .RN(n232), .Q(\buff[0][5] ) );
  DFFRX1 \buff_reg[2][5]  ( .D(\buff[1][5] ), .CK(clk), .RN(n682), .Q(
        \buff[2][5] ), .QN(n375) );
  DFFRX1 \buff_reg[1][7]  ( .D(\buff[0][7] ), .CK(clk), .RN(n682), .Q(
        \buff[1][7] ), .QN(n324) );
  DFFRX1 \buff_reg[2][1]  ( .D(N59), .CK(clk), .RN(n682), .Q(N83), .QN(n373)
         );
  DFFRX1 \buff_reg[2][3]  ( .D(\buff[1][3] ), .CK(clk), .RN(n682), .Q(
        \buff[2][3] ), .QN(n374) );
  DFFRX1 \buff_reg[2][4]  ( .D(\buff[1][4] ), .CK(clk), .RN(n682), .Q(
        \buff[2][4] ) );
  DFFRX1 \buff_reg[8][2]  ( .D(N204), .CK(clk), .RN(n682), .Q(N228), .QN(n237)
         );
  DFFRX1 \buff_reg[6][1]  ( .D(N155), .CK(clk), .RN(n682), .Q(N179), .QN(n577)
         );
  DFFRX1 \buff_reg[8][1]  ( .D(N203), .CK(clk), .RN(n682), .Q(N227), .QN(n236)
         );
  DFFRX1 \buff_reg[7][1]  ( .D(N179), .CK(clk), .RN(n682), .Q(N203), .QN(n626)
         );
  DFFRX1 \buff_reg[6][3]  ( .D(\buff[5][3] ), .CK(clk), .RN(n682), .Q(
        \buff[6][3] ), .QN(n578) );
  DFFRX1 \buff_reg[5][3]  ( .D(\buff[4][3] ), .CK(clk), .RN(n682), .Q(
        \buff[5][3] ), .QN(n529) );
  DFFRX1 \buff_reg[3][5]  ( .D(\buff[2][5] ), .CK(clk), .RN(n682), .Q(
        \buff[3][5] ), .QN(n428) );
  DFFRX1 \buff_reg[8][3]  ( .D(\buff[7][3] ), .CK(clk), .RN(n682), .Q(
        \buff[8][3] ), .QN(n238) );
  DFFRX1 \buff_reg[4][3]  ( .D(\buff[3][3] ), .CK(clk), .RN(n682), .Q(
        \buff[4][3] ), .QN(n480) );
  DFFRX1 \buff_reg[8][7]  ( .D(\buff[7][7] ), .CK(clk), .RN(n682), .Q(
        \buff[8][7] ), .QN(n241) );
  DFFRX1 \buff_reg[6][7]  ( .D(\buff[5][7] ), .CK(clk), .RN(n682), .Q(
        \buff[6][7] ), .QN(n580) );
  DFFRX1 \buff_reg[3][1]  ( .D(N83), .CK(clk), .RN(n682), .Q(N107), .QN(n426)
         );
  DFFRX1 \buff_reg[7][7]  ( .D(\buff[6][7] ), .CK(clk), .RN(n682), .Q(
        \buff[7][7] ), .QN(n629) );
  DFFRX1 \buff_reg[4][1]  ( .D(N107), .CK(clk), .RN(n682), .Q(N131), .QN(n479)
         );
  DFFRX1 \buff_reg[5][1]  ( .D(N131), .CK(clk), .RN(n682), .Q(N155), .QN(n528)
         );
  DFFRX1 \buff_reg[6][5]  ( .D(\buff[5][5] ), .CK(clk), .RN(n682), .Q(
        \buff[6][5] ), .QN(n579) );
  DFFRX1 \buff_reg[8][5]  ( .D(\buff[7][5] ), .CK(clk), .RN(n682), .Q(
        \buff[8][5] ), .QN(n240) );
  DFFRX1 \buff_reg[3][3]  ( .D(\buff[2][3] ), .CK(clk), .RN(n682), .Q(
        \buff[3][3] ), .QN(n427) );
  DFFRX1 \buff_reg[4][7]  ( .D(\buff[3][7] ), .CK(clk), .RN(n682), .Q(
        \buff[4][7] ), .QN(n482) );
  DFFRX1 \buff_reg[2][7]  ( .D(\buff[1][7] ), .CK(clk), .RN(n682), .Q(
        \buff[2][7] ), .QN(n376) );
  DFFRX1 \buff_reg[7][3]  ( .D(\buff[6][3] ), .CK(clk), .RN(n682), .Q(
        \buff[7][3] ), .QN(n627) );
  DFFRX1 \buff_reg[7][5]  ( .D(\buff[6][5] ), .CK(clk), .RN(n682), .Q(
        \buff[7][5] ), .QN(n628) );
  DFFRX1 \buff_reg[8][4]  ( .D(\buff[7][4] ), .CK(clk), .RN(n682), .Q(
        \buff[8][4] ), .QN(n239) );
  DFFRX1 \buff_reg[4][5]  ( .D(\buff[3][5] ), .CK(clk), .RN(n682), .Q(
        \buff[4][5] ), .QN(n481) );
  DFFRX1 \buff_reg[5][7]  ( .D(\buff[4][7] ), .CK(clk), .RN(n682), .Q(
        \buff[5][7] ), .QN(n531) );
  DFFRX1 \buff_reg[5][5]  ( .D(\buff[4][5] ), .CK(clk), .RN(n682), .Q(
        \buff[5][5] ), .QN(n530) );
  DFFRX1 \buff_reg[7][4]  ( .D(\buff[6][4] ), .CK(clk), .RN(n682), .Q(
        \buff[7][4] ) );
  DFFRX1 \buff_reg[3][7]  ( .D(\buff[2][7] ), .CK(clk), .RN(n682), .Q(
        \buff[3][7] ), .QN(n429) );
  DFFRX1 \buff_reg[6][4]  ( .D(\buff[5][4] ), .CK(clk), .RN(n682), .Q(
        \buff[6][4] ) );
  DFFRX1 \buff_reg[5][4]  ( .D(\buff[4][4] ), .CK(clk), .RN(n682), .Q(
        \buff[5][4] ) );
  DFFRX1 \buff_reg[3][4]  ( .D(\buff[2][4] ), .CK(clk), .RN(n682), .Q(
        \buff[3][4] ) );
  DFFRX1 \buff_reg[4][4]  ( .D(\buff[3][4] ), .CK(clk), .RN(n682), .Q(
        \buff[4][4] ) );
  DFFRX1 \buff_sum_reg[7]  ( .D(N29), .CK(clk), .RN(n682), .Q(buff_sum[7]) );
  DFFRX1 \buff_reg[1][2]  ( .D(N36), .CK(clk), .RN(n682), .Q(N60), .QN(n157)
         );
  DFFRX2 \buff_reg[2][2]  ( .D(N60), .CK(clk), .RN(n682), .Q(N84) );
  DFFRX2 \buff_reg[4][2]  ( .D(N108), .CK(clk), .RN(n682), .Q(N132) );
  DFFRX2 \buff_reg[3][2]  ( .D(N84), .CK(clk), .RN(n682), .Q(N108) );
  DFFRX2 \buff_reg[5][2]  ( .D(N132), .CK(clk), .RN(n682), .Q(N156) );
  DFFRX2 \buff_reg[4][6]  ( .D(\buff[3][6] ), .CK(clk), .RN(n232), .Q(
        \buff[4][6] ), .QN(n203) );
  DFFRX2 \buff_reg[3][6]  ( .D(\buff[2][6] ), .CK(clk), .RN(n232), .Q(
        \buff[3][6] ), .QN(n200) );
  DFFRX2 \buff_reg[7][6]  ( .D(\buff[6][6] ), .CK(clk), .RN(n232), .Q(
        \buff[7][6] ), .QN(n212) );
  DFFRX2 \buff_reg[6][6]  ( .D(\buff[5][6] ), .CK(clk), .RN(n232), .Q(
        \buff[6][6] ), .QN(n209) );
  DFFRX1 \buff_sum_reg[11]  ( .D(N33), .CK(clk), .RN(n229), .Q(buff_sum[11]), 
        .QN(n150) );
  DFFRX1 \buff_sum_reg[10]  ( .D(N32), .CK(clk), .RN(n229), .Q(buff_sum[10]), 
        .QN(n149) );
  DFFRX1 \buff_sum_reg[8]  ( .D(N30), .CK(clk), .RN(n229), .Q(buff_sum[8]), 
        .QN(n148) );
  DFFRX1 \buff_sum_reg[5]  ( .D(N27), .CK(clk), .RN(n229), .Q(buff_sum[5]), 
        .QN(n147) );
  DFFRX1 \buff_reg[8][6]  ( .D(\buff[7][6] ), .CK(clk), .RN(n232), .Q(
        \buff[8][6] ), .QN(n215) );
  DFFRX1 \buff_sum_reg[2]  ( .D(N24), .CK(clk), .RN(n229), .Q(buff_sum[2]) );
  DFFRX1 \buff_sum_reg[0]  ( .D(N22), .CK(clk), .RN(n229), .Q(buff_sum[0]) );
  DFFRX1 \buff_sum_reg[1]  ( .D(N23), .CK(clk), .RN(n229), .Q(buff_sum[1]), 
        .QN(n152) );
  DFFRX2 \buff_sum_reg[3]  ( .D(N25), .CK(clk), .RN(n229), .Q(buff_sum[3]), 
        .QN(n146) );
  DFFRX1 \buff_sum_reg[6]  ( .D(N28), .CK(clk), .RN(n229), .Q(buff_sum[6]) );
  DFFRX1 \buff_sum_reg[9]  ( .D(N31), .CK(clk), .RN(n229), .Q(buff_sum[9]) );
  DFFRX2 \buff_reg[0][7]  ( .D(X[7]), .CK(clk), .RN(n233), .Q(\buff[0][7] ) );
  DFFRX2 \buff_reg[0][2]  ( .D(X[2]), .CK(clk), .RN(n228), .Q(N36) );
  DFFRX2 \buff_reg[0][6]  ( .D(X[6]), .CK(clk), .RN(n233), .Q(\buff[0][6] ), 
        .QN(n194) );
  DFFRX2 \buff_reg[1][6]  ( .D(\buff[0][6] ), .CK(clk), .RN(n233), .Q(
        \buff[1][6] ), .QN(n192) );
  DFFRX1 \buff_reg[1][1]  ( .D(N35), .CK(clk), .RN(n231), .Q(N59), .QN(n155)
         );
  DFFRX1 \buff_reg[1][3]  ( .D(\buff[0][3] ), .CK(clk), .RN(n228), .Q(
        \buff[1][3] ), .QN(n154) );
  DFFRX1 \buff_reg[1][0]  ( .D(N34), .CK(clk), .RN(n682), .Q(N58), .QN(n197)
         );
  DFFRX1 \buff_sum_reg[4]  ( .D(N26), .CK(clk), .RN(n229), .Q(buff_sum[4]) );
  DFFRX4 \buff_reg[1][5]  ( .D(\buff[0][5] ), .CK(clk), .RN(n232), .Q(
        \buff[1][5] ), .QN(n156) );
  DFFRX4 \buff_reg[0][4]  ( .D(X[4]), .CK(clk), .RN(n682), .Q(\buff[0][4] ) );
  DFFRX4 \buff_reg[1][4]  ( .D(\buff[0][4] ), .CK(clk), .RN(n682), .Q(
        \buff[1][4] ) );
  OAI22X4 U129 ( .A0(n520), .A1(n519), .B0(n518), .B1(n529), .Y(n523) );
  BUFX4 U130 ( .A(N79), .Y(n165) );
  AO22X2 U131 ( .A0(\buff[1][4] ), .A1(n681), .B0(N54), .B1(n133), .Y(N78) );
  INVX6 U132 ( .A(n178), .Y(n133) );
  INVX16 U133 ( .A(n151), .Y(n679) );
  NAND2BX2 U134 ( .AN(N52), .B(N60), .Y(n314) );
  BUFX8 U135 ( .A(n413), .Y(n141) );
  AO22X1 U136 ( .A0(\buff[4][5] ), .A1(n678), .B0(n153), .B1(n163), .Y(N151)
         );
  BUFX8 U137 ( .A(N98), .Y(n135) );
  BUFX4 U138 ( .A(N170), .Y(n164) );
  OAI22X4 U139 ( .A0(N44), .A1(n268), .B0(N44), .B1(n260), .Y(n261) );
  CLKINVX16 U140 ( .A(n181), .Y(n680) );
  AO22X4 U141 ( .A0(N84), .A1(n680), .B0(n181), .B1(N76), .Y(N100) );
  AO22X4 U142 ( .A0(\buff[2][4] ), .A1(n680), .B0(n181), .B1(N78), .Y(N102) );
  AO22X2 U143 ( .A0(N83), .A1(n680), .B0(n181), .B1(N75), .Y(N99) );
  AO22X2 U144 ( .A0(\buff[2][5] ), .A1(n680), .B0(n181), .B1(n165), .Y(N103)
         );
  BUFX8 U145 ( .A(N101), .Y(n136) );
  NAND2X8 U146 ( .A(N119), .B(N118), .Y(n151) );
  OAI21X4 U147 ( .A0(N105), .A1(n429), .B0(n425), .Y(N119) );
  BUFX6 U148 ( .A(N53), .Y(n137) );
  AND2XL U149 ( .A(\buff[0][3] ), .B(n134), .Y(N53) );
  NAND3X4 U150 ( .A(n186), .B(n187), .C(n188), .Y(n311) );
  OAI221X2 U151 ( .A0(\buff[7][6] ), .A1(n630), .B0(n622), .B1(n621), .C0(n620), .Y(n623) );
  NAND3X4 U152 ( .A(n173), .B(n174), .C(n175), .Y(n613) );
  INVX16 U153 ( .A(n189), .Y(n129) );
  NAND2BX4 U154 ( .AN(N102), .B(\buff[3][4] ), .Y(n412) );
  INVX20 U155 ( .A(n153), .Y(n678) );
  OAI21X4 U156 ( .A0(N177), .A1(n580), .B0(n576), .Y(N191) );
  NOR2BX2 U157 ( .AN(N126), .B(\buff[4][4] ), .Y(n472) );
  NAND2BX4 U158 ( .AN(N126), .B(\buff[4][4] ), .Y(n465) );
  BUFX8 U159 ( .A(N99), .Y(n138) );
  BUFX4 U160 ( .A(N128), .Y(n139) );
  BUFX8 U161 ( .A(N103), .Y(n140) );
  AOI2BB2X4 U162 ( .B0(n468), .B1(N130), .A0N(N123), .A1N(n479), .Y(n470) );
  AOI21X4 U163 ( .A0(N123), .A1(n479), .B0(N122), .Y(n468) );
  CLKBUFX20 U164 ( .A(n686), .Y(Y[8]) );
  NAND2X2 U165 ( .A(n222), .B(n270), .Y(n252) );
  BUFX4 U166 ( .A(buff_sum[4]), .Y(n222) );
  AOI21X4 U167 ( .A0(n138), .A1(n426), .B0(n135), .Y(n415) );
  NAND2BX2 U168 ( .AN(n145), .B(N108), .Y(n416) );
  OAI22X1 U169 ( .A0(N197), .A1(n627), .B0(N197), .B1(n616), .Y(n622) );
  OAI22X1 U170 ( .A0(n619), .A1(n628), .B0(N199), .B1(n619), .Y(n620) );
  BUFX4 U171 ( .A(N194), .Y(n142) );
  AOI21X4 U172 ( .A0(N195), .A1(n626), .B0(n142), .Y(n615) );
  OA22X2 U173 ( .A0(n614), .A1(N197), .B0(n614), .B1(n627), .Y(n618) );
  AOI2BB2X4 U174 ( .B0(n615), .B1(N202), .A0N(N195), .A1N(n626), .Y(n617) );
  OAI222X2 U175 ( .A0(\buff[5][6] ), .A1(n515), .B0(n532), .B1(n515), .C0(
        \buff[5][6] ), .C1(n532), .Y(n526) );
  OAI221X2 U176 ( .A0(\buff[5][6] ), .A1(n532), .B0(n524), .B1(n523), .C0(n522), .Y(n525) );
  OAI22X1 U177 ( .A0(n667), .A1(n240), .B0(N223), .B1(n667), .Y(n668) );
  OAI222X2 U178 ( .A0(\buff[8][6] ), .A1(n662), .B0(n674), .B1(n662), .C0(
        \buff[8][6] ), .C1(n674), .Y(n672) );
  OAI222X4 U179 ( .A0(N223), .A1(n240), .B0(N223), .B1(n661), .C0(n240), .C1(
        n661), .Y(n662) );
  OAI221X2 U180 ( .A0(\buff[8][6] ), .A1(n674), .B0(n670), .B1(n669), .C0(n668), .Y(n671) );
  BUFX8 U181 ( .A(N151), .Y(n143) );
  AO22X2 U182 ( .A0(\buff[4][4] ), .A1(n678), .B0(n153), .B1(N126), .Y(N150)
         );
  AOI2BB2X4 U183 ( .B0(n517), .B1(N154), .A0N(N147), .A1N(n528), .Y(n519) );
  AOI21X4 U184 ( .A0(N147), .A1(n528), .B0(N146), .Y(n517) );
  AO22XL U185 ( .A0(n129), .A1(N147), .B0(N155), .B1(n189), .Y(N171) );
  NOR2BX4 U186 ( .AN(N52), .B(N60), .Y(n312) );
  CLKAND2X8 U187 ( .A(N36), .B(n134), .Y(N52) );
  ADDFHX2 U188 ( .A(N59), .B(\buff[1][4] ), .CI(\add_45_I2/carry [4]), .CO(
        \add_45_I2/carry [5]), .S(N62) );
  CLKXOR2X4 U189 ( .A(\buff[1][7] ), .B(\add_45_I2/carry [10]), .Y(N68) );
  AND2X1 U190 ( .A(\add_45_I2/carry [9]), .B(\buff[1][6] ), .Y(
        \add_45_I2/carry [10]) );
  CLKAND2X3 U191 ( .A(\buff[0][4] ), .B(n134), .Y(N54) );
  ADDFHX2 U192 ( .A(\buff[0][4] ), .B(\buff[0][7] ), .CI(\add_45/carry [7]), 
        .CO(\add_45/carry [8]), .S(N41) );
  NOR4XL U193 ( .A(\buff[0][7] ), .B(\buff[0][6] ), .C(\buff[0][5] ), .D(
        \buff[0][4] ), .Y(n274) );
  CLKAND2X2 U194 ( .A(\buff[0][5] ), .B(n134), .Y(N55) );
  AND2X4 U195 ( .A(\add_45/carry [8]), .B(\buff[0][5] ), .Y(\add_45/carry [9])
         );
  ADDFHX4 U196 ( .A(N36), .B(\buff[0][5] ), .CI(\add_45/carry [5]), .CO(
        \add_45/carry [6]), .S(N39) );
  AO22X2 U197 ( .A0(N132), .A1(n678), .B0(n153), .B1(N124), .Y(N148) );
  CLKINVX12 U198 ( .A(n128), .Y(n677) );
  AO22X4 U199 ( .A0(N179), .A1(n677), .B0(n128), .B1(n161), .Y(N195) );
  NAND2X8 U200 ( .A(N191), .B(N190), .Y(n128) );
  INVX2 U201 ( .A(n260), .Y(n272) );
  OAI22X1 U202 ( .A0(n317), .A1(n156), .B0(N55), .B1(n317), .Y(n318) );
  BUFX6 U203 ( .A(N51), .Y(n144) );
  BUFX8 U204 ( .A(N100), .Y(n145) );
  AO22X2 U205 ( .A0(n126), .A1(N218), .B0(N226), .B1(n675), .Y(N242) );
  INVX20 U206 ( .A(n126), .Y(n675) );
  BUFX8 U207 ( .A(N127), .Y(n163) );
  NAND2BX2 U208 ( .AN(N78), .B(\buff[2][4] ), .Y(n360) );
  XOR2X2 U209 ( .A(\buff[0][5] ), .B(\add_45/carry [8]), .Y(N42) );
  BUFX4 U210 ( .A(N221), .Y(n159) );
  OR2X4 U211 ( .A(n235), .B(n193), .Y(n170) );
  OAI21X1 U212 ( .A0(n256), .A1(n255), .B0(n254), .Y(n263) );
  ADDFXL U213 ( .A(\buff[2][3] ), .B(\buff[2][6] ), .CI(\add_45_I3/carry [6]), 
        .CO(\add_45_I3/carry [7]), .S(N88) );
  ADDFX2 U214 ( .A(\buff[2][4] ), .B(\buff[2][7] ), .CI(\add_45_I3/carry [7]), 
        .CO(\add_45_I3/carry [8]), .S(N89) );
  INVX4 U215 ( .A(N56), .Y(n325) );
  OAI22X1 U216 ( .A0(n472), .A1(n481), .B0(n163), .B1(n472), .Y(n473) );
  OAI22X2 U217 ( .A0(n569), .A1(n568), .B0(n567), .B1(n578), .Y(n572) );
  NAND2BX1 U218 ( .AN(N36), .B(n220), .Y(n246) );
  ADDFXL U219 ( .A(\buff[0][3] ), .B(\buff[0][6] ), .CI(\add_45/carry [6]), 
        .CO(\add_45/carry [7]), .S(N40) );
  OAI222X1 U220 ( .A0(N39), .A1(n266), .B0(N39), .B1(n252), .C0(n266), .C1(
        n252), .Y(n253) );
  NOR2BX1 U221 ( .AN(N36), .B(n220), .Y(n245) );
  AOI21X1 U222 ( .A0(n144), .A1(n155), .B0(N50), .Y(n313) );
  NOR2BX1 U223 ( .AN(N54), .B(\buff[1][4] ), .Y(n317) );
  OR2X1 U224 ( .A(N55), .B(n156), .Y(n186) );
  OR2X1 U225 ( .A(N55), .B(n310), .Y(n187) );
  OAI222X1 U226 ( .A0(n235), .A1(n277), .B0(n277), .B1(n191), .C0(n235), .C1(
        n191), .Y(n294) );
  OAI222X1 U227 ( .A0(N66), .A1(n303), .B0(N66), .B1(n276), .C0(n276), .C1(
        n303), .Y(n277) );
  OAI222XL U228 ( .A0(n234), .A1(n287), .B0(n307), .B1(n287), .C0(n234), .C1(
        n307), .Y(n288) );
  OAI222XL U229 ( .A0(N63), .A1(n302), .B0(N63), .B1(n286), .C0(n302), .C1(
        n286), .Y(n287) );
  OA22X2 U230 ( .A0(n184), .A1(n198), .B0(N75), .B1(n373), .Y(n364) );
  OAI22X1 U231 ( .A0(N77), .A1(n374), .B0(N77), .B1(n363), .Y(n369) );
  XOR2X1 U232 ( .A(\buff[2][7] ), .B(\add_45_I3/carry [10]), .Y(N92) );
  OAI222XL U233 ( .A0(n235), .A1(n327), .B0(n327), .B1(n195), .C0(n235), .C1(
        n195), .Y(n344) );
  OAI222XL U234 ( .A0(N90), .A1(n353), .B0(N90), .B1(n326), .C0(n326), .C1(
        n353), .Y(n327) );
  OAI222XL U235 ( .A0(n234), .A1(n337), .B0(n357), .B1(n337), .C0(n234), .C1(
        n357), .Y(n338) );
  OAI222XL U236 ( .A0(N87), .A1(n352), .B0(N87), .B1(n336), .C0(n352), .C1(
        n336), .Y(n337) );
  ADDFXL U237 ( .A(N108), .B(\buff[3][5] ), .CI(\add_45_I4/carry [5]), .CO(
        \add_45_I4/carry [6]), .S(N111) );
  CLKINVX1 U238 ( .A(N112), .Y(n409) );
  ADDFXL U239 ( .A(N131), .B(\buff[4][4] ), .CI(\add_45_I5/carry [4]), .CO(
        \add_45_I5/carry [5]), .S(N134) );
  AND2X2 U240 ( .A(\buff[0][6] ), .B(n134), .Y(N56) );
  NOR2X4 U241 ( .A(n179), .B(n180), .Y(n178) );
  OA22X2 U242 ( .A0(n299), .A1(n298), .B0(N69), .B1(n305), .Y(n180) );
  INVX4 U243 ( .A(n133), .Y(n681) );
  OAI222XL U244 ( .A0(n234), .A1(n389), .B0(n409), .B1(n389), .C0(n234), .C1(
        n409), .Y(n390) );
  OAI222XL U245 ( .A0(N111), .A1(n404), .B0(N111), .B1(n388), .C0(n404), .C1(
        n388), .Y(n389) );
  ADDFXL U246 ( .A(\buff[4][4] ), .B(\buff[4][7] ), .CI(\add_45_I5/carry [7]), 
        .CO(\add_45_I5/carry [8]), .S(N137) );
  ADDFXL U247 ( .A(N132), .B(\buff[4][5] ), .CI(\add_45_I5/carry [5]), .CO(
        \add_45_I5/carry [6]), .S(N135) );
  OAI22X2 U248 ( .A0(n471), .A1(n470), .B0(n469), .B1(n480), .Y(n474) );
  NOR2BX2 U249 ( .AN(N148), .B(N156), .Y(n516) );
  AO22X1 U250 ( .A0(N131), .A1(n678), .B0(n153), .B1(N123), .Y(N147) );
  NOR2BX2 U251 ( .AN(N172), .B(N180), .Y(n565) );
  NAND2BX2 U252 ( .AN(N172), .B(N180), .Y(n567) );
  CLKINVX1 U253 ( .A(N152), .Y(n532) );
  OAI22X1 U254 ( .A0(n618), .A1(n617), .B0(n616), .B1(n627), .Y(n621) );
  NOR2BX2 U255 ( .AN(N196), .B(N204), .Y(n614) );
  OR2X1 U256 ( .A(N199), .B(n628), .Y(n173) );
  OR2X1 U257 ( .A(N199), .B(n612), .Y(n174) );
  NOR2BX2 U258 ( .AN(N220), .B(N228), .Y(n663) );
  BUFX4 U259 ( .A(N219), .Y(n160) );
  ADDFHX1 U260 ( .A(N244), .B(appr[5]), .CI(\add_51/carry [5]), .CO(
        \add_51/carry [6]), .S(N247) );
  CLKBUFX6 U261 ( .A(buff_sum[9]), .Y(n235) );
  CLKBUFX6 U262 ( .A(buff_sum[6]), .Y(n234) );
  BUFX12 U263 ( .A(n689), .Y(Y[5]) );
  BUFX12 U264 ( .A(n688), .Y(Y[6]) );
  BUFX16 U265 ( .A(n687), .Y(Y[7]) );
  AO22X1 U266 ( .A0(n126), .A1(N224), .B0(\buff[8][6] ), .B1(n675), .Y(appr[6]) );
  INVX16 U267 ( .A(n177), .Y(n126) );
  CLKBUFX3 U268 ( .A(buff_sum[10]), .Y(n226) );
  CLKBUFX3 U269 ( .A(buff_sum[11]), .Y(n227) );
  CLKBUFX3 U270 ( .A(buff_sum[1]), .Y(n219) );
  AND2X8 U271 ( .A(n182), .B(n183), .Y(n189) );
  NAND2X8 U272 ( .A(N143), .B(N142), .Y(n153) );
  NOR2BX1 U273 ( .AN(N102), .B(\buff[3][4] ), .Y(n419) );
  CLKBUFX3 U274 ( .A(buff_sum[0]), .Y(n217) );
  BUFX4 U275 ( .A(buff_sum[2]), .Y(n220) );
  CLKBUFX3 U276 ( .A(buff_sum[5]), .Y(n223) );
  CLKBUFX3 U277 ( .A(buff_sum[8]), .Y(n225) );
  BUFX4 U278 ( .A(buff_sum[7]), .Y(n224) );
  AO22X1 U279 ( .A0(n129), .A1(N153), .B0(\buff[5][7] ), .B1(n189), .Y(N177)
         );
  AO22X1 U280 ( .A0(n151), .A1(N105), .B0(\buff[3][7] ), .B1(n679), .Y(N129)
         );
  ADDFXL U281 ( .A(\buff[3][4] ), .B(\buff[3][7] ), .CI(\add_45_I4/carry [7]), 
        .CO(\add_45_I4/carry [8]), .S(N113) );
  ADDFXL U282 ( .A(N107), .B(\buff[3][4] ), .CI(\add_45_I4/carry [4]), .CO(
        \add_45_I4/carry [5]), .S(N110) );
  INVXL U283 ( .A(n157), .Y(n158) );
  NOR2BXL U284 ( .AN(N60), .B(n220), .Y(n279) );
  ADDFHX1 U285 ( .A(n158), .B(\buff[1][5] ), .CI(\add_45_I2/carry [5]), .CO(
        \add_45_I2/carry [6]), .S(N63) );
  INVX8 U286 ( .A(reset), .Y(n682) );
  AOI2BB2X2 U287 ( .B0(n313), .B1(N58), .A0N(n144), .A1N(n155), .Y(n315) );
  AO22X4 U288 ( .A0(n324), .A1(N57), .B0(n322), .B1(n321), .Y(n323) );
  AO22X2 U289 ( .A0(n151), .A1(n135), .B0(N106), .B1(n679), .Y(N122) );
  AO22X2 U290 ( .A0(n151), .A1(n136), .B0(\buff[3][3] ), .B1(n679), .Y(N125)
         );
  OAI22X2 U291 ( .A0(n418), .A1(n417), .B0(n416), .B1(n427), .Y(n421) );
  NOR2BX4 U292 ( .AN(n145), .B(N108), .Y(n414) );
  OAI22X1 U293 ( .A0(n136), .A1(n427), .B0(n136), .B1(n416), .Y(n422) );
  OA22X4 U294 ( .A0(n414), .A1(n136), .B0(n414), .B1(n427), .Y(n418) );
  OAI22X2 U295 ( .A0(n521), .A1(n530), .B0(n143), .B1(n521), .Y(n522) );
  NAND2BX4 U296 ( .AN(N124), .B(N132), .Y(n469) );
  OAI222X2 U297 ( .A0(\buff[6][6] ), .A1(n564), .B0(n581), .B1(n564), .C0(
        \buff[6][6] ), .C1(n581), .Y(n575) );
  INVX1 U298 ( .A(N176), .Y(n581) );
  OAI221X2 U299 ( .A0(\buff[6][6] ), .A1(n581), .B0(n573), .B1(n572), .C0(n571), .Y(n574) );
  AO22XL U300 ( .A0(n127), .A1(N197), .B0(\buff[7][3] ), .B1(n676), .Y(N221)
         );
  AO22X2 U301 ( .A0(n127), .A1(N196), .B0(N204), .B1(n676), .Y(N220) );
  OA21X4 U302 ( .A0(N57), .A1(n324), .B0(n323), .Y(n179) );
  OAI222X2 U303 ( .A0(n165), .A1(n375), .B0(n165), .B1(n360), .C0(n375), .C1(
        n360), .Y(n361) );
  AO22X1 U304 ( .A0(n127), .A1(n142), .B0(N202), .B1(n676), .Y(N218) );
  INVX16 U305 ( .A(n127), .Y(n676) );
  OAI22X1 U306 ( .A0(n159), .A1(n238), .B0(n159), .B1(n664), .Y(n670) );
  OA22X2 U307 ( .A0(n663), .A1(n159), .B0(n663), .B1(n238), .Y(n666) );
  AND2X1 U308 ( .A(N35), .B(n134), .Y(N51) );
  CLKAND2X12 U309 ( .A(N47), .B(N46), .Y(n134) );
  BUFX8 U310 ( .A(N171), .Y(n161) );
  BUFX8 U311 ( .A(N173), .Y(n162) );
  AO22X1 U312 ( .A0(n129), .A1(N152), .B0(\buff[5][6] ), .B1(n189), .Y(N176)
         );
  OAI22X1 U313 ( .A0(n570), .A1(n579), .B0(N175), .B1(n570), .Y(n571) );
  AO22X2 U314 ( .A0(n129), .A1(n143), .B0(\buff[5][5] ), .B1(n189), .Y(N175)
         );
  AO22X2 U315 ( .A0(n129), .A1(N148), .B0(N156), .B1(n189), .Y(N172) );
  AOI2BB2X4 U316 ( .B0(n566), .B1(N178), .A0N(n161), .A1N(n577), .Y(n568) );
  AOI21X4 U317 ( .A0(n161), .A1(n577), .B0(n164), .Y(n566) );
  OAI222X2 U318 ( .A0(\buff[7][6] ), .A1(n613), .B0(n630), .B1(n613), .C0(
        \buff[7][6] ), .C1(n630), .Y(n624) );
  AO22X1 U319 ( .A0(n126), .A1(N222), .B0(\buff[8][4] ), .B1(n675), .Y(appr[4]) );
  AO22X4 U320 ( .A0(n429), .A1(N105), .B0(n424), .B1(n423), .Y(n425) );
  OAI222X2 U321 ( .A0(\buff[3][6] ), .A1(n141), .B0(n430), .B1(n141), .C0(
        \buff[3][6] ), .C1(n430), .Y(n424) );
  OAI222X2 U322 ( .A0(n163), .A1(n481), .B0(n163), .B1(n465), .C0(n481), .C1(
        n465), .Y(n466) );
  AO22X2 U323 ( .A0(n151), .A1(n138), .B0(N107), .B1(n679), .Y(N123) );
  AO22X1 U324 ( .A0(N58), .A1(n681), .B0(N50), .B1(n133), .Y(N74) );
  AO22X2 U325 ( .A0(n151), .A1(n145), .B0(N108), .B1(n679), .Y(N124) );
  CLKAND2X3 U326 ( .A(N242), .B(appr[3]), .Y(\add_51/carry [4]) );
  AOI221X2 U327 ( .A0(n226), .A1(n308), .B0(n297), .B1(n296), .C0(n295), .Y(
        n298) );
  AND2X1 U328 ( .A(N34), .B(n134), .Y(N50) );
  AO22X2 U329 ( .A0(N60), .A1(n681), .B0(N52), .B1(n133), .Y(N76) );
  NAND2BX4 U330 ( .AN(N150), .B(\buff[5][4] ), .Y(n514) );
  OA22X4 U331 ( .A0(n516), .A1(N149), .B0(n516), .B1(n529), .Y(n520) );
  AO22X2 U332 ( .A0(N59), .A1(n681), .B0(n144), .B1(n133), .Y(N75) );
  AO22X2 U333 ( .A0(n126), .A1(n160), .B0(N227), .B1(n675), .Y(N243) );
  OA22X4 U334 ( .A0(n185), .A1(n216), .B0(n160), .B1(n236), .Y(n665) );
  AO21X4 U335 ( .A0(n160), .A1(n236), .B0(N218), .Y(n185) );
  OAI22X1 U336 ( .A0(n366), .A1(n375), .B0(n165), .B1(n366), .Y(n367) );
  OAI221X2 U337 ( .A0(\buff[2][6] ), .A1(n377), .B0(n369), .B1(n368), .C0(n367), .Y(n370) );
  OAI22X2 U338 ( .A0(n365), .A1(n364), .B0(n363), .B1(n374), .Y(n368) );
  OAI222X4 U339 ( .A0(N42), .A1(n267), .B0(N42), .B1(n242), .C0(n242), .C1(
        n267), .Y(n243) );
  OAI222X2 U340 ( .A0(n234), .A1(n253), .B0(n271), .B1(n253), .C0(n234), .C1(
        n271), .Y(n254) );
  AOI2BB2X2 U341 ( .B0(n415), .B1(N106), .A0N(n138), .A1N(n426), .Y(n417) );
  OAI222X2 U342 ( .A0(\buff[4][6] ), .A1(n466), .B0(n483), .B1(n466), .C0(
        \buff[4][6] ), .C1(n483), .Y(n477) );
  NOR2BX4 U343 ( .AN(N124), .B(N132), .Y(n467) );
  AO22X1 U344 ( .A0(n127), .A1(N200), .B0(\buff[7][6] ), .B1(n676), .Y(N224)
         );
  ADDFHX2 U345 ( .A(N243), .B(appr[4]), .CI(\add_51/carry [4]), .CO(
        \add_51/carry [5]), .S(N246) );
  AO22X1 U346 ( .A0(n126), .A1(n159), .B0(\buff[8][3] ), .B1(n675), .Y(appr[3]) );
  AO22XL U347 ( .A0(N178), .A1(n677), .B0(n128), .B1(n164), .Y(N194) );
  AO22X4 U348 ( .A0(\buff[6][5] ), .A1(n677), .B0(n128), .B1(N175), .Y(N199)
         );
  AO22X4 U349 ( .A0(\buff[6][3] ), .A1(n677), .B0(n128), .B1(n162), .Y(N197)
         );
  OA22X4 U350 ( .A0(n362), .A1(N77), .B0(n362), .B1(n374), .Y(n365) );
  AO22X2 U351 ( .A0(\buff[1][3] ), .A1(n681), .B0(n137), .B1(n133), .Y(N77) );
  OAI22X1 U352 ( .A0(n419), .A1(n428), .B0(n140), .B1(n419), .Y(n420) );
  OAI222X2 U353 ( .A0(n140), .A1(n428), .B0(n140), .B1(n412), .C0(n428), .C1(
        n412), .Y(n413) );
  AO22X2 U354 ( .A0(n127), .A1(N199), .B0(\buff[7][5] ), .B1(n676), .Y(N223)
         );
  AO22X4 U355 ( .A0(n629), .A1(N201), .B0(n624), .B1(n623), .Y(n625) );
  OAI221X2 U356 ( .A0(\buff[3][6] ), .A1(n430), .B0(n422), .B1(n421), .C0(n420), .Y(n423) );
  NAND2BX2 U357 ( .AN(N76), .B(N84), .Y(n363) );
  OAI221X2 U358 ( .A0(\buff[4][6] ), .A1(n483), .B0(n475), .B1(n474), .C0(n473), .Y(n476) );
  OAI22X1 U359 ( .A0(N125), .A1(n480), .B0(N125), .B1(n469), .Y(n475) );
  OAI21X2 U360 ( .A0(N201), .A1(n629), .B0(n625), .Y(N215) );
  OAI21X4 U361 ( .A0(N129), .A1(n482), .B0(n478), .Y(N143) );
  NAND2BX4 U362 ( .AN(N148), .B(N156), .Y(n518) );
  OAI22X1 U363 ( .A0(N68), .A1(n304), .B0(N68), .B1(n294), .Y(n295) );
  OAI22X2 U364 ( .A0(n265), .A1(n264), .B0(N45), .B1(n269), .Y(N46) );
  AO22XL U365 ( .A0(\buff[1][5] ), .A1(n681), .B0(N55), .B1(n133), .Y(N79) );
  CLKXOR2X8 U366 ( .A(n194), .B(\add_45/carry [9]), .Y(n193) );
  OAI22X2 U367 ( .A0(n304), .A1(n293), .B0(N68), .B1(n293), .Y(n296) );
  OAI21X1 U368 ( .A0(n235), .A1(n191), .B0(n292), .Y(n293) );
  AND2X8 U369 ( .A(\add_45/carry [9]), .B(\buff[0][6] ), .Y(\add_45/carry [10]) );
  NOR4X1 U370 ( .A(\buff[0][3] ), .B(N36), .C(N35), .D(N34), .Y(n275) );
  XOR2X4 U371 ( .A(\buff[0][3] ), .B(N34), .Y(N37) );
  CLKAND2X6 U372 ( .A(N34), .B(\buff[0][3] ), .Y(\add_45/carry [4]) );
  AO22X1 U373 ( .A0(n127), .A1(N195), .B0(N203), .B1(n676), .Y(N219) );
  AO22X1 U374 ( .A0(n126), .A1(N223), .B0(\buff[8][5] ), .B1(n675), .Y(appr[5]) );
  AND2X2 U375 ( .A(\add_51/carry [9]), .B(appr[6]), .Y(\add_51/carry [10]) );
  OR2X1 U376 ( .A(n156), .B(n310), .Y(n188) );
  NAND2BX2 U377 ( .AN(N174), .B(\buff[6][4] ), .Y(n563) );
  XOR2X1 U378 ( .A(\buff[3][5] ), .B(\add_45_I4/carry [8]), .Y(N114) );
  NAND2BX2 U379 ( .AN(N222), .B(\buff[8][4] ), .Y(n661) );
  INVX3 U380 ( .A(n139), .Y(n483) );
  OAI22X2 U381 ( .A0(n666), .A1(n665), .B0(n664), .B1(n238), .Y(n669) );
  OA22X4 U382 ( .A0(n467), .A1(N125), .B0(n467), .B1(n480), .Y(n471) );
  AO22X4 U383 ( .A0(n482), .A1(N129), .B0(n477), .B1(n476), .Y(n478) );
  AO22X4 U384 ( .A0(n580), .A1(N177), .B0(n575), .B1(n574), .Y(n576) );
  XOR2X2 U385 ( .A(\buff[0][7] ), .B(\add_45/carry [10]), .Y(N44) );
  CLKINVX12 U386 ( .A(n176), .Y(n127) );
  CLKAND2X8 U387 ( .A(N215), .B(N214), .Y(n176) );
  INVXL U388 ( .A(n294), .Y(n308) );
  INVX4 U389 ( .A(N200), .Y(n630) );
  OAI22X2 U390 ( .A0(n316), .A1(n315), .B0(n314), .B1(n154), .Y(n319) );
  NAND2BX1 U391 ( .AN(N198), .B(\buff[7][4] ), .Y(n612) );
  AND2XL U392 ( .A(\add_45/carry [10]), .B(\buff[0][7] ), .Y(N45) );
  AND2XL U393 ( .A(\add_45_I3/carry [10]), .B(\buff[2][7] ), .Y(N93) );
  AND2XL U394 ( .A(\add_45_I4/carry [8]), .B(\buff[3][5] ), .Y(
        \add_45_I4/carry [9]) );
  NAND2X4 U395 ( .A(n170), .B(n258), .Y(n259) );
  OAI22X1 U396 ( .A0(n257), .A1(n267), .B0(N42), .B1(n257), .Y(n258) );
  OR2X4 U397 ( .A(N44), .B(n259), .Y(n172) );
  OR2X4 U398 ( .A(n268), .B(n259), .Y(n171) );
  OAI22XL U399 ( .A0(n507), .A1(n506), .B0(N165), .B1(n150), .Y(n183) );
  CMPR32X2 U400 ( .A(appr[4]), .B(appr[7]), .C(\add_51/carry [7]), .CO(
        \add_51/carry [8]), .S(N249) );
  NAND2XL U401 ( .A(n222), .B(n356), .Y(n336) );
  NAND2XL U402 ( .A(n222), .B(n408), .Y(n388) );
  OAI222XL U403 ( .A0(n234), .A1(n442), .B0(n462), .B1(n442), .C0(n234), .C1(
        n462), .Y(n443) );
  OAI222XL U404 ( .A0(N135), .A1(n457), .B0(N135), .B1(n441), .C0(n457), .C1(
        n441), .Y(n442) );
  NAND2XL U405 ( .A(n222), .B(n461), .Y(n441) );
  AO21X4 U406 ( .A0(N75), .A1(n373), .B0(N74), .Y(n184) );
  NAND2BX2 U407 ( .AN(N54), .B(\buff[1][4] ), .Y(n310) );
  OA22X2 U408 ( .A0(n312), .A1(n137), .B0(n312), .B1(n154), .Y(n316) );
  XOR2X2 U409 ( .A(n192), .B(\add_45_I2/carry [9]), .Y(n191) );
  ADDFXL U410 ( .A(\buff[1][3] ), .B(\buff[1][6] ), .CI(\add_45_I2/carry [6]), 
        .CO(\add_45_I2/carry [7]), .S(N64) );
  AND2X1 U411 ( .A(\add_45_I3/carry [8]), .B(\buff[2][5] ), .Y(
        \add_45_I3/carry [9]) );
  XOR2X1 U412 ( .A(n196), .B(\add_45_I3/carry [9]), .Y(n195) );
  XOR2X1 U413 ( .A(\buff[4][5] ), .B(\add_45_I5/carry [8]), .Y(N138) );
  ADDFXL U414 ( .A(\buff[5][4] ), .B(\buff[5][7] ), .CI(\add_45_I6/carry [7]), 
        .CO(\add_45_I6/carry [8]), .S(N161) );
  ADDFXL U415 ( .A(N155), .B(\buff[5][4] ), .CI(\add_45_I6/carry [4]), .CO(
        \add_45_I6/carry [5]), .S(N158) );
  NAND2X1 U416 ( .A(n171), .B(n172), .Y(n262) );
  OR2X1 U417 ( .A(n628), .B(n612), .Y(n175) );
  OAI22X1 U418 ( .A0(N149), .A1(n529), .B0(N149), .B1(n518), .Y(n524) );
  AOI221X2 U419 ( .A0(n226), .A1(n272), .B0(n263), .B1(n262), .C0(n261), .Y(
        n264) );
  OAI222X2 U420 ( .A0(n235), .A1(n243), .B0(n243), .B1(n193), .C0(n235), .C1(
        n193), .Y(n260) );
  CLKAND2X12 U421 ( .A(N239), .B(N238), .Y(n177) );
  NAND2X8 U422 ( .A(N95), .B(N94), .Y(n181) );
  OAI21X4 U423 ( .A0(N153), .A1(n531), .B0(n527), .Y(n182) );
  OAI22X1 U424 ( .A0(n162), .A1(n578), .B0(n162), .B1(n567), .Y(n573) );
  NAND2BXL U425 ( .AN(N65), .B(n224), .Y(n276) );
  CLKINVX3 U426 ( .A(N62), .Y(n306) );
  INVXL U427 ( .A(n344), .Y(n358) );
  NOR2XL U428 ( .A(n356), .B(n222), .Y(n334) );
  INVXL U429 ( .A(n396), .Y(n410) );
  INVXL U430 ( .A(n449), .Y(n463) );
  INVX1 U431 ( .A(N136), .Y(n462) );
  INVXL U432 ( .A(n502), .Y(n512) );
  OAI222X2 U433 ( .A0(n143), .A1(n530), .B0(n143), .B1(n514), .C0(n530), .C1(
        n514), .Y(n515) );
  OA22X4 U434 ( .A0(n565), .A1(n162), .B0(n565), .B1(n578), .Y(n569) );
  OAI222X2 U435 ( .A0(N175), .A1(n579), .B0(N175), .B1(n563), .C0(n579), .C1(
        n563), .Y(n564) );
  NOR2BX2 U436 ( .AN(N76), .B(N84), .Y(n362) );
  AO22X4 U437 ( .A0(n151), .A1(N102), .B0(\buff[3][4] ), .B1(n679), .Y(N126)
         );
  OAI222X2 U438 ( .A0(\buff[1][6] ), .A1(n311), .B0(n325), .B1(n311), .C0(
        \buff[1][6] ), .C1(n325), .Y(n322) );
  INVX4 U439 ( .A(N104), .Y(n430) );
  AO22XL U440 ( .A0(n127), .A1(N201), .B0(\buff[7][7] ), .B1(n676), .Y(N225)
         );
  AO22XL U441 ( .A0(\buff[1][6] ), .A1(n681), .B0(N56), .B1(n133), .Y(N80) );
  AO22XL U442 ( .A0(n129), .A1(N146), .B0(N154), .B1(n189), .Y(N170) );
  AO22XL U443 ( .A0(n151), .A1(N104), .B0(\buff[3][6] ), .B1(n679), .Y(N128)
         );
  AO22XL U444 ( .A0(n126), .A1(N220), .B0(N228), .B1(n675), .Y(N244) );
  AO22XL U445 ( .A0(n126), .A1(N225), .B0(\buff[8][7] ), .B1(n675), .Y(appr[7]) );
  AND2XL U446 ( .A(\add_45_I2/carry [8]), .B(\buff[1][5] ), .Y(
        \add_45_I2/carry [9]) );
  AND2XL U447 ( .A(\buff[0][7] ), .B(n134), .Y(N57) );
  AND2XL U448 ( .A(\add_45_I2/carry [10]), .B(\buff[1][7] ), .Y(N69) );
  ADDFX2 U449 ( .A(N83), .B(\buff[2][4] ), .CI(\add_45_I3/carry [4]), .CO(
        \add_45_I3/carry [5]), .S(N86) );
  NAND2BXL U450 ( .AN(N60), .B(n220), .Y(n280) );
  AND2XL U451 ( .A(\add_45_I3/carry [9]), .B(\buff[2][6] ), .Y(
        \add_45_I3/carry [10]) );
  NAND2BXL U452 ( .AN(N84), .B(n220), .Y(n330) );
  AND2XL U453 ( .A(\add_45_I4/carry [9]), .B(\buff[3][6] ), .Y(
        \add_45_I4/carry [10]) );
  AND2XL U454 ( .A(\add_45_I4/carry [10]), .B(\buff[3][7] ), .Y(N117) );
  NAND2BXL U455 ( .AN(N108), .B(n220), .Y(n382) );
  AND2XL U456 ( .A(\add_45_I5/carry [8]), .B(\buff[4][5] ), .Y(
        \add_45_I5/carry [9]) );
  AND2XL U457 ( .A(\add_45_I5/carry [9]), .B(\buff[4][6] ), .Y(
        \add_45_I5/carry [10]) );
  AND2XL U458 ( .A(\add_45_I5/carry [10]), .B(\buff[4][7] ), .Y(N141) );
  NAND2BXL U459 ( .AN(N132), .B(n220), .Y(n435) );
  AND2XL U460 ( .A(\add_45_I6/carry [8]), .B(\buff[5][5] ), .Y(
        \add_45_I6/carry [9]) );
  NOR2BXL U461 ( .AN(N156), .B(n220), .Y(n487) );
  NAND2BXL U462 ( .AN(N156), .B(n220), .Y(n488) );
  NOR2BXL U463 ( .AN(N180), .B(n220), .Y(n536) );
  NAND2BXL U464 ( .AN(N180), .B(n220), .Y(n537) );
  NOR2BXL U465 ( .AN(N204), .B(n220), .Y(n585) );
  NAND2BXL U466 ( .AN(N204), .B(n220), .Y(n586) );
  NOR2BXL U467 ( .AN(N228), .B(n220), .Y(n634) );
  CLKBUFX2 U468 ( .A(buff_sum[3]), .Y(n221) );
  CLKBUFX2 U469 ( .A(buff_sum[1]), .Y(n218) );
  NAND2BXL U470 ( .AN(N228), .B(n220), .Y(n635) );
  CLKBUFX3 U471 ( .A(n228), .Y(n229) );
  CLKBUFX3 U472 ( .A(n231), .Y(n230) );
  CLKBUFX3 U473 ( .A(n228), .Y(n231) );
  CLKBUFX3 U474 ( .A(n228), .Y(n232) );
  NOR2BX1 U475 ( .AN(N41), .B(n224), .Y(n257) );
  OAI22XL U476 ( .A0(n137), .A1(n154), .B0(n137), .B1(n314), .Y(n320) );
  NAND2BX1 U477 ( .AN(N41), .B(n224), .Y(n242) );
  OAI21X2 U478 ( .A0(N225), .A1(n241), .B0(n673), .Y(N239) );
  CLKINVX1 U479 ( .A(N224), .Y(n674) );
  CLKINVX1 U480 ( .A(n223), .Y(n266) );
  CLKINVX1 U481 ( .A(N40), .Y(n271) );
  XOR2X1 U482 ( .A(appr[3]), .B(N242), .Y(N245) );
  XOR2X1 U483 ( .A(appr[5]), .B(\add_51/carry [8]), .Y(N250) );
  ADDFXL U484 ( .A(appr[3]), .B(appr[6]), .CI(\add_51/carry [6]), .CO(
        \add_51/carry [7]), .S(N248) );
  XOR2X1 U485 ( .A(appr[7]), .B(\add_51/carry [10]), .Y(N252) );
  CLKINVX1 U486 ( .A(N38), .Y(n270) );
  CLKINVX1 U487 ( .A(n225), .Y(n267) );
  CLKINVX1 U488 ( .A(n226), .Y(n268) );
  CLKINVX1 U489 ( .A(n225), .Y(n303) );
  CLKINVX1 U490 ( .A(N64), .Y(n307) );
  CLKINVX1 U491 ( .A(n223), .Y(n302) );
  CLKINVX1 U492 ( .A(n221), .Y(n301) );
  CLKINVX1 U493 ( .A(N86), .Y(n356) );
  CLKINVX1 U494 ( .A(n219), .Y(n300) );
  CLKINVX1 U495 ( .A(n227), .Y(n269) );
  CLKINVX1 U496 ( .A(n223), .Y(n352) );
  CLKINVX1 U497 ( .A(n225), .Y(n353) );
  CLKINVX1 U498 ( .A(N88), .Y(n357) );
  CLKINVX1 U499 ( .A(n226), .Y(n304) );
  CLKINVX1 U500 ( .A(n221), .Y(n351) );
  CLKINVX1 U501 ( .A(n219), .Y(n350) );
  CLKINVX1 U502 ( .A(n226), .Y(n354) );
  CLKINVX1 U503 ( .A(N110), .Y(n408) );
  CLKINVX1 U504 ( .A(n227), .Y(n305) );
  CLKINVX1 U505 ( .A(n223), .Y(n404) );
  CLKINVX1 U506 ( .A(n225), .Y(n405) );
  CLKINVX1 U507 ( .A(n221), .Y(n403) );
  CLKINVX1 U508 ( .A(n219), .Y(n402) );
  CLKINVX1 U509 ( .A(n227), .Y(n355) );
  CLKINVX1 U510 ( .A(n226), .Y(n406) );
  CLKINVX1 U511 ( .A(n223), .Y(n457) );
  CLKINVX1 U512 ( .A(n225), .Y(n458) );
  CLKINVX1 U513 ( .A(N134), .Y(n461) );
  CLKINVX1 U514 ( .A(n227), .Y(n407) );
  CLKINVX1 U515 ( .A(buff_sum[3]), .Y(n456) );
  CLKINVX1 U516 ( .A(n219), .Y(n455) );
  CLKINVX1 U517 ( .A(N160), .Y(n511) );
  CLKINVX1 U518 ( .A(n226), .Y(n459) );
  CLKINVX1 U519 ( .A(N158), .Y(n510) );
  CLKINVX1 U520 ( .A(n227), .Y(n460) );
  CLKINVX1 U521 ( .A(n551), .Y(n561) );
  CLKINVX1 U522 ( .A(buff_sum[3]), .Y(n509) );
  CLKINVX1 U523 ( .A(n219), .Y(n508) );
  CLKINVX1 U524 ( .A(N184), .Y(n560) );
  CLKINVX1 U525 ( .A(N182), .Y(n559) );
  CLKINVX1 U526 ( .A(n600), .Y(n610) );
  CLKINVX1 U527 ( .A(buff_sum[3]), .Y(n558) );
  CLKINVX1 U528 ( .A(n219), .Y(n557) );
  CLKINVX1 U529 ( .A(N208), .Y(n609) );
  CLKINVX1 U530 ( .A(N206), .Y(n608) );
  CLKINVX1 U531 ( .A(n649), .Y(n659) );
  CLKINVX1 U532 ( .A(buff_sum[3]), .Y(n607) );
  CLKINVX1 U533 ( .A(n219), .Y(n606) );
  CLKINVX1 U534 ( .A(N232), .Y(n658) );
  CLKINVX1 U535 ( .A(N230), .Y(n657) );
  CLKINVX1 U536 ( .A(\sub_1_root_sub_0_root_add_29/carry [8]), .Y(N21) );
  CLKINVX1 U537 ( .A(buff_sum[3]), .Y(n656) );
  CLKINVX1 U538 ( .A(n219), .Y(n655) );
  CLKBUFX3 U539 ( .A(n228), .Y(n233) );
  CLKBUFX3 U540 ( .A(n682), .Y(n228) );
  CLKINVX1 U541 ( .A(n246), .Y(n273) );
  NOR2BX1 U542 ( .AN(N174), .B(\buff[6][4] ), .Y(n570) );
  AO22X1 U543 ( .A0(n129), .A1(N149), .B0(\buff[5][3] ), .B1(n189), .Y(N173)
         );
  NOR2BX1 U544 ( .AN(N222), .B(\buff[8][4] ), .Y(n667) );
  AO22X1 U545 ( .A0(n151), .A1(n140), .B0(\buff[3][5] ), .B1(n679), .Y(N127)
         );
  NOR2BX1 U546 ( .AN(N78), .B(\buff[2][4] ), .Y(n366) );
  OAI2BB2XL U547 ( .B0(n217), .B1(n190), .A0N(n152), .A1N(N35), .Y(n244) );
  AO22X1 U548 ( .A0(\buff[4][3] ), .A1(n678), .B0(n153), .B1(N125), .Y(N149)
         );
  AO22X1 U549 ( .A0(\buff[2][3] ), .A1(n680), .B0(n181), .B1(N77), .Y(N101) );
  AO22X1 U550 ( .A0(\buff[2][6] ), .A1(n680), .B0(n181), .B1(N80), .Y(N104) );
  AO22X1 U551 ( .A0(\buff[6][6] ), .A1(n677), .B0(n128), .B1(N176), .Y(N200)
         );
  AO22X1 U552 ( .A0(\buff[4][6] ), .A1(n678), .B0(n153), .B1(n139), .Y(N152)
         );
  AO22X1 U553 ( .A0(N130), .A1(n678), .B0(n153), .B1(N122), .Y(N146) );
  AO22X1 U554 ( .A0(N82), .A1(n680), .B0(n181), .B1(N74), .Y(N98) );
  ADDFXL U555 ( .A(\buff[1][4] ), .B(\buff[1][7] ), .CI(\add_45_I2/carry [7]), 
        .CO(\add_45_I2/carry [8]), .S(N65) );
  AO22X1 U556 ( .A0(\buff[2][7] ), .A1(n680), .B0(n181), .B1(N81), .Y(N105) );
  AO22X1 U557 ( .A0(\buff[4][7] ), .A1(n678), .B0(n153), .B1(N129), .Y(N153)
         );
  AO22X1 U558 ( .A0(\buff[6][7] ), .A1(n677), .B0(n128), .B1(N177), .Y(N201)
         );
  AO22X1 U559 ( .A0(\buff[1][7] ), .A1(n681), .B0(N57), .B1(n133), .Y(N81) );
  ADDFXL U560 ( .A(N84), .B(\buff[2][5] ), .CI(\add_45_I3/carry [5]), .CO(
        \add_45_I3/carry [6]), .S(N87) );
  CLKINVX1 U561 ( .A(n280), .Y(n309) );
  OAI2BB2XL U562 ( .B0(n217), .B1(n197), .A0N(n300), .A1N(N59), .Y(n278) );
  CLKINVX1 U563 ( .A(n330), .Y(n359) );
  OAI2BB2XL U564 ( .B0(n217), .B1(n198), .A0N(n350), .A1N(N83), .Y(n328) );
  XOR2X1 U565 ( .A(n200), .B(\add_45_I4/carry [9]), .Y(n199) );
  ADDFXL U566 ( .A(\buff[3][3] ), .B(\buff[3][6] ), .CI(\add_45_I4/carry [6]), 
        .CO(\add_45_I4/carry [7]), .S(N112) );
  CLKINVX1 U567 ( .A(n382), .Y(n411) );
  OAI2BB2XL U568 ( .B0(n217), .B1(n201), .A0N(n402), .A1N(N107), .Y(n380) );
  ADDFXL U569 ( .A(\buff[4][3] ), .B(\buff[4][6] ), .CI(\add_45_I5/carry [6]), 
        .CO(\add_45_I5/carry [7]), .S(N136) );
  XOR2X1 U570 ( .A(n203), .B(\add_45_I5/carry [9]), .Y(n202) );
  CLKINVX1 U571 ( .A(n435), .Y(n464) );
  ADDFXL U572 ( .A(\buff[5][3] ), .B(\buff[5][6] ), .CI(\add_45_I6/carry [6]), 
        .CO(\add_45_I6/carry [7]), .S(N160) );
  ADDFXL U573 ( .A(N156), .B(\buff[5][5] ), .CI(\add_45_I6/carry [5]), .CO(
        \add_45_I6/carry [6]), .S(N159) );
  OAI2BB2XL U574 ( .B0(n217), .B1(n204), .A0N(n455), .A1N(N131), .Y(n433) );
  XOR2X1 U575 ( .A(n206), .B(\add_45_I6/carry [9]), .Y(n205) );
  CLKINVX1 U576 ( .A(n488), .Y(n513) );
  ADDFXL U577 ( .A(N179), .B(\buff[6][4] ), .CI(\add_45_I7/carry [4]), .CO(
        \add_45_I7/carry [5]), .S(N182) );
  OAI2BB2XL U578 ( .B0(n217), .B1(n207), .A0N(n508), .A1N(N155), .Y(n486) );
  XOR2X1 U579 ( .A(n209), .B(\add_45_I7/carry [9]), .Y(n208) );
  ADDFXL U580 ( .A(\buff[6][4] ), .B(\buff[6][7] ), .CI(\add_45_I7/carry [7]), 
        .CO(\add_45_I7/carry [8]), .S(N185) );
  ADDFXL U581 ( .A(\buff[6][3] ), .B(\buff[6][6] ), .CI(\add_45_I7/carry [6]), 
        .CO(\add_45_I7/carry [7]), .S(N184) );
  ADDFXL U582 ( .A(N180), .B(\buff[6][5] ), .CI(\add_45_I7/carry [5]), .CO(
        \add_45_I7/carry [6]), .S(N183) );
  CLKINVX1 U583 ( .A(n537), .Y(n562) );
  ADDFXL U584 ( .A(N203), .B(\buff[7][4] ), .CI(\add_45_I8/carry [4]), .CO(
        \add_45_I8/carry [5]), .S(N206) );
  OAI2BB2XL U585 ( .B0(n217), .B1(n210), .A0N(n557), .A1N(N179), .Y(n535) );
  XOR2X1 U586 ( .A(n212), .B(\add_45_I8/carry [9]), .Y(n211) );
  ADDFXL U587 ( .A(\buff[7][4] ), .B(\buff[7][7] ), .CI(\add_45_I8/carry [7]), 
        .CO(\add_45_I8/carry [8]), .S(N209) );
  ADDFXL U588 ( .A(\buff[7][3] ), .B(\buff[7][6] ), .CI(\add_45_I8/carry [6]), 
        .CO(\add_45_I8/carry [7]), .S(N208) );
  ADDFXL U589 ( .A(N204), .B(\buff[7][5] ), .CI(\add_45_I8/carry [5]), .CO(
        \add_45_I8/carry [6]), .S(N207) );
  CLKINVX1 U590 ( .A(n586), .Y(n611) );
  OAI2BB2XL U591 ( .B0(n217), .B1(n213), .A0N(n606), .A1N(N203), .Y(n584) );
  XOR2X1 U592 ( .A(n215), .B(\add_45_I9/carry [9]), .Y(n214) );
  ADDFXL U593 ( .A(\buff[8][4] ), .B(\buff[8][7] ), .CI(\add_45_I9/carry [7]), 
        .CO(\add_45_I9/carry [8]), .S(N233) );
  ADDFXL U594 ( .A(\buff[8][3] ), .B(\buff[8][6] ), .CI(\add_45_I9/carry [6]), 
        .CO(\add_45_I9/carry [7]), .S(N232) );
  ADDFXL U595 ( .A(N227), .B(\buff[8][4] ), .CI(\add_45_I9/carry [4]), .CO(
        \add_45_I9/carry [5]), .S(N230) );
  ADDFXL U596 ( .A(N228), .B(\buff[8][5] ), .CI(\add_45_I9/carry [5]), .CO(
        \add_45_I9/carry [6]), .S(N231) );
  CLKINVX1 U597 ( .A(n635), .Y(n660) );
  ADDFXL U598 ( .A(X[1]), .B(n236), .CI(
        \sub_1_root_sub_0_root_add_29/carry [1]), .CO(
        \sub_1_root_sub_0_root_add_29/carry [2]), .S(N11) );
  OAI2BB2XL U599 ( .B0(n217), .B1(n216), .A0N(n655), .A1N(N227), .Y(n633) );
  ADDFXL U600 ( .A(X[2]), .B(n237), .CI(
        \sub_1_root_sub_0_root_add_29/carry [2]), .CO(
        \sub_1_root_sub_0_root_add_29/carry [3]), .S(N12) );
  ADDFXL U601 ( .A(X[4]), .B(n239), .CI(
        \sub_1_root_sub_0_root_add_29/carry [4]), .CO(
        \sub_1_root_sub_0_root_add_29/carry [5]), .S(N14) );
  ADDFXL U602 ( .A(X[5]), .B(n240), .CI(
        \sub_1_root_sub_0_root_add_29/carry [5]), .CO(
        \sub_1_root_sub_0_root_add_29/carry [6]), .S(N15) );
  ADDFXL U603 ( .A(X[7]), .B(n241), .CI(
        \sub_1_root_sub_0_root_add_29/carry [7]), .CO(
        \sub_1_root_sub_0_root_add_29/carry [8]), .S(N17) );
  ADDFXL U604 ( .A(X[6]), .B(n215), .CI(
        \sub_1_root_sub_0_root_add_29/carry [6]), .CO(
        \sub_1_root_sub_0_root_add_29/carry [7]), .S(N16) );
  ADDFXL U605 ( .A(X[3]), .B(n238), .CI(
        \sub_1_root_sub_0_root_add_29/carry [3]), .CO(
        \sub_1_root_sub_0_root_add_29/carry [4]), .S(N13) );
  OAI222X2 U606 ( .A0(\buff[2][6] ), .A1(n361), .B0(n377), .B1(n361), .C0(
        \buff[2][6] ), .C1(n377), .Y(n371) );
  OAI221X2 U607 ( .A0(\buff[1][6] ), .A1(n325), .B0(n320), .B1(n319), .C0(n318), .Y(n321) );
  AO22X4 U608 ( .A0(n241), .A1(N225), .B0(n672), .B1(n671), .Y(n673) );
  AO22X4 U609 ( .A0(n531), .A1(N153), .B0(n526), .B1(n525), .Y(n527) );
  OAI21X4 U610 ( .A0(N81), .A1(n376), .B0(n372), .Y(N95) );
  AO22X4 U611 ( .A0(n376), .A1(N81), .B0(n371), .B1(n370), .Y(n372) );
  AND2X1 U612 ( .A(\add_51/carry [10]), .B(appr[7]), .Y(N253) );
  XOR2X1 U613 ( .A(appr[6]), .B(\add_51/carry [9]), .Y(N251) );
  AND2X1 U614 ( .A(\add_51/carry [8]), .B(appr[5]), .Y(\add_51/carry [9]) );
  AND2X1 U615 ( .A(\add_45_I9/carry [10]), .B(\buff[8][7] ), .Y(N237) );
  XOR2X1 U616 ( .A(\buff[8][7] ), .B(\add_45_I9/carry [10]), .Y(N236) );
  AND2X1 U617 ( .A(\add_45_I9/carry [9]), .B(\buff[8][6] ), .Y(
        \add_45_I9/carry [10]) );
  AND2X1 U618 ( .A(\add_45_I9/carry [8]), .B(\buff[8][5] ), .Y(
        \add_45_I9/carry [9]) );
  XOR2X1 U619 ( .A(\buff[8][5] ), .B(\add_45_I9/carry [8]), .Y(N234) );
  AND2X1 U620 ( .A(N226), .B(\buff[8][3] ), .Y(\add_45_I9/carry [4]) );
  XOR2X1 U621 ( .A(\buff[8][3] ), .B(N226), .Y(N229) );
  AND2X1 U622 ( .A(\add_45_I8/carry [10]), .B(\buff[7][7] ), .Y(N213) );
  XOR2X1 U623 ( .A(\buff[7][7] ), .B(\add_45_I8/carry [10]), .Y(N212) );
  AND2X1 U624 ( .A(\add_45_I8/carry [9]), .B(\buff[7][6] ), .Y(
        \add_45_I8/carry [10]) );
  AND2X1 U625 ( .A(\add_45_I8/carry [8]), .B(\buff[7][5] ), .Y(
        \add_45_I8/carry [9]) );
  XOR2X1 U626 ( .A(\buff[7][5] ), .B(\add_45_I8/carry [8]), .Y(N210) );
  AND2X1 U627 ( .A(N202), .B(\buff[7][3] ), .Y(\add_45_I8/carry [4]) );
  XOR2X1 U628 ( .A(\buff[7][3] ), .B(N202), .Y(N205) );
  AND2X1 U629 ( .A(\add_45_I7/carry [10]), .B(\buff[6][7] ), .Y(N189) );
  XOR2X1 U630 ( .A(\buff[6][7] ), .B(\add_45_I7/carry [10]), .Y(N188) );
  AND2X1 U631 ( .A(\add_45_I7/carry [9]), .B(\buff[6][6] ), .Y(
        \add_45_I7/carry [10]) );
  AND2X1 U632 ( .A(\add_45_I7/carry [8]), .B(\buff[6][5] ), .Y(
        \add_45_I7/carry [9]) );
  XOR2X1 U633 ( .A(\buff[6][5] ), .B(\add_45_I7/carry [8]), .Y(N186) );
  AND2X1 U634 ( .A(N178), .B(\buff[6][3] ), .Y(\add_45_I7/carry [4]) );
  XOR2X1 U635 ( .A(\buff[6][3] ), .B(N178), .Y(N181) );
  AND2X1 U636 ( .A(\add_45_I6/carry [10]), .B(\buff[5][7] ), .Y(N165) );
  XOR2X1 U637 ( .A(\buff[5][7] ), .B(\add_45_I6/carry [10]), .Y(N164) );
  AND2X1 U638 ( .A(\add_45_I6/carry [9]), .B(\buff[5][6] ), .Y(
        \add_45_I6/carry [10]) );
  XOR2X1 U639 ( .A(\buff[5][5] ), .B(\add_45_I6/carry [8]), .Y(N162) );
  AND2X1 U640 ( .A(N154), .B(\buff[5][3] ), .Y(\add_45_I6/carry [4]) );
  XOR2X1 U641 ( .A(\buff[5][3] ), .B(N154), .Y(N157) );
  XOR2X1 U642 ( .A(\buff[4][7] ), .B(\add_45_I5/carry [10]), .Y(N140) );
  AND2X1 U643 ( .A(N130), .B(\buff[4][3] ), .Y(\add_45_I5/carry [4]) );
  XOR2X1 U644 ( .A(\buff[4][3] ), .B(N130), .Y(N133) );
  XOR2X1 U645 ( .A(\buff[3][7] ), .B(\add_45_I4/carry [10]), .Y(N116) );
  AND2X1 U646 ( .A(N106), .B(\buff[3][3] ), .Y(\add_45_I4/carry [4]) );
  XOR2X1 U647 ( .A(\buff[3][3] ), .B(N106), .Y(N109) );
  XOR2X1 U648 ( .A(\buff[2][5] ), .B(\add_45_I3/carry [8]), .Y(N90) );
  AND2X1 U649 ( .A(N82), .B(\buff[2][3] ), .Y(\add_45_I3/carry [4]) );
  XOR2X1 U650 ( .A(\buff[2][3] ), .B(N82), .Y(N85) );
  XOR2X1 U651 ( .A(\buff[1][5] ), .B(\add_45_I2/carry [8]), .Y(N66) );
  AND2X1 U652 ( .A(N58), .B(\buff[1][3] ), .Y(\add_45_I2/carry [4]) );
  XOR2X1 U653 ( .A(\buff[1][3] ), .B(N58), .Y(N61) );
  OR2X1 U654 ( .A(n216), .B(X[0]), .Y(\sub_1_root_sub_0_root_add_29/carry [1])
         );
  XNOR2X1 U655 ( .A(X[0]), .B(n216), .Y(N10) );
  NOR2BX1 U656 ( .AN(N45), .B(n227), .Y(n265) );
  OAI21XL U657 ( .A0(N35), .A1(n152), .B0(n244), .Y(n249) );
  OAI22XL U658 ( .A0(n245), .A1(n146), .B0(N37), .B1(n245), .Y(n248) );
  OAI22XL U659 ( .A0(N37), .A1(n146), .B0(N37), .B1(n246), .Y(n247) );
  AOI221XL U660 ( .A0(n221), .A1(n273), .B0(n249), .B1(n248), .C0(n247), .Y(
        n256) );
  NOR2X1 U661 ( .A(n270), .B(n222), .Y(n250) );
  OAI22XL U662 ( .A0(n250), .A1(n266), .B0(N39), .B1(n250), .Y(n251) );
  OAI21XL U663 ( .A0(n234), .A1(n271), .B0(n251), .Y(n255) );
  NAND2X1 U664 ( .A(n275), .B(n274), .Y(N47) );
  NOR2BX1 U665 ( .AN(N69), .B(n227), .Y(n299) );
  OAI21XL U666 ( .A0(N59), .A1(n300), .B0(n278), .Y(n283) );
  OAI22XL U667 ( .A0(n279), .A1(n301), .B0(N61), .B1(n279), .Y(n282) );
  OAI22XL U668 ( .A0(N61), .A1(n301), .B0(N61), .B1(n280), .Y(n281) );
  AOI221XL U669 ( .A0(n221), .A1(n309), .B0(n283), .B1(n282), .C0(n281), .Y(
        n290) );
  NOR2X1 U670 ( .A(n306), .B(n222), .Y(n284) );
  OAI22XL U671 ( .A0(n284), .A1(n302), .B0(N63), .B1(n284), .Y(n285) );
  OAI21XL U672 ( .A0(n234), .A1(n307), .B0(n285), .Y(n289) );
  NAND2X1 U673 ( .A(n222), .B(n306), .Y(n286) );
  OAI21XL U674 ( .A0(n290), .A1(n289), .B0(n288), .Y(n297) );
  NOR2BX1 U675 ( .AN(N65), .B(n224), .Y(n291) );
  OAI22XL U676 ( .A0(n291), .A1(n303), .B0(N66), .B1(n291), .Y(n292) );
  NOR2BX1 U677 ( .AN(N93), .B(n227), .Y(n349) );
  NAND2BX1 U678 ( .AN(N89), .B(n224), .Y(n326) );
  OAI21XL U679 ( .A0(N83), .A1(n350), .B0(n328), .Y(n333) );
  NOR2BX1 U680 ( .AN(N84), .B(n220), .Y(n329) );
  OAI22XL U681 ( .A0(n329), .A1(n351), .B0(N85), .B1(n329), .Y(n332) );
  OAI22XL U682 ( .A0(N85), .A1(n351), .B0(N85), .B1(n330), .Y(n331) );
  AOI221XL U683 ( .A0(n221), .A1(n359), .B0(n333), .B1(n332), .C0(n331), .Y(
        n340) );
  OAI22XL U684 ( .A0(n334), .A1(n352), .B0(N87), .B1(n334), .Y(n335) );
  OAI21XL U685 ( .A0(n234), .A1(n357), .B0(n335), .Y(n339) );
  OAI21XL U686 ( .A0(n340), .A1(n339), .B0(n338), .Y(n347) );
  NOR2BX1 U687 ( .AN(N89), .B(n224), .Y(n341) );
  OAI22XL U688 ( .A0(n341), .A1(n353), .B0(N90), .B1(n341), .Y(n342) );
  OAI21XL U689 ( .A0(n235), .A1(n195), .B0(n342), .Y(n343) );
  OAI22XL U690 ( .A0(n354), .A1(n343), .B0(N92), .B1(n343), .Y(n346) );
  OAI22XL U691 ( .A0(N92), .A1(n354), .B0(N92), .B1(n344), .Y(n345) );
  AOI221XL U692 ( .A0(n226), .A1(n358), .B0(n347), .B1(n346), .C0(n345), .Y(
        n348) );
  OAI22XL U693 ( .A0(n349), .A1(n348), .B0(N93), .B1(n355), .Y(N94) );
  CLKINVX6 U694 ( .A(N80), .Y(n377) );
  NOR2BX1 U695 ( .AN(N117), .B(n227), .Y(n401) );
  NAND2BX1 U696 ( .AN(N113), .B(n224), .Y(n378) );
  OAI222XL U697 ( .A0(N114), .A1(n405), .B0(N114), .B1(n378), .C0(n378), .C1(
        n405), .Y(n379) );
  OAI222XL U698 ( .A0(n235), .A1(n379), .B0(n379), .B1(n199), .C0(n235), .C1(
        n199), .Y(n396) );
  OAI21XL U699 ( .A0(N107), .A1(n402), .B0(n380), .Y(n385) );
  NOR2BX1 U700 ( .AN(N108), .B(n220), .Y(n381) );
  OAI22XL U701 ( .A0(n381), .A1(n403), .B0(N109), .B1(n381), .Y(n384) );
  OAI22XL U702 ( .A0(N109), .A1(n403), .B0(N109), .B1(n382), .Y(n383) );
  AOI221XL U703 ( .A0(buff_sum[3]), .A1(n411), .B0(n385), .B1(n384), .C0(n383), 
        .Y(n392) );
  NOR2X1 U704 ( .A(n408), .B(n222), .Y(n386) );
  OAI22XL U705 ( .A0(n386), .A1(n404), .B0(N111), .B1(n386), .Y(n387) );
  OAI21XL U706 ( .A0(n234), .A1(n409), .B0(n387), .Y(n391) );
  OAI21XL U707 ( .A0(n392), .A1(n391), .B0(n390), .Y(n399) );
  NOR2BX1 U708 ( .AN(N113), .B(n224), .Y(n393) );
  OAI22XL U709 ( .A0(n393), .A1(n405), .B0(N114), .B1(n393), .Y(n394) );
  OAI21XL U710 ( .A0(n235), .A1(n199), .B0(n394), .Y(n395) );
  OAI22XL U711 ( .A0(n406), .A1(n395), .B0(N116), .B1(n395), .Y(n398) );
  OAI22XL U712 ( .A0(N116), .A1(n406), .B0(N116), .B1(n396), .Y(n397) );
  AOI221XL U713 ( .A0(n226), .A1(n410), .B0(n399), .B1(n398), .C0(n397), .Y(
        n400) );
  OAI22XL U714 ( .A0(n401), .A1(n400), .B0(N117), .B1(n407), .Y(N118) );
  NOR2BX1 U715 ( .AN(N141), .B(n227), .Y(n454) );
  NAND2BX1 U716 ( .AN(N137), .B(n224), .Y(n431) );
  OAI222XL U717 ( .A0(N138), .A1(n458), .B0(N138), .B1(n431), .C0(n431), .C1(
        n458), .Y(n432) );
  OAI222XL U718 ( .A0(n235), .A1(n432), .B0(n432), .B1(n202), .C0(n235), .C1(
        n202), .Y(n449) );
  OAI21XL U719 ( .A0(N131), .A1(n455), .B0(n433), .Y(n438) );
  NOR2BX1 U720 ( .AN(N132), .B(n220), .Y(n434) );
  OAI22XL U721 ( .A0(n434), .A1(n456), .B0(N133), .B1(n434), .Y(n437) );
  OAI22XL U722 ( .A0(N133), .A1(n456), .B0(N133), .B1(n435), .Y(n436) );
  AOI221XL U723 ( .A0(buff_sum[3]), .A1(n464), .B0(n438), .B1(n437), .C0(n436), 
        .Y(n445) );
  NOR2X1 U724 ( .A(n461), .B(n222), .Y(n439) );
  OAI22XL U725 ( .A0(n439), .A1(n457), .B0(N135), .B1(n439), .Y(n440) );
  OAI21XL U726 ( .A0(n234), .A1(n462), .B0(n440), .Y(n444) );
  OAI21XL U727 ( .A0(n445), .A1(n444), .B0(n443), .Y(n452) );
  NOR2BX1 U728 ( .AN(N137), .B(n224), .Y(n446) );
  OAI22XL U729 ( .A0(n446), .A1(n458), .B0(N138), .B1(n446), .Y(n447) );
  OAI21XL U730 ( .A0(n235), .A1(n202), .B0(n447), .Y(n448) );
  OAI22XL U731 ( .A0(n459), .A1(n448), .B0(N140), .B1(n448), .Y(n451) );
  OAI22XL U732 ( .A0(N140), .A1(n459), .B0(N140), .B1(n449), .Y(n450) );
  AOI221XL U733 ( .A0(n226), .A1(n463), .B0(n452), .B1(n451), .C0(n450), .Y(
        n453) );
  OAI22XL U734 ( .A0(n454), .A1(n453), .B0(N141), .B1(n460), .Y(N142) );
  NOR2BX1 U735 ( .AN(N165), .B(n227), .Y(n507) );
  NAND2BX1 U736 ( .AN(N161), .B(n224), .Y(n484) );
  OAI222XL U737 ( .A0(N162), .A1(n458), .B0(N162), .B1(n484), .C0(n484), .C1(
        n458), .Y(n485) );
  OAI222XL U738 ( .A0(n235), .A1(n485), .B0(n485), .B1(n205), .C0(n235), .C1(
        n205), .Y(n502) );
  OAI21XL U739 ( .A0(N155), .A1(n508), .B0(n486), .Y(n491) );
  OAI22XL U740 ( .A0(n487), .A1(n509), .B0(N157), .B1(n487), .Y(n490) );
  OAI22XL U741 ( .A0(N157), .A1(n509), .B0(N157), .B1(n488), .Y(n489) );
  AOI221XL U742 ( .A0(buff_sum[3]), .A1(n513), .B0(n491), .B1(n490), .C0(n489), 
        .Y(n498) );
  NOR2X1 U743 ( .A(n510), .B(n222), .Y(n492) );
  OAI22XL U744 ( .A0(n492), .A1(n457), .B0(N159), .B1(n492), .Y(n493) );
  OAI21XL U745 ( .A0(n234), .A1(n511), .B0(n493), .Y(n497) );
  NAND2X1 U746 ( .A(n222), .B(n510), .Y(n494) );
  OAI222XL U747 ( .A0(N159), .A1(n457), .B0(N159), .B1(n494), .C0(n457), .C1(
        n494), .Y(n495) );
  OAI222XL U748 ( .A0(n234), .A1(n495), .B0(n511), .B1(n495), .C0(n234), .C1(
        n511), .Y(n496) );
  OAI21XL U749 ( .A0(n498), .A1(n497), .B0(n496), .Y(n505) );
  NOR2BX1 U750 ( .AN(N161), .B(n224), .Y(n499) );
  OAI22XL U751 ( .A0(n499), .A1(n458), .B0(N162), .B1(n499), .Y(n500) );
  OAI21XL U752 ( .A0(n235), .A1(n205), .B0(n500), .Y(n501) );
  OAI22XL U753 ( .A0(n149), .A1(n501), .B0(N164), .B1(n501), .Y(n504) );
  OAI22XL U754 ( .A0(N164), .A1(n459), .B0(N164), .B1(n502), .Y(n503) );
  AOI221XL U755 ( .A0(n226), .A1(n512), .B0(n505), .B1(n504), .C0(n503), .Y(
        n506) );
  NOR2BX1 U756 ( .AN(N150), .B(\buff[5][4] ), .Y(n521) );
  NOR2BX1 U757 ( .AN(N189), .B(n227), .Y(n556) );
  NAND2BX1 U758 ( .AN(N185), .B(n224), .Y(n533) );
  OAI222XL U759 ( .A0(N186), .A1(n148), .B0(N186), .B1(n533), .C0(n533), .C1(
        n458), .Y(n534) );
  OAI222XL U760 ( .A0(n235), .A1(n534), .B0(n534), .B1(n208), .C0(n235), .C1(
        n208), .Y(n551) );
  OAI21XL U761 ( .A0(N179), .A1(n557), .B0(n535), .Y(n540) );
  OAI22XL U762 ( .A0(n536), .A1(n558), .B0(N181), .B1(n536), .Y(n539) );
  OAI22XL U763 ( .A0(N181), .A1(n558), .B0(N181), .B1(n537), .Y(n538) );
  AOI221XL U764 ( .A0(buff_sum[3]), .A1(n562), .B0(n540), .B1(n539), .C0(n538), 
        .Y(n547) );
  NOR2X1 U765 ( .A(n559), .B(n222), .Y(n541) );
  OAI22XL U766 ( .A0(n541), .A1(n404), .B0(N183), .B1(n541), .Y(n542) );
  OAI21XL U767 ( .A0(n234), .A1(n560), .B0(n542), .Y(n546) );
  NAND2X1 U768 ( .A(n222), .B(n559), .Y(n543) );
  OAI222XL U769 ( .A0(N183), .A1(n147), .B0(N183), .B1(n543), .C0(n457), .C1(
        n543), .Y(n544) );
  OAI222XL U770 ( .A0(n234), .A1(n544), .B0(n560), .B1(n544), .C0(n234), .C1(
        n560), .Y(n545) );
  OAI21XL U771 ( .A0(n547), .A1(n546), .B0(n545), .Y(n554) );
  NOR2BX1 U772 ( .AN(N185), .B(n224), .Y(n548) );
  OAI22XL U773 ( .A0(n548), .A1(n405), .B0(N186), .B1(n548), .Y(n549) );
  OAI21XL U774 ( .A0(n235), .A1(n208), .B0(n549), .Y(n550) );
  OAI22XL U775 ( .A0(n149), .A1(n550), .B0(N188), .B1(n550), .Y(n553) );
  OAI22XL U776 ( .A0(N188), .A1(n149), .B0(N188), .B1(n551), .Y(n552) );
  AOI221XL U777 ( .A0(n226), .A1(n561), .B0(n554), .B1(n553), .C0(n552), .Y(
        n555) );
  OAI22XL U778 ( .A0(n556), .A1(n555), .B0(N189), .B1(n150), .Y(N190) );
  NOR2BX1 U779 ( .AN(N213), .B(n227), .Y(n605) );
  NAND2BX1 U780 ( .AN(N209), .B(n224), .Y(n582) );
  OAI222XL U781 ( .A0(N210), .A1(n148), .B0(N210), .B1(n582), .C0(n582), .C1(
        n148), .Y(n583) );
  OAI222XL U782 ( .A0(n235), .A1(n583), .B0(n583), .B1(n211), .C0(n235), .C1(
        n211), .Y(n600) );
  OAI21XL U783 ( .A0(N203), .A1(n606), .B0(n584), .Y(n589) );
  OAI22XL U784 ( .A0(n585), .A1(n607), .B0(N205), .B1(n585), .Y(n588) );
  OAI22XL U785 ( .A0(N205), .A1(n607), .B0(N205), .B1(n586), .Y(n587) );
  AOI221XL U786 ( .A0(buff_sum[3]), .A1(n611), .B0(n589), .B1(n588), .C0(n587), 
        .Y(n596) );
  NOR2X1 U787 ( .A(n608), .B(n222), .Y(n590) );
  OAI22XL U788 ( .A0(n590), .A1(n147), .B0(N207), .B1(n590), .Y(n591) );
  OAI21XL U789 ( .A0(n234), .A1(n609), .B0(n591), .Y(n595) );
  NAND2X1 U790 ( .A(n222), .B(n608), .Y(n592) );
  OAI222XL U791 ( .A0(N207), .A1(n147), .B0(N207), .B1(n592), .C0(n147), .C1(
        n592), .Y(n593) );
  OAI222XL U792 ( .A0(n234), .A1(n593), .B0(n609), .B1(n593), .C0(n234), .C1(
        n609), .Y(n594) );
  OAI21XL U793 ( .A0(n596), .A1(n595), .B0(n594), .Y(n603) );
  NOR2BX1 U794 ( .AN(N209), .B(n224), .Y(n597) );
  OAI22XL U795 ( .A0(n597), .A1(n148), .B0(N210), .B1(n597), .Y(n598) );
  OAI21XL U796 ( .A0(n235), .A1(n211), .B0(n598), .Y(n599) );
  OAI22XL U797 ( .A0(n149), .A1(n599), .B0(N212), .B1(n599), .Y(n602) );
  OAI22XL U798 ( .A0(N212), .A1(n149), .B0(N212), .B1(n600), .Y(n601) );
  AOI221XL U799 ( .A0(n226), .A1(n610), .B0(n603), .B1(n602), .C0(n601), .Y(
        n604) );
  OAI22XL U800 ( .A0(n605), .A1(n604), .B0(N213), .B1(n150), .Y(N214) );
  NAND2BX1 U801 ( .AN(N196), .B(N204), .Y(n616) );
  NOR2BX1 U802 ( .AN(N198), .B(\buff[7][4] ), .Y(n619) );
  NOR2BX1 U803 ( .AN(N237), .B(n227), .Y(n654) );
  NAND2BX1 U804 ( .AN(N233), .B(n224), .Y(n631) );
  OAI222XL U805 ( .A0(N234), .A1(n148), .B0(N234), .B1(n631), .C0(n631), .C1(
        n148), .Y(n632) );
  OAI222XL U806 ( .A0(n235), .A1(n632), .B0(n632), .B1(n214), .C0(n235), .C1(
        n214), .Y(n649) );
  OAI21XL U807 ( .A0(N227), .A1(n655), .B0(n633), .Y(n638) );
  OAI22XL U808 ( .A0(n634), .A1(n656), .B0(N229), .B1(n634), .Y(n637) );
  OAI22XL U809 ( .A0(N229), .A1(n656), .B0(N229), .B1(n635), .Y(n636) );
  AOI221XL U810 ( .A0(buff_sum[3]), .A1(n660), .B0(n638), .B1(n637), .C0(n636), 
        .Y(n645) );
  NOR2X1 U811 ( .A(n657), .B(n222), .Y(n639) );
  OAI22XL U812 ( .A0(n639), .A1(n147), .B0(N231), .B1(n639), .Y(n640) );
  OAI21XL U813 ( .A0(n234), .A1(n658), .B0(n640), .Y(n644) );
  NAND2X1 U814 ( .A(n222), .B(n657), .Y(n641) );
  OAI222XL U815 ( .A0(N231), .A1(n147), .B0(N231), .B1(n641), .C0(n147), .C1(
        n641), .Y(n642) );
  OAI222XL U816 ( .A0(n234), .A1(n642), .B0(n658), .B1(n642), .C0(n234), .C1(
        n658), .Y(n643) );
  OAI21XL U817 ( .A0(n645), .A1(n644), .B0(n643), .Y(n652) );
  NOR2BX1 U818 ( .AN(N233), .B(n224), .Y(n646) );
  OAI22XL U819 ( .A0(n646), .A1(n148), .B0(N234), .B1(n646), .Y(n647) );
  OAI21XL U820 ( .A0(n235), .A1(n214), .B0(n647), .Y(n648) );
  OAI22XL U821 ( .A0(n149), .A1(n648), .B0(N236), .B1(n648), .Y(n651) );
  OAI22XL U822 ( .A0(N236), .A1(n149), .B0(N236), .B1(n649), .Y(n650) );
  AOI221XL U823 ( .A0(n226), .A1(n659), .B0(n652), .B1(n651), .C0(n650), .Y(
        n653) );
  OAI22XL U824 ( .A0(n654), .A1(n653), .B0(N237), .B1(n150), .Y(N238) );
  NAND2BX1 U825 ( .AN(N220), .B(N228), .Y(n664) );
endmodule


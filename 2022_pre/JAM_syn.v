/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : Q-2019.12
// Date      : Wed Mar 30 13:59:28 2022
/////////////////////////////////////////////////////////////


module JAM_DW01_add_0 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3;
  wire   [9:1] carry;

  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFHX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFHX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFHX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFHX4 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFHX4 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  CLKAND2X3 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XNOR2X4 U2 ( .A(A[9]), .B(n3), .Y(SUM[9]) );
  AND2X2 U3 ( .A(A[7]), .B(carry[7]), .Y(n2) );
  XOR2XL U4 ( .A(A[7]), .B(carry[7]), .Y(SUM[7]) );
  XOR2XL U5 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
  NAND2X1 U6 ( .A(A[8]), .B(n2), .Y(n3) );
  XOR2X1 U7 ( .A(A[8]), .B(n2), .Y(SUM[8]) );
endmodule


module JAM ( CLK, RST, W, J, Cost, MatchCount, MinCost, Valid );
  output [2:0] W;
  output [2:0] J;
  input [6:0] Cost;
  output [3:0] MatchCount;
  output [9:0] MinCost;
  input CLK, RST;
  output Valid;
  wire   N81, N82, N83, N94, N95, N96, n757, n758, n759, n760, n761, n762,
         n763, \a_reverse[0][2] , \a_reverse[0][1] , \a_reverse[0][0] ,
         \a_reverse[1][2] , \a_reverse[1][1] , \a_reverse[1][0] ,
         \a_reverse[2][2] , \a_reverse[2][1] , \a_reverse[2][0] ,
         \a_reverse[3][2] , \a_reverse[3][1] , \a_reverse[3][0] ,
         \a_reverse[4][1] , \a_reverse[4][0] , \a_reverse[5][2] ,
         \a_reverse[5][1] , \a_reverse[5][0] , \a_reverse[6][1] ,
         \a_reverse[6][0] , \a_reverse[7][2] , \a_reverse[7][1] ,
         \a_reverse[7][0] , N242, N243, N244, N274, N275, N276, N285, N286,
         N287, N357, N361, N362, N363, N396, N397, N398, N399, N400, N401,
         N402, N403, N404, N420, N421, N422, N423, n107, n108, n109, n110,
         n111, n112, n113, n117, n118, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n141, n142, n154, n155, n156, n157, n159, n160,
         n161, n163, n164, n166, n167, n168, n169, n170, n171, n172, n175,
         n176, n177, n178, n180, n184, n186, n187, n188, n189, n190, n192,
         n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205,
         n206, n207, n208, n210, n212, n213, n214, n215, n217, n220, n222,
         n223, n227, n228, n230, n232, n234, n238, n239, n240, n241, n242,
         n243, n244, n245, n246, n247, n248, n250, n251, n252, n253, n254,
         n255, n256, n257, n258, n259, n260, n261, n262, n265, n266, n267,
         n268, n270, n271, n272, n273, n274, n276, n277, n278, n279, n280,
         n281, n282, n283, n286, n287, n289, n294, n296, n297, n298, n299,
         n300, n301, n302, n303, n304, n305, n307, n309, n310, n311, n312,
         n314, n315, n316, n317, n319, n320, n321, n322, n323, n324, n325,
         n326, n327, n328, n329, n331, n332, n333, n334, n335, n336, n337,
         n338, n339, n340, n341, n342, n345, n346, n347, n348, n349, n350,
         n351, n352, n353, n356, n357, n359, n360, n361, n364, n365, n366,
         n369, n370, n371, n374, n375, n376, n378, n379, n380, n381, n382,
         n383, n384, n385, n386, n387, n388, n389, n390, n391, n392, n393,
         n394, n395, n396, n397, n398, n399, n400, n401, n402, n403, n404,
         n405, n406, n407, n408, n410, n411, n412, n413, n414, n415, n416,
         n417, n418, n419, n420, n421, n422, n423, n424, n426, n427, n428,
         n429, n431, n432, n433, n434, n435, n436, n437, n438, n439, n440,
         n441, n442, n443, n444, n445, n446, n447, n448, n449, n450, n451,
         n452, n453, n454, n455, n456, n457, n458, n459, n460, n461, n462,
         n463, n464, n465, n466, n467, n468, n469, n470, n471, n472, n473,
         n474, n475, n476, n477, n478, n479, n480, n481, n482, n483, n484,
         n485, n486, n487, n488, n489, n490, n491, n492, n493, n494, N504,
         N503, N502, N501, n578, n579, n580, n581, n582, n584, n586, n588,
         n591, n592, n593, n594, n595, n596, n597, n598, n599, n615, n616,
         n617, n618, n619, n620, n621, n622, n623, n624, n625, n626, n627,
         n628, n629, n630, n631, n632, n633, n634, n635, n636, n637, n638,
         n639, n640, n641, n642, n643, n644, n645, n646, n647, n648, n649,
         n650, n651, n652, n653, n654, n655, n656, n657, n658, n659, n660,
         n661, n662, n663, n664, n665, n666, n667, n668, n669, n670, n671,
         n672, n673, n674, n675, n676, n677, n678, n679, n680, n681, n682,
         n683, n684, n685, n686, n687, n688, n689, n690, n691, n692, n693,
         n694, n695, n696, n697, n698, n699, n700, n701, n702, n703, n704,
         n705, n706, n707, n708, n709, n710, n711, n712, n713, n714, n715,
         n716, n717, n718, n719, n720, n721, n722, n723, n724, n725, n726,
         n727, n728, n729, n730, n731, n732, n733, n734, n735, n736, n737,
         n738, n739, n740, n741, n742, n743, n744, n745, n746, n747, n748,
         n749, n750, n751, n752, n753, n755, n756;
  wire   [9:0] cost_all;
  wire   [9:0] cost_plus_Cost;
  wire   [3:0] state;
  wire   [2:0] swap_reg;

  DFFRX4 \MatchCount_reg[1]  ( .D(n447), .CK(CLK), .RN(n659), .Q(n616) );
  DFFRX4 \MatchCount_reg[2]  ( .D(n448), .CK(CLK), .RN(n659), .Q(n615) );
  DFFRX4 \MatchCount_reg[0]  ( .D(n450), .CK(CLK), .RN(n659), .Q(n617) );
  AOI211X2 U105 ( .A0(n184), .A1(n208), .B0(n721), .C0(n198), .Y(n195) );
  AOI211X2 U151 ( .A0(n728), .A1(n259), .B0(n261), .C0(n262), .Y(n256) );
  AOI2BB2X4 U220 ( .B0(n698), .B1(n298), .A0N(n299), .A1N(n698), .Y(n234) );
  JAM_DW01_add_0 add_25 ( .A(cost_all), .B({1'b0, 1'b0, 1'b0, Cost}), .CI(1'b0), .SUM(cost_plus_Cost) );
  DFFRX1 \cost_all_reg[9]  ( .D(n461), .CK(CLK), .RN(n659), .Q(cost_all[9]), 
        .QN(n396) );
  DFFRX1 \cost_all_reg[6]  ( .D(n464), .CK(CLK), .RN(n658), .Q(cost_all[6]), 
        .QN(n393) );
  DFFRX1 \cost_all_reg[7]  ( .D(n463), .CK(CLK), .RN(n658), .Q(cost_all[7]), 
        .QN(n394) );
  DFFRX1 \cost_all_reg[8]  ( .D(n462), .CK(CLK), .RN(n658), .Q(cost_all[8]), 
        .QN(n395) );
  DFFRX1 \cost_all_reg[1]  ( .D(n469), .CK(CLK), .RN(n658), .Q(cost_all[1]), 
        .QN(n388) );
  DFFRX1 \cost_all_reg[2]  ( .D(n468), .CK(CLK), .RN(n658), .Q(cost_all[2]), 
        .QN(n389) );
  DFFRX1 \cost_all_reg[3]  ( .D(n467), .CK(CLK), .RN(n658), .Q(cost_all[3]), 
        .QN(n390) );
  DFFRX1 \cost_all_reg[4]  ( .D(n466), .CK(CLK), .RN(n658), .Q(cost_all[4]), 
        .QN(n391) );
  DFFRX1 \cost_all_reg[5]  ( .D(n465), .CK(CLK), .RN(n658), .Q(cost_all[5]), 
        .QN(n392) );
  DFFRX1 \cost_all_reg[0]  ( .D(n470), .CK(CLK), .RN(n658), .Q(cost_all[0]), 
        .QN(n387) );
  DFFSX1 \a_reg[5][0]  ( .D(n485), .CK(CLK), .SN(n658), .Q(\a_reverse[2][0] ), 
        .QN(n433) );
  DFFRX2 \a_reg[4][1]  ( .D(n483), .CK(CLK), .RN(n717), .Q(\a_reverse[3][1] ), 
        .QN(n429) );
  DFFSX2 \a_reg[6][1]  ( .D(n489), .CK(CLK), .SN(n658), .Q(\a_reverse[1][1] ), 
        .QN(n435) );
  DFFRX2 \a_reg[5][1]  ( .D(n486), .CK(CLK), .RN(n658), .Q(\a_reverse[2][1] ), 
        .QN(n432) );
  DFFRX2 \a_reg[1][1]  ( .D(n475), .CK(CLK), .RN(n660), .Q(\a_reverse[6][1] ), 
        .QN(n420) );
  DFFRX1 \a_reg[0][0]  ( .D(n471), .CK(CLK), .RN(n717), .Q(\a_reverse[7][0] ), 
        .QN(n418) );
  DFFRX1 \a_reg[0][1]  ( .D(n472), .CK(CLK), .RN(n659), .Q(\a_reverse[7][1] ), 
        .QN(n417) );
  DFFSX4 \a_reg[5][2]  ( .D(n487), .CK(CLK), .SN(n660), .Q(\a_reverse[2][2] ), 
        .QN(n431) );
  DFFRX2 \a_reg[6][0]  ( .D(n488), .CK(CLK), .RN(n717), .Q(\a_reverse[1][0] ), 
        .QN(n436) );
  DFFSX2 \a_reg[3][0]  ( .D(n479), .CK(CLK), .SN(n717), .Q(\a_reverse[4][0] ), 
        .QN(n427) );
  DFFRX1 \a_reg[0][2]  ( .D(n473), .CK(CLK), .RN(n658), .Q(\a_reverse[7][2] ), 
        .QN(n416) );
  DFFSX2 \a_reg[4][2]  ( .D(n484), .CK(CLK), .SN(n660), .Q(\a_reverse[3][2] ), 
        .QN(n428) );
  DFFRX1 \J_reg[0]  ( .D(n441), .CK(CLK), .RN(n659), .Q(n762), .QN(n406) );
  DFFRX1 \J_reg[2]  ( .D(n443), .CK(CLK), .RN(n659), .Q(n760), .QN(n404) );
  DFFRX1 \W_reg[0]  ( .D(n444), .CK(CLK), .RN(n659), .Q(n759), .QN(n403) );
  DFFRX1 \W_reg[1]  ( .D(n445), .CK(CLK), .RN(n659), .Q(n758), .QN(n402) );
  DFFRX1 \W_reg[2]  ( .D(n446), .CK(CLK), .RN(n659), .Q(n757), .QN(n401) );
  DFFRX1 Valid_reg ( .D(n408), .CK(CLK), .RN(n660), .Q(n763), .QN(n407) );
  DFFRX1 \J_reg[1]  ( .D(n442), .CK(CLK), .RN(n659), .Q(n761), .QN(n405) );
  DFFRX1 \state_reg[2]  ( .D(N422), .CK(CLK), .RN(n717), .Q(state[2]), .QN(
        n731) );
  DFFRX1 \state_reg[1]  ( .D(N421), .CK(CLK), .RN(n717), .Q(state[1]), .QN(
        n732) );
  DFFRX1 \state_reg[3]  ( .D(N423), .CK(CLK), .RN(n717), .Q(state[3]), .QN(
        n726) );
  DFFRX1 \state_reg[0]  ( .D(N420), .CK(CLK), .RN(n717), .Q(state[0]), .QN(
        n734) );
  DFFRX4 \a_reg[2][2]  ( .D(n478), .CK(CLK), .RN(n717), .Q(\a_reverse[5][2] ), 
        .QN(n422) );
  DFFRX2 \MatchCount_reg[3]  ( .D(n449), .CK(CLK), .RN(n659), .QN(n581) );
  EDFFX4 \swap_reg_reg[0]  ( .D(N81), .E(n440), .CK(CLK), .Q(swap_reg[0]), 
        .QN(n744) );
  DFFSX1 \MinCost_reg[9]  ( .D(n459), .CK(CLK), .SN(n717), .QN(n410) );
  EDFFX2 \swap_reg_reg[1]  ( .D(N82), .E(n440), .CK(CLK), .Q(swap_reg[1]), 
        .QN(n749) );
  EDFFX2 \swap_reg_reg[2]  ( .D(N83), .E(n440), .CK(CLK), .Q(swap_reg[2]), 
        .QN(n647) );
  DFFSX2 \a_reg[7][1]  ( .D(n492), .CK(CLK), .SN(n660), .Q(\a_reverse[0][1] ), 
        .QN(n438) );
  DFFSX1 \a_reg[7][0]  ( .D(n491), .CK(CLK), .SN(n659), .Q(\a_reverse[0][0] ), 
        .QN(n439) );
  DFFSX1 \a_reg[1][0]  ( .D(n474), .CK(CLK), .SN(n660), .Q(\a_reverse[6][0] ), 
        .QN(n421) );
  DFFSX2 \a_reg[2][1]  ( .D(n477), .CK(CLK), .SN(n658), .Q(\a_reverse[5][1] ), 
        .QN(n423) );
  DFFRX1 \a_reg[4][0]  ( .D(n482), .CK(CLK), .RN(n658), .Q(\a_reverse[3][0] ), 
        .QN(n646) );
  DFFSX2 \a_reg[7][2]  ( .D(n493), .CK(CLK), .SN(n660), .Q(\a_reverse[0][2] ), 
        .QN(n437) );
  DFFRX2 \a_reg[3][2]  ( .D(n481), .CK(CLK), .RN(n658), .Q(n592), .QN(n582) );
  DFFRX2 \a_reg[2][0]  ( .D(n476), .CK(CLK), .RN(n717), .Q(\a_reverse[5][0] ), 
        .QN(n424) );
  DFFSX2 \a_reg[3][1]  ( .D(n480), .CK(CLK), .SN(n659), .Q(\a_reverse[4][1] ), 
        .QN(n426) );
  DFFRX2 \a_reg[1][2]  ( .D(n494), .CK(CLK), .RN(n717), .Q(n746), .QN(n419) );
  DFFSX1 \MinCost_reg[7]  ( .D(n457), .CK(CLK), .SN(n660), .QN(n398) );
  DFFSX1 \MinCost_reg[4]  ( .D(n454), .CK(CLK), .SN(n660), .QN(n413) );
  DFFSX1 \MinCost_reg[6]  ( .D(n456), .CK(CLK), .SN(n660), .QN(n412) );
  DFFSX1 \MinCost_reg[5]  ( .D(n455), .CK(CLK), .SN(n660), .QN(n399) );
  DFFSX1 \MinCost_reg[3]  ( .D(n453), .CK(CLK), .SN(n660), .QN(n414) );
  DFFSX1 \MinCost_reg[1]  ( .D(n451), .CK(CLK), .SN(n660), .QN(n400) );
  DFFSX1 \MinCost_reg[8]  ( .D(n458), .CK(CLK), .SN(n660), .QN(n411) );
  DFFSX1 \MinCost_reg[0]  ( .D(n460), .CK(CLK), .SN(n660), .QN(n397) );
  DFFSX1 \MinCost_reg[2]  ( .D(n452), .CK(CLK), .SN(n660), .QN(n415) );
  DFFSX4 \a_reg[6][2]  ( .D(n490), .CK(CLK), .SN(n659), .Q(\a_reverse[1][2] ), 
        .QN(n434) );
  CLKINVX6 U436 ( .A(n141), .Y(N357) );
  OAI22X2 U437 ( .A0(n677), .A1(n668), .B0(n653), .B1(n667), .Y(N286) );
  INVX20 U438 ( .A(n654), .Y(n698) );
  NAND2X1 U439 ( .A(N285), .B(n419), .Y(n307) );
  OAI211X4 U440 ( .A0(n416), .A1(n746), .B0(n365), .C0(n366), .Y(n359) );
  NOR2X1 U441 ( .A(n432), .B(n652), .Y(n326) );
  AOI32X4 U442 ( .A0(cost_plus_Cost[2]), .A1(n712), .A2(n415), .B0(n414), .B1(
        cost_plus_Cost[3]), .Y(n170) );
  INVX4 U443 ( .A(n168), .Y(n712) );
  OAI21X2 U444 ( .A0(n422), .A1(N285), .B0(n310), .Y(n309) );
  OAI22X1 U445 ( .A0(n311), .A1(n312), .B0(\a_reverse[5][2] ), .B1(n626), .Y(
        n310) );
  AOI221X2 U446 ( .A0(\a_reverse[5][2] ), .A1(n693), .B0(n592), .B1(n692), 
        .C0(n691), .Y(n694) );
  AOI221X1 U447 ( .A0(\a_reverse[1][2] ), .A1(n693), .B0(\a_reverse[0][2] ), 
        .B1(n692), .C0(n688), .Y(n695) );
  BUFX6 U448 ( .A(N274), .Y(n597) );
  OAI222X1 U449 ( .A0(n222), .A1(n213), .B0(n223), .B1(n215), .C0(n426), .C1(
        n719), .Y(n480) );
  BUFX12 U450 ( .A(n673), .Y(n578) );
  NOR2X1 U451 ( .A(n742), .B(n678), .Y(n673) );
  OAI221X4 U452 ( .A0(n626), .A1(n265), .B0(n737), .B1(n266), .C0(n271), .Y(
        n490) );
  OAI21X1 U453 ( .A0(n434), .A1(N285), .B0(n335), .Y(n331) );
  INVX4 U454 ( .A(n234), .Y(N94) );
  CLKBUFX3 U455 ( .A(N83), .Y(n653) );
  NAND2XL U456 ( .A(n742), .B(n743), .Y(n287) );
  NAND2X2 U457 ( .A(n624), .B(n350), .Y(n338) );
  INVX8 U458 ( .A(n626), .Y(N285) );
  BUFX12 U459 ( .A(N287), .Y(n651) );
  AOI221X1 U460 ( .A0(\a_reverse[5][0] ), .A1(n674), .B0(\a_reverse[4][0] ), 
        .B1(n578), .C0(n662), .Y(n663) );
  NAND2X1 U461 ( .A(n697), .B(n698), .Y(n190) );
  NAND2X1 U462 ( .A(n728), .B(n189), .Y(n188) );
  CLKINVX1 U463 ( .A(N501), .Y(n703) );
  AOI211X1 U464 ( .A0(n652), .A1(n435), .B0(n436), .C0(n651), .Y(n336) );
  AOI211X1 U465 ( .A0(n652), .A1(n429), .B0(n646), .C0(n651), .Y(n328) );
  XOR2X4 U466 ( .A(n410), .B(cost_plus_Cost[9]), .Y(n175) );
  BUFX4 U467 ( .A(n689), .Y(n596) );
  BUFX4 U468 ( .A(n690), .Y(n595) );
  INVX3 U469 ( .A(N94), .Y(n696) );
  AND2X4 U470 ( .A(n623), .B(n332), .Y(n300) );
  NAND4X1 U471 ( .A(n741), .B(n298), .C(n303), .D(n302), .Y(n297) );
  OAI31X1 U472 ( .A0(n304), .A1(n421), .A2(n651), .B0(n305), .Y(n303) );
  AO22X1 U473 ( .A0(\a_reverse[6][0] ), .A1(n595), .B0(\a_reverse[7][0] ), 
        .B1(n596), .Y(n681) );
  NAND2X1 U474 ( .A(n431), .B(\a_reverse[1][2] ), .Y(n351) );
  OR2X1 U475 ( .A(n426), .B(\a_reverse[5][1] ), .Y(n622) );
  NAND2X2 U476 ( .A(n419), .B(\a_reverse[5][2] ), .Y(n378) );
  CLKINVX1 U477 ( .A(n417), .Y(n751) );
  AO22X1 U478 ( .A0(n746), .A1(n595), .B0(\a_reverse[7][2] ), .B1(n596), .Y(
        n691) );
  AO22X1 U479 ( .A0(\a_reverse[2][2] ), .A1(n595), .B0(\a_reverse[3][2] ), 
        .B1(n596), .Y(n688) );
  AO22X1 U480 ( .A0(\a_reverse[2][1] ), .A1(n595), .B0(\a_reverse[3][1] ), 
        .B1(n596), .Y(n684) );
  NOR2X4 U481 ( .A(n697), .B(n696), .Y(n692) );
  CLKBUFX3 U482 ( .A(cost_plus_Cost[7]), .Y(n594) );
  INVX1 U483 ( .A(n274), .Y(n722) );
  NAND2X1 U484 ( .A(n272), .B(n591), .Y(n266) );
  OAI211X1 U485 ( .A0(n655), .A1(n243), .B0(n250), .C0(n251), .Y(n242) );
  NAND2X1 U486 ( .A(n728), .B(n242), .Y(n241) );
  CLKINVX1 U487 ( .A(n433), .Y(n753) );
  INVX3 U488 ( .A(n599), .Y(n735) );
  AOI2BB2X1 U489 ( .B0(n217), .B1(N285), .A0N(n217), .A1N(n737), .Y(n228) );
  OAI222XL U490 ( .A0(n439), .A1(n186), .B0(n187), .B1(n188), .C0(n421), .C1(
        n189), .Y(n474) );
  AND2X4 U491 ( .A(n340), .B(n347), .Y(N81) );
  OAI22XL U492 ( .A0(n422), .A1(n720), .B0(n195), .B1(n204), .Y(n478) );
  XNOR2X1 U493 ( .A(N502), .B(n703), .Y(N361) );
  BUFX4 U494 ( .A(n142), .Y(n579) );
  BUFX4 U495 ( .A(n142), .Y(n580) );
  AND2X2 U496 ( .A(MatchCount[2]), .B(N357), .Y(N503) );
  OAI21X1 U497 ( .A0(n582), .A1(N285), .B0(n315), .Y(n314) );
  OAI22X1 U498 ( .A0(n316), .A1(n317), .B0(n592), .B1(n626), .Y(n315) );
  OAI22X1 U499 ( .A0(n333), .A1(n334), .B0(\a_reverse[0][2] ), .B1(n626), .Y(
        n332) );
  NOR2X1 U500 ( .A(n438), .B(n652), .Y(n334) );
  INVX3 U501 ( .A(N95), .Y(n697) );
  AOI221X1 U502 ( .A0(\a_reverse[1][0] ), .A1(n674), .B0(\a_reverse[0][0] ), 
        .B1(n578), .C0(n661), .Y(n664) );
  NOR3X2 U503 ( .A(swap_reg[1]), .B(swap_reg[2]), .C(swap_reg[0]), .Y(n207) );
  OAI221X1 U504 ( .A0(n108), .A1(n729), .B0(n655), .B1(n591), .C0(n276), .Y(
        n274) );
  NAND2XL U505 ( .A(n206), .B(n655), .Y(n201) );
  BUFX4 U506 ( .A(n109), .Y(n655) );
  NOR3X2 U507 ( .A(swap_reg[1]), .B(swap_reg[2]), .C(n744), .Y(n206) );
  NAND2XL U508 ( .A(swap_reg[1]), .B(swap_reg[2]), .Y(n641) );
  INVX3 U509 ( .A(RST), .Y(n717) );
  INVX12 U510 ( .A(n410), .Y(MinCost[9]) );
  NOR3XL U511 ( .A(swap_reg[0]), .B(swap_reg[1]), .C(n656), .Y(n261) );
  CLKINVX1 U512 ( .A(n615), .Y(n584) );
  INVX16 U513 ( .A(n584), .Y(MatchCount[2]) );
  CLKINVX1 U514 ( .A(n617), .Y(n586) );
  INVX16 U515 ( .A(n586), .Y(MatchCount[0]) );
  CLKINVX1 U516 ( .A(n616), .Y(n588) );
  INVX16 U517 ( .A(n588), .Y(MatchCount[1]) );
  INVX16 U518 ( .A(n581), .Y(MatchCount[3]) );
  OAI222X1 U519 ( .A0(n212), .A1(n213), .B0(n214), .B1(n215), .C0(n427), .C1(
        n719), .Y(n479) );
  AOI2BB2X1 U520 ( .B0(n217), .B1(n651), .A0N(n217), .A1N(n735), .Y(n214) );
  AOI211X4 U521 ( .A0(n652), .A1(n438), .B0(n439), .C0(n651), .Y(n333) );
  CLKBUFX3 U522 ( .A(n273), .Y(n591) );
  NAND2BX1 U523 ( .AN(n591), .B(n272), .Y(n265) );
  AO22X2 U524 ( .A0(N363), .A1(n593), .B0(MatchCount[3]), .B1(n702), .Y(n449)
         );
  INVX3 U525 ( .A(n593), .Y(n702) );
  AOI32X4 U526 ( .A0(cost_plus_Cost[8]), .A1(n175), .A2(n411), .B0(n410), .B1(
        cost_plus_Cost[9]), .Y(n159) );
  NAND2X6 U527 ( .A(n163), .B(n175), .Y(n383) );
  AOI2BB2X4 U528 ( .B0(n319), .B1(n296), .A0N(n320), .A1N(n296), .Y(n299) );
  NOR3BX4 U529 ( .AN(n322), .B(n321), .C(n653), .Y(n320) );
  OAI211X1 U530 ( .A0(n357), .A1(n752), .B0(n341), .C0(n345), .Y(n348) );
  NAND2X2 U531 ( .A(n618), .B(n376), .Y(n357) );
  BUFX16 U532 ( .A(n139), .Y(n593) );
  OAI21X4 U533 ( .A0(n655), .A1(n141), .B0(n579), .Y(n139) );
  OAI221X4 U534 ( .A0(n421), .A1(\a_reverse[7][0] ), .B0(n420), .B1(n751), 
        .C0(n369), .Y(n366) );
  OAI211X2 U535 ( .A0(n422), .A1(n592), .B0(n370), .C0(n371), .Y(n346) );
  NAND2X6 U536 ( .A(n422), .B(n592), .Y(n374) );
  NAND4BX4 U537 ( .AN(n381), .B(n176), .C(n172), .D(n382), .Y(n141) );
  NOR4X2 U538 ( .A(n157), .B(n383), .C(n384), .D(n168), .Y(n382) );
  AOI221X2 U539 ( .A0(\a_reverse[1][1] ), .A1(n693), .B0(\a_reverse[0][1] ), 
        .B1(n692), .C0(n684), .Y(n687) );
  AOI221X2 U540 ( .A0(\a_reverse[1][0] ), .A1(n693), .B0(\a_reverse[0][0] ), 
        .B1(n692), .C0(n680), .Y(n683) );
  AOI221X2 U541 ( .A0(\a_reverse[5][0] ), .A1(n693), .B0(\a_reverse[4][0] ), 
        .B1(n692), .C0(n681), .Y(n682) );
  AOI221X2 U542 ( .A0(\a_reverse[5][1] ), .A1(n693), .B0(\a_reverse[4][1] ), 
        .B1(n692), .C0(n685), .Y(n686) );
  NOR2X4 U543 ( .A(n697), .B(N94), .Y(n693) );
  OAI22X1 U544 ( .A0(n328), .A1(n329), .B0(\a_reverse[3][2] ), .B1(n626), .Y(
        n327) );
  AND2X4 U545 ( .A(n323), .B(n108), .Y(n321) );
  OAI21X1 U546 ( .A0(n431), .A1(N285), .B0(n324), .Y(n323) );
  NOR2BX2 U547 ( .AN(N503), .B(n756), .Y(n755) );
  XNOR2X1 U548 ( .A(N503), .B(n756), .Y(N362) );
  OAI22X1 U549 ( .A0(n336), .A1(n337), .B0(\a_reverse[1][2] ), .B1(n626), .Y(
        n335) );
  NAND3X2 U550 ( .A(n298), .B(n302), .C(n297), .Y(n301) );
  NAND3X2 U551 ( .A(n302), .B(n309), .C(n741), .Y(n298) );
  NAND2X2 U552 ( .A(n314), .B(n743), .Y(n302) );
  AND2X1 U553 ( .A(MatchCount[0]), .B(N357), .Y(N501) );
  NAND2X2 U554 ( .A(N502), .B(N501), .Y(n756) );
  AND2X1 U555 ( .A(MatchCount[1]), .B(N357), .Y(N502) );
  AOI221X2 U556 ( .A0(n172), .A1(n397), .B0(n400), .B1(cost_plus_Cost[1]), 
        .C0(n711), .Y(n171) );
  INVX3 U557 ( .A(n170), .Y(n711) );
  OAI22X1 U558 ( .A0(n325), .A1(n326), .B0(\a_reverse[2][2] ), .B1(n626), .Y(
        n324) );
  AOI211X4 U559 ( .A0(n652), .A1(n432), .B0(n433), .C0(n651), .Y(n325) );
  NOR2X1 U560 ( .A(n696), .B(N95), .Y(n690) );
  NOR2X1 U561 ( .A(N94), .B(N95), .Y(n689) );
  AOI221X2 U562 ( .A0(\a_reverse[1][1] ), .A1(n674), .B0(\a_reverse[0][1] ), 
        .B1(n578), .C0(n665), .Y(n668) );
  AOI221X2 U563 ( .A0(\a_reverse[5][1] ), .A1(n674), .B0(\a_reverse[4][1] ), 
        .B1(n578), .C0(n666), .Y(n667) );
  AOI221X2 U564 ( .A0(\a_reverse[5][2] ), .A1(n674), .B0(n592), .B1(n578), 
        .C0(n672), .Y(n675) );
  AOI221X2 U565 ( .A0(\a_reverse[1][2] ), .A1(n674), .B0(\a_reverse[0][2] ), 
        .B1(n578), .C0(n669), .Y(n676) );
  AOI2BB2X1 U566 ( .B0(n598), .B1(n243), .A0N(n740), .A1N(n243), .Y(n246) );
  AOI2BB2X1 U567 ( .B0(n599), .B1(n243), .A0N(n739), .A1N(n243), .Y(n240) );
  NAND2X6 U568 ( .A(n234), .B(n697), .Y(n243) );
  AO22X1 U569 ( .A0(n746), .A1(n671), .B0(\a_reverse[7][2] ), .B1(n670), .Y(
        n672) );
  BUFX12 U570 ( .A(N286), .Y(n652) );
  OAI22X2 U571 ( .A0(n677), .A1(n664), .B0(n653), .B1(n663), .Y(N287) );
  OAI22XL U572 ( .A0(n695), .A1(n698), .B0(n654), .B1(n694), .Y(N274) );
  BUFX6 U573 ( .A(N275), .Y(n598) );
  OAI22XL U574 ( .A0(n698), .A1(n687), .B0(n654), .B1(n686), .Y(N275) );
  BUFX6 U575 ( .A(N276), .Y(n599) );
  OAI22XL U576 ( .A0(n698), .A1(n683), .B0(n654), .B1(n682), .Y(N276) );
  INVX4 U577 ( .A(n230), .Y(n719) );
  AOI221X2 U578 ( .A0(n728), .A1(n217), .B0(n723), .B1(n220), .C0(n232), .Y(
        n230) );
  AO22X2 U579 ( .A0(\a_reverse[6][1] ), .A1(n595), .B0(\a_reverse[7][1] ), 
        .B1(n596), .Y(n685) );
  BUFX12 U580 ( .A(n761), .Y(J[1]) );
  BUFX12 U581 ( .A(n763), .Y(Valid) );
  BUFX12 U582 ( .A(n757), .Y(W[2]) );
  BUFX12 U583 ( .A(n758), .Y(W[1]) );
  BUFX12 U584 ( .A(n759), .Y(W[0]) );
  BUFX12 U585 ( .A(n760), .Y(J[2]) );
  BUFX12 U586 ( .A(n762), .Y(J[0]) );
  INVX12 U587 ( .A(n415), .Y(MinCost[2]) );
  INVX12 U588 ( .A(n397), .Y(MinCost[0]) );
  INVX12 U589 ( .A(n411), .Y(MinCost[8]) );
  INVX12 U590 ( .A(n400), .Y(MinCost[1]) );
  INVX12 U591 ( .A(n414), .Y(MinCost[3]) );
  INVX12 U592 ( .A(n399), .Y(MinCost[5]) );
  INVX12 U593 ( .A(n412), .Y(MinCost[6]) );
  INVX12 U594 ( .A(n413), .Y(MinCost[4]) );
  INVX16 U595 ( .A(n398), .Y(MinCost[7]) );
  OAI31X1 U596 ( .A0(state[2]), .A1(state[0]), .A2(state[1]), .B0(state[3]), 
        .Y(n699) );
  AND2XL U597 ( .A(N357), .B(MatchCount[3]), .Y(N504) );
  OAI222X1 U598 ( .A0(n227), .A1(n213), .B0(n228), .B1(n215), .C0(n582), .C1(
        n719), .Y(n481) );
  NAND3X1 U599 ( .A(n621), .B(n622), .C(n374), .Y(n371) );
  OR2X1 U600 ( .A(n427), .B(\a_reverse[5][0] ), .Y(n621) );
  CLKXOR2X2 U601 ( .A(n414), .B(n713), .Y(n168) );
  NAND2BX1 U602 ( .AN(N81), .B(n742), .Y(n625) );
  INVX4 U603 ( .A(n625), .Y(n670) );
  AND3XL U604 ( .A(n345), .B(n341), .C(n346), .Y(n342) );
  CLKINVX1 U605 ( .A(n339), .Y(n748) );
  BUFX12 U606 ( .A(N96), .Y(n654) );
  AO21X2 U607 ( .A0(n348), .A1(n339), .B0(n750), .Y(n347) );
  NAND2XL U608 ( .A(n428), .B(\a_reverse[2][2] ), .Y(n356) );
  OA21XL U609 ( .A0(n419), .A1(\a_reverse[5][2] ), .B0(n375), .Y(n618) );
  OR2X2 U610 ( .A(n424), .B(\a_reverse[6][0] ), .Y(n619) );
  OR2XL U611 ( .A(n423), .B(n747), .Y(n620) );
  NAND3X2 U612 ( .A(n619), .B(n620), .C(n378), .Y(n376) );
  INVX2 U613 ( .A(n420), .Y(n747) );
  CLKINVX1 U614 ( .A(n346), .Y(n752) );
  OAI222X1 U615 ( .A0(n438), .A1(\a_reverse[1][1] ), .B0(n439), .B1(
        \a_reverse[1][0] ), .C0(n437), .C1(\a_reverse[1][2] ), .Y(n379) );
  OAI211X1 U616 ( .A0(n437), .A1(\a_reverse[1][2] ), .B0(\a_reverse[1][1] ), 
        .C0(n438), .Y(n380) );
  OR2XL U617 ( .A(n437), .B(N285), .Y(n623) );
  NAND4BX2 U618 ( .AN(n299), .B(n300), .C(n301), .D(n296), .Y(N96) );
  INVX2 U619 ( .A(n597), .Y(n737) );
  INVX4 U620 ( .A(n598), .Y(n736) );
  OAI221X2 U621 ( .A0(n156), .A1(n157), .B0(MinCost[7]), .B1(n705), .C0(n159), 
        .Y(n155) );
  NOR2XL U622 ( .A(n429), .B(n652), .Y(n329) );
  NAND4X4 U623 ( .A(n359), .B(n345), .C(n357), .D(n346), .Y(n341) );
  OAI221X1 U624 ( .A0(n436), .A1(n753), .B0(n435), .B1(\a_reverse[2][1] ), 
        .C0(n351), .Y(n350) );
  OA21X2 U625 ( .A0(n431), .A1(\a_reverse[1][2] ), .B0(n349), .Y(n624) );
  OAI211X2 U626 ( .A0(n582), .A1(\a_reverse[3][2] ), .B0(n360), .C0(n361), .Y(
        n345) );
  NAND2X4 U627 ( .A(n582), .B(\a_reverse[3][2] ), .Y(n364) );
  NOR2X4 U628 ( .A(n678), .B(n679), .Y(n671) );
  NAND2X1 U629 ( .A(n728), .B(n719), .Y(n215) );
  INVX12 U630 ( .A(N82), .Y(n742) );
  OAI211X4 U631 ( .A0(n320), .A1(n321), .B0(n319), .C0(n300), .Y(n296) );
  CLKINVX1 U632 ( .A(n338), .Y(n750) );
  AOI211X1 U633 ( .A0(n652), .A1(n426), .B0(n427), .C0(n651), .Y(n316) );
  AOI2BB2XL U634 ( .B0(n217), .B1(n652), .A0N(n217), .A1N(n736), .Y(n223) );
  NAND3X2 U635 ( .A(n364), .B(\a_reverse[4][1] ), .C(n429), .Y(n360) );
  AOI22X1 U636 ( .A0(n160), .A1(n161), .B0(cost_plus_Cost[6]), .B1(n412), .Y(
        n156) );
  XOR2X1 U637 ( .A(n415), .B(n714), .Y(n169) );
  AND2XL U638 ( .A(n734), .B(n699), .Y(N420) );
  NAND3X2 U639 ( .A(n351), .B(\a_reverse[2][1] ), .C(n435), .Y(n349) );
  NOR2XL U640 ( .A(n742), .B(n653), .Y(n208) );
  NAND3XL U641 ( .A(n654), .B(n234), .C(N95), .Y(n273) );
  NAND2BXL U642 ( .AN(n259), .B(n260), .Y(n253) );
  NAND2XL U643 ( .A(n260), .B(n259), .Y(n252) );
  INVXL U644 ( .A(n234), .Y(n738) );
  NAND3XL U645 ( .A(n653), .B(n742), .C(n184), .Y(n250) );
  INVX1 U646 ( .A(n652), .Y(n740) );
  NAND4XL U647 ( .A(n338), .B(n339), .C(n340), .D(n341), .Y(N83) );
  NOR2X2 U648 ( .A(n655), .B(n256), .Y(n260) );
  AO21X4 U649 ( .A0(n154), .A1(n155), .B0(n655), .Y(n142) );
  OAI2BB1XL U650 ( .A0N(n175), .A1N(n176), .B0(n159), .Y(n154) );
  INVXL U651 ( .A(cost_plus_Cost[8]), .Y(n704) );
  INVXL U652 ( .A(cost_plus_Cost[9]), .Y(n700) );
  INVX1 U653 ( .A(n651), .Y(n739) );
  INVXL U654 ( .A(cost_plus_Cost[4]), .Y(n708) );
  NOR2X1 U655 ( .A(n655), .B(N81), .Y(n184) );
  OAI21XL U656 ( .A0(n206), .A1(n207), .B0(n723), .Y(n210) );
  NAND3X1 U657 ( .A(n734), .B(n732), .C(n294), .Y(n113) );
  OAI221X2 U658 ( .A0(n646), .A1(\a_reverse[4][0] ), .B0(n429), .B1(
        \a_reverse[4][1] ), .C0(n364), .Y(n361) );
  OAI211X4 U659 ( .A0(n428), .A1(\a_reverse[2][2] ), .B0(n352), .C0(n353), .Y(
        n339) );
  NAND3XL U660 ( .A(n356), .B(\a_reverse[3][1] ), .C(n432), .Y(n352) );
  OAI221X1 U661 ( .A0(n433), .A1(\a_reverse[3][0] ), .B0(n432), .B1(
        \a_reverse[3][1] ), .C0(n356), .Y(n353) );
  AOI2BB2XL U662 ( .B0(n597), .B1(n190), .A0N(n626), .A1N(n190), .Y(n286) );
  AOI2BB2XL U663 ( .B0(n599), .B1(n190), .A0N(n190), .A1N(n739), .Y(n187) );
  AOI22XL U664 ( .A0(N400), .A1(n268), .B0(n722), .B1(\a_reverse[1][1] ), .Y(
        n270) );
  AOI22XL U665 ( .A0(N403), .A1(n255), .B0(n256), .B1(\a_reverse[2][1] ), .Y(
        n257) );
  AOI22XL U666 ( .A0(N399), .A1(n268), .B0(n722), .B1(\a_reverse[1][0] ), .Y(
        n267) );
  AOI22XL U667 ( .A0(N404), .A1(n255), .B0(n256), .B1(\a_reverse[2][2] ), .Y(
        n258) );
  AOI22XL U668 ( .A0(N401), .A1(n268), .B0(n722), .B1(\a_reverse[1][2] ), .Y(
        n271) );
  AOI22XL U669 ( .A0(N402), .A1(n255), .B0(n256), .B1(n753), .Y(n254) );
  NAND3XL U670 ( .A(n369), .B(n751), .C(n420), .Y(n365) );
  OA22X4 U671 ( .A0(n676), .A1(n677), .B0(n653), .B1(n675), .Y(n626) );
  AOI32XL U672 ( .A0(n740), .A1(n747), .A2(n307), .B0(n626), .B1(n746), .Y(
        n305) );
  AOI2BB2XL U673 ( .B0(n598), .B1(n190), .A0N(n740), .A1N(n190), .Y(n192) );
  NAND2X2 U674 ( .A(n416), .B(n746), .Y(n369) );
  AOI2BB2XL U675 ( .B0(n597), .B1(n243), .A0N(n626), .A1N(n243), .Y(n248) );
  AOI211XL U676 ( .A0(n652), .A1(n423), .B0(n424), .C0(n651), .Y(n311) );
  AOI22XL U677 ( .A0(n279), .A1(n652), .B0(N397), .B1(n280), .Y(n281) );
  AOI22XL U678 ( .A0(n279), .A1(n651), .B0(N396), .B1(n280), .Y(n278) );
  AOI22XL U679 ( .A0(n279), .A1(N285), .B0(N398), .B1(n280), .Y(n282) );
  AO22X4 U680 ( .A0(n709), .A1(n163), .B0(n399), .B1(cost_plus_Cost[5]), .Y(
        n161) );
  INVX3 U681 ( .A(n164), .Y(n709) );
  AOI32X2 U682 ( .A0(n710), .A1(n166), .A2(n167), .B0(cost_plus_Cost[4]), .B1(
        n413), .Y(n164) );
  NAND4X1 U683 ( .A(state[2]), .B(n734), .C(n732), .D(n726), .Y(n121) );
  NOR2X1 U684 ( .A(state[3]), .B(state[2]), .Y(n294) );
  NOR3X1 U685 ( .A(n744), .B(swap_reg[2]), .C(n749), .Y(n244) );
  NOR3X2 U686 ( .A(swap_reg[0]), .B(swap_reg[2]), .C(n749), .Y(n220) );
  INVXL U687 ( .A(\a_reverse[0][0] ), .Y(n650) );
  INVXL U688 ( .A(\a_reverse[3][2] ), .Y(n645) );
  CLKINVX1 U689 ( .A(n287), .Y(n741) );
  CLKINVX1 U690 ( .A(n742), .Y(n679) );
  CLKINVX1 U691 ( .A(n195), .Y(n720) );
  CLKINVX1 U692 ( .A(n180), .Y(n730) );
  NOR2X2 U693 ( .A(n742), .B(N81), .Y(n674) );
  CLKINVX1 U694 ( .A(N81), .Y(n678) );
  NOR3X1 U695 ( .A(n698), .B(N95), .C(n234), .Y(n259) );
  CLKINVX1 U696 ( .A(n653), .Y(n677) );
  INVX3 U697 ( .A(n579), .Y(n701) );
  CLKINVX1 U698 ( .A(n210), .Y(n721) );
  NOR3X2 U699 ( .A(n697), .B(n654), .C(n234), .Y(n217) );
  NAND2X1 U700 ( .A(N82), .B(n653), .Y(n108) );
  NOR2X1 U701 ( .A(n722), .B(n728), .Y(n268) );
  CLKINVX1 U702 ( .A(n653), .Y(n743) );
  NAND2X1 U703 ( .A(n728), .B(N81), .Y(n107) );
  CLKINVX1 U704 ( .A(n656), .Y(n723) );
  CLKINVX1 U705 ( .A(n138), .Y(n725) );
  NAND2X1 U706 ( .A(n184), .B(n741), .Y(n180) );
  CLKINVX1 U707 ( .A(n632), .Y(n648) );
  CLKINVX1 U708 ( .A(n128), .Y(n727) );
  CLKBUFX3 U709 ( .A(n178), .Y(n657) );
  NAND2X1 U710 ( .A(n177), .B(n656), .Y(n178) );
  AO22X2 U711 ( .A0(n296), .A1(n654), .B0(n698), .B1(n297), .Y(N95) );
  OAI21XL U712 ( .A0(n168), .A1(n169), .B0(n170), .Y(n166) );
  CLKINVX1 U713 ( .A(cost_plus_Cost[3]), .Y(n713) );
  OAI222X4 U714 ( .A0(n655), .A1(n190), .B0(n107), .B1(n287), .C0(n656), .C1(
        n745), .Y(n189) );
  CLKINVX1 U715 ( .A(n207), .Y(n745) );
  XOR2X1 U716 ( .A(MinCost[7]), .B(n594), .Y(n157) );
  NAND2X1 U717 ( .A(n189), .B(n655), .Y(n186) );
  NOR2X1 U718 ( .A(n256), .B(n728), .Y(n255) );
  NAND2X1 U719 ( .A(n655), .B(n242), .Y(n239) );
  CLKINVX1 U720 ( .A(n594), .Y(n705) );
  CLKINVX1 U721 ( .A(cost_plus_Cost[2]), .Y(n714) );
  CLKINVX1 U722 ( .A(n184), .Y(n729) );
  NOR2BX1 U723 ( .AN(n277), .B(n655), .Y(n279) );
  NOR2BX1 U724 ( .AN(n277), .B(n728), .Y(n280) );
  NOR3X1 U725 ( .A(n738), .B(n654), .C(n655), .Y(n198) );
  AOI2BB1X1 U726 ( .A0N(n654), .A1N(n738), .B0(n655), .Y(n197) );
  OAI31XL U727 ( .A0(n742), .A1(n653), .A2(n107), .B0(n210), .Y(n232) );
  NAND2X1 U728 ( .A(n655), .B(n719), .Y(n213) );
  NOR2X1 U729 ( .A(n655), .B(n722), .Y(n272) );
  CLKINVX1 U730 ( .A(cost_plus_Cost[6]), .Y(n706) );
  CLKINVX1 U731 ( .A(cost_plus_Cost[5]), .Y(n707) );
  CLKINVX1 U732 ( .A(cost_plus_Cost[1]), .Y(n715) );
  OAI31X1 U733 ( .A0(n206), .A1(n244), .A2(n220), .B0(n723), .Y(n251) );
  AND4X2 U734 ( .A(n725), .B(n128), .C(n289), .D(n121), .Y(n177) );
  NAND2X1 U735 ( .A(n733), .B(n294), .Y(n128) );
  NAND4X1 U736 ( .A(n126), .B(n117), .C(n111), .D(n120), .Y(n138) );
  CLKBUFX3 U737 ( .A(n127), .Y(n656) );
  NAND3X1 U738 ( .A(n113), .B(n655), .C(n177), .Y(n127) );
  NAND4X1 U739 ( .A(n656), .B(n121), .C(n113), .D(n137), .Y(n110) );
  NOR2X1 U740 ( .A(n727), .B(n138), .Y(n137) );
  CLKINVX1 U741 ( .A(n633), .Y(n649) );
  CLKINVX1 U742 ( .A(n386), .Y(n733) );
  INVX3 U743 ( .A(n655), .Y(n728) );
  XOR2X1 U744 ( .A(n731), .B(n386), .Y(N243) );
  NAND2X1 U745 ( .A(n207), .B(n655), .Y(n200) );
  CLKINVX1 U746 ( .A(n121), .Y(n718) );
  CLKINVX1 U747 ( .A(n120), .Y(n724) );
  CLKBUFX3 U748 ( .A(n717), .Y(n660) );
  CLKBUFX3 U749 ( .A(n717), .Y(n658) );
  CLKBUFX3 U750 ( .A(n717), .Y(n659) );
  OAI211X1 U751 ( .A0(n434), .A1(\a_reverse[0][2] ), .B0(n379), .C0(n380), .Y(
        n340) );
  NAND3X1 U752 ( .A(n378), .B(n747), .C(n423), .Y(n375) );
  AOI222XL U753 ( .A0(n207), .A1(\a_reverse[2][1] ), .B0(n206), .B1(
        \a_reverse[1][1] ), .C0(n220), .C1(\a_reverse[0][1] ), .Y(n222) );
  AOI222XL U754 ( .A0(n207), .A1(n753), .B0(n206), .B1(\a_reverse[1][0] ), 
        .C0(n220), .C1(\a_reverse[0][0] ), .Y(n212) );
  OAI221XL U755 ( .A0(n739), .A1(n252), .B0(n735), .B1(n253), .C0(n254), .Y(
        n485) );
  OAI221XL U756 ( .A0(n739), .A1(n265), .B0(n735), .B1(n266), .C0(n267), .Y(
        n488) );
  OAI221XL U757 ( .A0(n740), .A1(n252), .B0(n736), .B1(n253), .C0(n257), .Y(
        n486) );
  OAI22XL U758 ( .A0(n418), .A1(n730), .B0(n180), .B1(n735), .Y(n471) );
  NAND3BX1 U759 ( .AN(n169), .B(n167), .C(n160), .Y(n381) );
  XOR2X1 U760 ( .A(n716), .B(n397), .Y(n384) );
  OAI21XL U761 ( .A0(n428), .A1(N285), .B0(n327), .Y(n322) );
  OAI21XL U762 ( .A0(n747), .A1(n740), .B0(n307), .Y(n304) );
  NOR2X1 U763 ( .A(n423), .B(n652), .Y(n312) );
  NAND3X1 U764 ( .A(n374), .B(\a_reverse[5][1] ), .C(n426), .Y(n370) );
  NOR2X1 U765 ( .A(n426), .B(n652), .Y(n317) );
  NAND3X1 U766 ( .A(n331), .B(n108), .C(n300), .Y(n319) );
  NOR2X1 U767 ( .A(n435), .B(n652), .Y(n337) );
  XOR2X1 U768 ( .A(N504), .B(n755), .Y(N363) );
  AO22X1 U769 ( .A0(n703), .A1(n593), .B0(MatchCount[0]), .B1(n702), .Y(n450)
         );
  AO22X1 U770 ( .A0(N362), .A1(n593), .B0(MatchCount[2]), .B1(n702), .Y(n448)
         );
  AO22X1 U771 ( .A0(N361), .A1(n593), .B0(MatchCount[1]), .B1(n702), .Y(n447)
         );
  AO22X1 U772 ( .A0(\a_reverse[2][0] ), .A1(n671), .B0(\a_reverse[3][0] ), 
        .B1(n670), .Y(n661) );
  CLKINVX1 U773 ( .A(n171), .Y(n710) );
  AO22X1 U774 ( .A0(\a_reverse[2][2] ), .A1(n671), .B0(\a_reverse[3][2] ), 
        .B1(n670), .Y(n669) );
  AO22X1 U775 ( .A0(\a_reverse[2][1] ), .A1(n671), .B0(\a_reverse[3][1] ), 
        .B1(n670), .Y(n665) );
  OAI31XL U776 ( .A0(n743), .A1(N82), .A2(n107), .B0(n251), .Y(n262) );
  OAI222XL U777 ( .A0(n247), .A1(n239), .B0(n248), .B1(n241), .C0(n428), .C1(
        n242), .Y(n484) );
  AOI222XL U778 ( .A0(n244), .A1(\a_reverse[0][2] ), .B0(n206), .B1(
        \a_reverse[2][2] ), .C0(n220), .C1(\a_reverse[1][2] ), .Y(n247) );
  OAI22XL U779 ( .A0(n423), .A1(n720), .B0(n195), .B1(n202), .Y(n477) );
  AOI221XL U780 ( .A0(n197), .A1(n598), .B0(n198), .B1(n652), .C0(n203), .Y(
        n202) );
  OAI22XL U781 ( .A0(n435), .A1(n200), .B0(n438), .B1(n201), .Y(n203) );
  OAI222XL U782 ( .A0(n438), .A1(n186), .B0(n192), .B1(n188), .C0(n420), .C1(
        n189), .Y(n475) );
  OAI222XL U783 ( .A0(n437), .A1(n186), .B0(n286), .B1(n188), .C0(n419), .C1(
        n189), .Y(n494) );
  OAI222XL U784 ( .A0(n238), .A1(n239), .B0(n240), .B1(n241), .C0(n646), .C1(
        n242), .Y(n482) );
  AOI222XL U785 ( .A0(n244), .A1(\a_reverse[0][0] ), .B0(n206), .B1(n753), 
        .C0(n220), .C1(\a_reverse[1][0] ), .Y(n238) );
  OAI222XL U786 ( .A0(n245), .A1(n239), .B0(n246), .B1(n241), .C0(n429), .C1(
        n242), .Y(n483) );
  AOI222XL U787 ( .A0(n244), .A1(\a_reverse[0][1] ), .B0(n206), .B1(
        \a_reverse[2][1] ), .C0(n220), .C1(\a_reverse[1][1] ), .Y(n245) );
  AOI222XL U788 ( .A0(n207), .A1(\a_reverse[2][2] ), .B0(n206), .B1(
        \a_reverse[1][2] ), .C0(n220), .C1(\a_reverse[0][2] ), .Y(n227) );
  OAI221XL U789 ( .A0(n740), .A1(n265), .B0(n736), .B1(n266), .C0(n270), .Y(
        n489) );
  OAI221XL U790 ( .A0(n626), .A1(n252), .B0(n737), .B1(n253), .C0(n258), .Y(
        n487) );
  XOR2X1 U791 ( .A(n412), .B(cost_plus_Cost[6]), .Y(n160) );
  XOR2X1 U792 ( .A(n411), .B(cost_plus_Cost[8]), .Y(n176) );
  XOR2X1 U793 ( .A(n400), .B(cost_plus_Cost[1]), .Y(n172) );
  XOR2X1 U794 ( .A(n413), .B(cost_plus_Cost[4]), .Y(n167) );
  XOR2X1 U795 ( .A(n399), .B(cost_plus_Cost[5]), .Y(n163) );
  AOI221XL U796 ( .A0(n197), .A1(n597), .B0(n198), .B1(N285), .C0(n205), .Y(
        n204) );
  OAI22XL U797 ( .A0(n434), .A1(n200), .B0(n437), .B1(n201), .Y(n205) );
  OAI22XL U798 ( .A0(n424), .A1(n720), .B0(n195), .B1(n196), .Y(n476) );
  AOI221XL U799 ( .A0(n197), .A1(n599), .B0(n198), .B1(n651), .C0(n199), .Y(
        n196) );
  OAI22XL U800 ( .A0(n436), .A1(n200), .B0(n439), .B1(n201), .Y(n199) );
  OAI22XL U801 ( .A0(n417), .A1(n730), .B0(n180), .B1(n736), .Y(n472) );
  OAI22XL U802 ( .A0(n416), .A1(n730), .B0(n180), .B1(n737), .Y(n473) );
  OAI22XL U803 ( .A0(n398), .A1(n701), .B0(n705), .B1(n580), .Y(n457) );
  OAI22XL U804 ( .A0(n410), .A1(n701), .B0(n700), .B1(n580), .Y(n459) );
  OAI22XL U805 ( .A0(n411), .A1(n701), .B0(n704), .B1(n580), .Y(n458) );
  OAI22XL U806 ( .A0(n397), .A1(n701), .B0(n716), .B1(n580), .Y(n460) );
  OAI22XL U807 ( .A0(n415), .A1(n701), .B0(n714), .B1(n580), .Y(n452) );
  OAI22XL U808 ( .A0(n414), .A1(n701), .B0(n713), .B1(n580), .Y(n453) );
  OAI22XL U809 ( .A0(n412), .A1(n701), .B0(n706), .B1(n580), .Y(n456) );
  OAI22XL U810 ( .A0(n399), .A1(n701), .B0(n707), .B1(n580), .Y(n455) );
  OAI22XL U811 ( .A0(n400), .A1(n701), .B0(n715), .B1(n580), .Y(n451) );
  OAI22XL U812 ( .A0(n413), .A1(n701), .B0(n708), .B1(n580), .Y(n454) );
  OAI211X1 U813 ( .A0(swap_reg[0]), .A1(n656), .B0(n283), .C0(n276), .Y(n277)
         );
  NAND4X1 U814 ( .A(n728), .B(n738), .C(N95), .D(n654), .Y(n283) );
  OAI22XL U815 ( .A0(n177), .A1(n700), .B0(n396), .B1(n657), .Y(n461) );
  OAI22XL U816 ( .A0(n177), .A1(n704), .B0(n395), .B1(n657), .Y(n462) );
  OAI22XL U817 ( .A0(n177), .A1(n705), .B0(n394), .B1(n657), .Y(n463) );
  OAI22XL U818 ( .A0(n177), .A1(n706), .B0(n393), .B1(n657), .Y(n464) );
  OAI21XL U819 ( .A0(n438), .A1(n277), .B0(n281), .Y(n492) );
  OAI21XL U820 ( .A0(n439), .A1(n277), .B0(n278), .Y(n491) );
  OAI21XL U821 ( .A0(n437), .A1(n277), .B0(n282), .Y(n493) );
  CLKINVX1 U822 ( .A(cost_plus_Cost[0]), .Y(n716) );
  OAI22XL U823 ( .A0(n177), .A1(n707), .B0(n392), .B1(n657), .Y(n465) );
  OAI22XL U824 ( .A0(n177), .A1(n708), .B0(n391), .B1(n657), .Y(n466) );
  OAI22XL U825 ( .A0(n177), .A1(n713), .B0(n390), .B1(n657), .Y(n467) );
  OAI22XL U826 ( .A0(n177), .A1(n714), .B0(n389), .B1(n657), .Y(n468) );
  OAI22XL U827 ( .A0(n177), .A1(n715), .B0(n388), .B1(n657), .Y(n469) );
  OAI22XL U828 ( .A0(n177), .A1(n716), .B0(n387), .B1(n657), .Y(n470) );
  NOR2X1 U829 ( .A(RST), .B(n655), .Y(n440) );
  NAND4X1 U830 ( .A(state[1]), .B(state[2]), .C(n734), .D(n726), .Y(n120) );
  NAND4X1 U831 ( .A(state[0]), .B(state[2]), .C(n732), .D(n726), .Y(n117) );
  NAND3X1 U832 ( .A(n294), .B(n734), .C(state[1]), .Y(n111) );
  NAND3X1 U833 ( .A(n294), .B(n732), .C(state[0]), .Y(n126) );
  OA21XL U834 ( .A0(swap_reg[1]), .A1(n656), .B0(n251), .Y(n276) );
  OAI222XL U835 ( .A0(n418), .A1(n656), .B0(n403), .B1(n110), .C0(n646), .C1(
        n128), .Y(n124) );
  OAI222XL U836 ( .A0(n417), .A1(n656), .B0(n402), .B1(n110), .C0(n429), .C1(
        n128), .Y(n131) );
  OAI222XL U837 ( .A0(n416), .A1(n656), .B0(n401), .B1(n110), .C0(n428), .C1(
        n128), .Y(n135) );
  OAI211X1 U838 ( .A0(n406), .A1(n110), .B0(n111), .C0(n112), .Y(n441) );
  NOR3BXL U839 ( .AN(n113), .B(n724), .C(n718), .Y(n112) );
  OAI211X1 U840 ( .A0(n404), .A1(n110), .B0(n117), .C0(n118), .Y(n443) );
  NOR3X1 U841 ( .A(n727), .B(n718), .C(n724), .Y(n118) );
  NAND2X1 U842 ( .A(state[0]), .B(state[1]), .Y(n386) );
  NAND3X1 U843 ( .A(state[2]), .B(n726), .C(n733), .Y(n289) );
  NAND4X1 U844 ( .A(state[3]), .B(n734), .C(n732), .D(n731), .Y(n109) );
  OR4X1 U845 ( .A(n122), .B(n123), .C(n124), .D(n125), .Y(n444) );
  OAI22XL U846 ( .A0(n436), .A1(n117), .B0(n427), .B1(n111), .Y(n122) );
  OAI22XL U847 ( .A0(n421), .A1(n113), .B0(n439), .B1(n120), .Y(n123) );
  OAI22XL U848 ( .A0(n424), .A1(n126), .B0(n433), .B1(n121), .Y(n125) );
  OR4X1 U849 ( .A(n129), .B(n130), .C(n131), .D(n132), .Y(n445) );
  OAI22XL U850 ( .A0(n435), .A1(n117), .B0(n426), .B1(n111), .Y(n129) );
  OAI22XL U851 ( .A0(n420), .A1(n113), .B0(n438), .B1(n120), .Y(n130) );
  OAI22XL U852 ( .A0(n423), .A1(n126), .B0(n432), .B1(n121), .Y(n132) );
  OR4X1 U853 ( .A(n133), .B(n134), .C(n135), .D(n136), .Y(n446) );
  OAI22XL U854 ( .A0(n434), .A1(n117), .B0(n582), .B1(n111), .Y(n133) );
  OAI22XL U855 ( .A0(n419), .A1(n113), .B0(n437), .B1(n120), .Y(n134) );
  OAI22XL U856 ( .A0(n422), .A1(n126), .B0(n431), .B1(n121), .Y(n136) );
  XOR2X1 U857 ( .A(state[1]), .B(state[0]), .Y(N242) );
  NAND2X1 U858 ( .A(n289), .B(n385), .Y(N244) );
  OAI21XL U859 ( .A0(n731), .A1(n386), .B0(state[3]), .Y(n385) );
  OAI21XL U860 ( .A0(n405), .A1(n110), .B0(n725), .Y(n442) );
  OAI21XL U861 ( .A0(n107), .A1(n108), .B0(n407), .Y(n408) );
  NAND2X1 U862 ( .A(swap_reg[0]), .B(swap_reg[1]), .Y(n628) );
  NAND2X1 U863 ( .A(swap_reg[0]), .B(n749), .Y(n627) );
  NAND2X1 U864 ( .A(swap_reg[2]), .B(n749), .Y(n633) );
  NAND2X1 U865 ( .A(n647), .B(n749), .Y(n632) );
  OAI222XL U866 ( .A0(\a_reverse[0][0] ), .A1(n633), .B0(\a_reverse[4][0] ), 
        .B1(n632), .C0(\a_reverse[2][0] ), .C1(n749), .Y(n629) );
  OAI222XL U867 ( .A0(n628), .A1(n436), .B0(n627), .B1(n646), .C0(swap_reg[0]), 
        .C1(n629), .Y(N402) );
  OAI222XL U868 ( .A0(\a_reverse[0][1] ), .A1(n633), .B0(\a_reverse[4][1] ), 
        .B1(n632), .C0(\a_reverse[2][1] ), .C1(n749), .Y(n630) );
  OAI222XL U869 ( .A0(n628), .A1(n435), .B0(n627), .B1(n429), .C0(swap_reg[0]), 
        .C1(n630), .Y(N403) );
  OAI222XL U870 ( .A0(\a_reverse[0][2] ), .A1(n633), .B0(n592), .B1(n632), 
        .C0(\a_reverse[2][2] ), .C1(n749), .Y(n631) );
  OAI222XL U871 ( .A0(n628), .A1(n434), .B0(n627), .B1(n645), .C0(swap_reg[0]), 
        .C1(n631), .Y(N404) );
  OAI222XL U872 ( .A0(\a_reverse[1][0] ), .A1(n633), .B0(\a_reverse[5][0] ), 
        .B1(n632), .C0(\a_reverse[3][0] ), .C1(n749), .Y(n636) );
  OAI22XL U873 ( .A0(n629), .A1(n744), .B0(swap_reg[0]), .B1(n636), .Y(N399)
         );
  OAI222XL U874 ( .A0(\a_reverse[1][1] ), .A1(n633), .B0(\a_reverse[5][1] ), 
        .B1(n632), .C0(\a_reverse[3][1] ), .C1(n749), .Y(n639) );
  OAI22XL U875 ( .A0(n630), .A1(n744), .B0(swap_reg[0]), .B1(n639), .Y(N400)
         );
  OAI222XL U876 ( .A0(\a_reverse[1][2] ), .A1(n633), .B0(\a_reverse[5][2] ), 
        .B1(n632), .C0(\a_reverse[3][2] ), .C1(n749), .Y(n644) );
  OAI22XL U877 ( .A0(n631), .A1(n744), .B0(swap_reg[0]), .B1(n644), .Y(N401)
         );
  NAND2X1 U878 ( .A(swap_reg[1]), .B(n647), .Y(n640) );
  OAI22XL U879 ( .A0(n641), .A1(n650), .B0(n640), .B1(n427), .Y(n634) );
  AOI221XL U880 ( .A0(\a_reverse[6][0] ), .A1(n648), .B0(\a_reverse[2][0] ), 
        .B1(n649), .C0(n634), .Y(n635) );
  OAI22XL U881 ( .A0(n636), .A1(n744), .B0(swap_reg[0]), .B1(n635), .Y(N396)
         );
  OAI22XL U882 ( .A0(n641), .A1(n438), .B0(n640), .B1(n426), .Y(n637) );
  AOI221XL U883 ( .A0(\a_reverse[6][1] ), .A1(n648), .B0(\a_reverse[2][1] ), 
        .B1(n649), .C0(n637), .Y(n638) );
  OAI22XL U884 ( .A0(n639), .A1(n744), .B0(swap_reg[0]), .B1(n638), .Y(N397)
         );
  OAI22XL U885 ( .A0(n641), .A1(n437), .B0(n640), .B1(n582), .Y(n642) );
  AOI221XL U886 ( .A0(n746), .A1(n648), .B0(\a_reverse[2][2] ), .B1(n649), 
        .C0(n642), .Y(n643) );
  OAI22XL U887 ( .A0(n644), .A1(n744), .B0(swap_reg[0]), .B1(n643), .Y(N398)
         );
  OAI31X4 U888 ( .A0(n342), .A1(n748), .A2(n750), .B0(n340), .Y(N82) );
  AO22X1 U889 ( .A0(\a_reverse[6][0] ), .A1(n671), .B0(\a_reverse[7][0] ), 
        .B1(n670), .Y(n662) );
  AO22X1 U890 ( .A0(\a_reverse[6][1] ), .A1(n671), .B0(\a_reverse[7][1] ), 
        .B1(n670), .Y(n666) );
  AO22X1 U891 ( .A0(\a_reverse[2][0] ), .A1(n595), .B0(\a_reverse[3][0] ), 
        .B1(n596), .Y(n680) );
  AND2X1 U892 ( .A(N242), .B(n699), .Y(N421) );
  AND2X1 U893 ( .A(N243), .B(n699), .Y(N422) );
  AND2X1 U894 ( .A(N244), .B(n699), .Y(N423) );
endmodule


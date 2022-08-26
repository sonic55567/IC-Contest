/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : Q-2019.12
// Date      : Wed Mar 23 22:26:36 2022
/////////////////////////////////////////////////////////////


module lcd_ctrl ( clk, reset, datain, cmd, cmd_valid, dataout, output_valid, 
        busy );
  input [7:0] datain;
  input [2:0] cmd;
  output [7:0] dataout;
  input clk, reset, cmd_valid;
  output output_valid, busy;
  wire   n810, n811, n812, n813, n814, n815, n816, n817, n818, n819, cur_state,
         next_state, N248, N249, N250, N251, N252, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82,
         n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96,
         n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108,
         n109, n110, n111, n112, n113, n114, n115, n116, n117, n118, n119,
         n120, n121, n122, n123, n124, n125, n126, n127, n128, n129, n130,
         n131, n132, n133, n134, n135, n136, n137, n138, n139, n140, n141,
         n142, n143, n144, n145, n146, n147, n148, n149, n150, n151, n152,
         n153, n154, n155, n156, n157, n158, n159, n160, n161, n162, n163,
         n164, n165, n166, n167, n168, n169, n170, n171, n172, n173, n174,
         n175, n176, n177, n178, n179, n180, n181, n182, n183, n184, n185,
         n186, n187, n188, n189, n190, n191, n192, n193, n194, n195, n196,
         n197, n198, n199, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215, n216, n217, n218,
         n219, n220, n221, n222, n223, n224, n225, n226, n227, n228, n229,
         n230, n231, n232, n233, n234, n235, n236, n237, n238, n239, n240,
         n241, n242, n243, n244, n245, n246, n247, n248, n249, n250, n251,
         n252, n253, n254, n255, n256, n257, n258, n259, n260, n261, n262,
         n263, n264, n265, n266, n267, n268, n269, n270, n271, n272, n273,
         n274, n275, n276, n277, n278, n279, n280, n281, n282, n283, n284,
         n285, n286, n287, n288, n289, n290, n291, n292, n293, n294, n295,
         n296, n297, n298, n299, n300, n301, n302, n303, n304, n305, n306,
         n307, n308, n309, n310, n311, n312, n313, n314, n315, n316, n317,
         n318, n319, n320, n321, n322, n323, n324, n325, n326, n327, n328,
         n329, n330, n331, n332, n333, n334, n335, n336, n337, n338, n339,
         n340, n341, n342, n343, n344, n345, n346, n347, n348, n349, n350,
         n351, n352, n355, n362, n364, n366, n367, n368, n369, n370, n371,
         n372, n375, n376, n377, n378, n379, n380, n381, n382, n383, n384,
         n385, n386, n387, n388, n389, n390, n391, n392, n393, n394, n395,
         n396, n397, n398, n399, n400, n401, n402, n403, n404, n405, n406,
         n407, n408, n409, n410, n411, n412, n413, n414, n415, n416, n417,
         n418, n419, n420, n421, n422, n423, n424, n425, n426, n427, n428,
         n429, n430, n431, n432, n433, n434, n435, n436, n437, n438, n439,
         n440, n441, n442, n443, n444, n445, n446, n447, n448, n449, n450,
         n451, n452, n453, n454, n455, n456, n457, n458, n459, n460, n461,
         n462, n463, n464, n465, n466, n467, n468, n469, n470, n471, n472,
         n473, n474, n475, n476, n477, n478, n479, n480, n481, n482, n483,
         n484, n485, n486, n487, n488, n489, n490, n491, n492, n493, n494,
         n495, n496, n497, n498, n499, n500, n501, n502, n503, n504, n505,
         n506, n507, n508, n509, n510, n511, n512, n513, n514, n515, n516,
         n517, n518, n519, n520, n521, n522, n523, n524, n525, n526, n527,
         n528, n529, n530, n531, n532, n533, n534, n535, n536, n537, n538,
         n539, n540, n541, n542, n543, n544, n545, n546, n547, n548, n549,
         n550, n551, n552, n553, n554, n555, n556, n557, n558, n559, n560,
         n561, n562, n563, n564, n565, n566, n567, n568, n569, n570, n571,
         n572, n573, n574, n575, n576, n577, n578, n579, n580, n581, n582,
         n583, n584, n585, n586, n587, n588, n589, n590, n591, n592, n593,
         n594, n595, n596, n597, n598, n599, n600, n601, n602, n603, n604,
         n605, n606, n607, n609, n610, n612, n613, n615, n617, n618, n620,
         n621, n623, n625, n627, n629, n633, n635, n643, n645, n654, n661,
         n663, n664, n665, n666, n667, n668, n669, n670, n671, n672, n673,
         n674, n675, n676, n677, n678, n679, n680, n681, n682, n683, n684,
         n685, n686, n687, n688, n689, n690, n691, n692, n693, n694, n695,
         n696, n697, n698, n699, n700, n701, n702, n703, n704, n705, n706,
         n707, n708, n709, n710, n711, N175, N174, N173, N171, N170, N169,
         N168, N167, N165, N164, N163, \mult_57/n3 , \mult_57/n2 ,
         \mult_57/n1 , n712, n713, n715, n717, n719, n721, n723, n725, n727,
         n729, n731, n733, n734, n735, n736, n737, n738, n739, n740, n741,
         n742, n743, n744, n745, n746, n747, n748, n749, n750, n751, n752,
         n753, n754, n755, n756, n757, n758, n759, n760, n761, n762, n763,
         n764, n765, n766, n767, n768, n769, n770, n771, n772, n773, n774,
         n775, n776, n777, n778, n779, n780, n781, n782, n783, n784, n785,
         n786, n787, n788, n789, n790, n791, n792, n793, n794, n795, n796,
         n797, n798, n799, n800, n801, n802, n803, n804, n805, n806, n807,
         n808, n809;
  wire   [5:0] img_counter;
  wire   [2:0] cmd_reg;
  wire   [2:0] row;
  wire   [2:0] col;
  wire   [5:0] out_pos;
  wire   [5:2] \r422/carry ;
  wire   [5:1] \add_57_3/carry ;

  AND4X4 U276 ( .A(img_counter[3]), .B(n609), .C(n368), .D(n367), .Y(n645) );
  NOR3X6 U291 ( .A(n796), .B(reset), .C(n64), .Y(n609) );
  ADDHXL \mult_57/U4  ( .A(N167), .B(N163), .CO(\mult_57/n3 ), .S(N168) );
  EDFFX1 \data_buff_reg[35][7]  ( .D(n784), .E(n766), .CK(clk), .QN(n65) );
  EDFFX1 \data_buff_reg[35][6]  ( .D(n783), .E(n766), .CK(clk), .QN(n66) );
  EDFFX1 \data_buff_reg[35][5]  ( .D(n782), .E(n766), .CK(clk), .QN(n67) );
  EDFFX1 \data_buff_reg[35][4]  ( .D(n781), .E(n766), .CK(clk), .QN(n68) );
  EDFFX1 \data_buff_reg[35][3]  ( .D(n780), .E(n766), .CK(clk), .QN(n69) );
  EDFFX1 \data_buff_reg[35][2]  ( .D(n779), .E(n766), .CK(clk), .QN(n70) );
  EDFFX1 \data_buff_reg[35][1]  ( .D(n778), .E(n766), .CK(clk), .QN(n71) );
  EDFFX1 \data_buff_reg[35][0]  ( .D(n777), .E(n766), .CK(clk), .QN(n72) );
  EDFFXL \data_buff_reg[26][7]  ( .D(n784), .E(n750), .CK(clk), .QN(n137) );
  EDFFXL \data_buff_reg[26][6]  ( .D(n783), .E(n750), .CK(clk), .QN(n138) );
  EDFFXL \data_buff_reg[26][5]  ( .D(n782), .E(n750), .CK(clk), .QN(n139) );
  EDFFXL \data_buff_reg[26][4]  ( .D(n781), .E(n750), .CK(clk), .QN(n140) );
  EDFFXL \data_buff_reg[26][3]  ( .D(n780), .E(n750), .CK(clk), .QN(n141) );
  EDFFXL \data_buff_reg[26][2]  ( .D(n779), .E(n750), .CK(clk), .QN(n142) );
  EDFFXL \data_buff_reg[26][1]  ( .D(n778), .E(n750), .CK(clk), .QN(n143) );
  EDFFXL \data_buff_reg[26][0]  ( .D(n777), .E(n750), .CK(clk), .QN(n144) );
  EDFFX1 \data_buff_reg[8][7]  ( .D(datain[7]), .E(n740), .CK(clk), .QN(n281)
         );
  EDFFX1 \data_buff_reg[8][6]  ( .D(datain[6]), .E(n740), .CK(clk), .QN(n282)
         );
  EDFFX1 \data_buff_reg[8][5]  ( .D(datain[5]), .E(n740), .CK(clk), .QN(n283)
         );
  EDFFX1 \data_buff_reg[8][4]  ( .D(datain[4]), .E(n740), .CK(clk), .QN(n284)
         );
  EDFFX1 \data_buff_reg[8][3]  ( .D(datain[3]), .E(n740), .CK(clk), .QN(n285)
         );
  EDFFX1 \data_buff_reg[8][2]  ( .D(datain[2]), .E(n740), .CK(clk), .QN(n286)
         );
  EDFFX1 \data_buff_reg[8][1]  ( .D(datain[1]), .E(n740), .CK(clk), .QN(n287)
         );
  EDFFX1 \data_buff_reg[8][0]  ( .D(datain[0]), .E(n740), .CK(clk), .QN(n288)
         );
  EDFFXL \data_buff_reg[25][7]  ( .D(n784), .E(n749), .CK(clk), .QN(n145) );
  EDFFXL \data_buff_reg[25][6]  ( .D(n783), .E(n749), .CK(clk), .QN(n146) );
  EDFFXL \data_buff_reg[25][5]  ( .D(n782), .E(n749), .CK(clk), .QN(n147) );
  EDFFXL \data_buff_reg[25][4]  ( .D(n781), .E(n749), .CK(clk), .QN(n148) );
  EDFFXL \data_buff_reg[25][3]  ( .D(n780), .E(n749), .CK(clk), .QN(n149) );
  EDFFXL \data_buff_reg[25][2]  ( .D(n779), .E(n749), .CK(clk), .QN(n150) );
  EDFFXL \data_buff_reg[25][1]  ( .D(n778), .E(n749), .CK(clk), .QN(n151) );
  EDFFXL \data_buff_reg[25][0]  ( .D(n777), .E(n749), .CK(clk), .QN(n152) );
  EDFFX1 \data_buff_reg[7][7]  ( .D(datain[7]), .E(n767), .CK(clk), .QN(n289)
         );
  EDFFX1 \data_buff_reg[7][6]  ( .D(datain[6]), .E(n767), .CK(clk), .QN(n290)
         );
  EDFFX1 \data_buff_reg[7][5]  ( .D(datain[5]), .E(n767), .CK(clk), .QN(n291)
         );
  EDFFX1 \data_buff_reg[7][4]  ( .D(datain[4]), .E(n767), .CK(clk), .QN(n292)
         );
  EDFFX1 \data_buff_reg[7][3]  ( .D(datain[3]), .E(n767), .CK(clk), .QN(n293)
         );
  EDFFX1 \data_buff_reg[7][2]  ( .D(datain[2]), .E(n767), .CK(clk), .QN(n294)
         );
  EDFFX1 \data_buff_reg[7][1]  ( .D(datain[1]), .E(n767), .CK(clk), .QN(n295)
         );
  EDFFX1 \data_buff_reg[7][0]  ( .D(datain[0]), .E(n767), .CK(clk), .QN(n296)
         );
  EDFFXL \data_buff_reg[24][7]  ( .D(n784), .E(n748), .CK(clk), .QN(n153) );
  EDFFXL \data_buff_reg[24][6]  ( .D(n783), .E(n748), .CK(clk), .QN(n154) );
  EDFFXL \data_buff_reg[24][5]  ( .D(n782), .E(n748), .CK(clk), .QN(n155) );
  EDFFXL \data_buff_reg[24][4]  ( .D(n781), .E(n748), .CK(clk), .QN(n156) );
  EDFFXL \data_buff_reg[24][3]  ( .D(n780), .E(n748), .CK(clk), .QN(n157) );
  EDFFXL \data_buff_reg[24][2]  ( .D(n779), .E(n748), .CK(clk), .QN(n158) );
  EDFFXL \data_buff_reg[24][1]  ( .D(n778), .E(n748), .CK(clk), .QN(n159) );
  EDFFXL \data_buff_reg[24][0]  ( .D(n777), .E(n748), .CK(clk), .QN(n160) );
  EDFFX1 \data_buff_reg[15][7]  ( .D(n784), .E(n747), .CK(clk), .QN(n225) );
  EDFFX1 \data_buff_reg[15][6]  ( .D(n783), .E(n747), .CK(clk), .QN(n226) );
  EDFFX1 \data_buff_reg[15][5]  ( .D(n782), .E(n747), .CK(clk), .QN(n227) );
  EDFFX1 \data_buff_reg[15][4]  ( .D(n781), .E(n747), .CK(clk), .QN(n228) );
  EDFFX1 \data_buff_reg[15][3]  ( .D(n780), .E(n747), .CK(clk), .QN(n229) );
  EDFFX1 \data_buff_reg[15][2]  ( .D(n779), .E(n747), .CK(clk), .QN(n230) );
  EDFFX1 \data_buff_reg[15][1]  ( .D(n778), .E(n747), .CK(clk), .QN(n231) );
  EDFFX1 \data_buff_reg[15][0]  ( .D(n777), .E(n747), .CK(clk), .QN(n232) );
  EDFFX1 \data_buff_reg[6][7]  ( .D(datain[7]), .E(n758), .CK(clk), .QN(n297)
         );
  EDFFX1 \data_buff_reg[6][6]  ( .D(datain[6]), .E(n758), .CK(clk), .QN(n298)
         );
  EDFFX1 \data_buff_reg[6][5]  ( .D(datain[5]), .E(n758), .CK(clk), .QN(n299)
         );
  EDFFX1 \data_buff_reg[6][4]  ( .D(datain[4]), .E(n758), .CK(clk), .QN(n300)
         );
  EDFFX1 \data_buff_reg[6][3]  ( .D(datain[3]), .E(n758), .CK(clk), .QN(n301)
         );
  EDFFX1 \data_buff_reg[6][2]  ( .D(datain[2]), .E(n758), .CK(clk), .QN(n302)
         );
  EDFFX1 \data_buff_reg[6][1]  ( .D(datain[1]), .E(n758), .CK(clk), .QN(n303)
         );
  EDFFX1 \data_buff_reg[6][0]  ( .D(datain[0]), .E(n758), .CK(clk), .QN(n304)
         );
  EDFFX1 \data_buff_reg[32][7]  ( .D(n784), .E(n757), .CK(clk), .QN(n89) );
  EDFFX1 \data_buff_reg[32][6]  ( .D(n783), .E(n757), .CK(clk), .QN(n90) );
  EDFFX1 \data_buff_reg[32][5]  ( .D(n782), .E(n757), .CK(clk), .QN(n91) );
  EDFFX1 \data_buff_reg[32][4]  ( .D(n781), .E(n757), .CK(clk), .QN(n92) );
  EDFFX1 \data_buff_reg[32][3]  ( .D(n780), .E(n757), .CK(clk), .QN(n93) );
  EDFFX1 \data_buff_reg[32][2]  ( .D(n779), .E(n757), .CK(clk), .QN(n94) );
  EDFFX1 \data_buff_reg[32][1]  ( .D(n778), .E(n757), .CK(clk), .QN(n95) );
  EDFFX1 \data_buff_reg[32][0]  ( .D(n777), .E(n757), .CK(clk), .QN(n96) );
  EDFFXL \data_buff_reg[30][7]  ( .D(n784), .E(n738), .CK(clk), .QN(n105) );
  EDFFXL \data_buff_reg[30][6]  ( .D(n783), .E(n738), .CK(clk), .QN(n106) );
  EDFFXL \data_buff_reg[30][5]  ( .D(n782), .E(n738), .CK(clk), .QN(n107) );
  EDFFXL \data_buff_reg[30][4]  ( .D(n781), .E(n738), .CK(clk), .QN(n108) );
  EDFFXL \data_buff_reg[30][3]  ( .D(n780), .E(n738), .CK(clk), .QN(n109) );
  EDFFXL \data_buff_reg[30][2]  ( .D(n779), .E(n738), .CK(clk), .QN(n110) );
  EDFFXL \data_buff_reg[30][1]  ( .D(n778), .E(n738), .CK(clk), .QN(n111) );
  EDFFXL \data_buff_reg[30][0]  ( .D(n777), .E(n738), .CK(clk), .QN(n112) );
  EDFFXL \data_buff_reg[28][7]  ( .D(n784), .E(n736), .CK(clk), .QN(n121) );
  EDFFXL \data_buff_reg[28][6]  ( .D(n783), .E(n736), .CK(clk), .QN(n122) );
  EDFFXL \data_buff_reg[28][5]  ( .D(n782), .E(n736), .CK(clk), .QN(n123) );
  EDFFXL \data_buff_reg[28][4]  ( .D(n781), .E(n736), .CK(clk), .QN(n124) );
  EDFFXL \data_buff_reg[28][3]  ( .D(n780), .E(n736), .CK(clk), .QN(n125) );
  EDFFXL \data_buff_reg[28][2]  ( .D(n779), .E(n736), .CK(clk), .QN(n126) );
  EDFFXL \data_buff_reg[28][1]  ( .D(n778), .E(n736), .CK(clk), .QN(n127) );
  EDFFXL \data_buff_reg[28][0]  ( .D(n777), .E(n736), .CK(clk), .QN(n128) );
  EDFFX1 \data_buff_reg[23][4]  ( .D(n781), .E(n768), .CK(clk), .QN(n164) );
  EDFFX1 \data_buff_reg[23][3]  ( .D(n780), .E(n768), .CK(clk), .QN(n165) );
  EDFFX1 \data_buff_reg[23][2]  ( .D(n779), .E(n768), .CK(clk), .QN(n166) );
  EDFFX1 \data_buff_reg[23][1]  ( .D(n778), .E(n768), .CK(clk), .QN(n167) );
  EDFFX1 \data_buff_reg[23][0]  ( .D(n777), .E(n768), .CK(clk), .QN(n168) );
  EDFFX1 \data_buff_reg[23][7]  ( .D(n784), .E(n768), .CK(clk), .QN(n161) );
  EDFFX1 \data_buff_reg[23][6]  ( .D(n783), .E(n768), .CK(clk), .QN(n162) );
  EDFFX1 \data_buff_reg[23][5]  ( .D(n782), .E(n768), .CK(clk), .QN(n163) );
  EDFFX1 \data_buff_reg[21][7]  ( .D(n784), .E(n763), .CK(clk), .QN(n177) );
  EDFFX1 \data_buff_reg[21][6]  ( .D(n783), .E(n763), .CK(clk), .QN(n178) );
  EDFFX1 \data_buff_reg[21][5]  ( .D(n782), .E(n763), .CK(clk), .QN(n179) );
  EDFFX1 \data_buff_reg[21][4]  ( .D(n781), .E(n763), .CK(clk), .QN(n180) );
  EDFFX1 \data_buff_reg[21][3]  ( .D(n780), .E(n763), .CK(clk), .QN(n181) );
  EDFFX1 \data_buff_reg[21][2]  ( .D(n779), .E(n763), .CK(clk), .QN(n182) );
  EDFFX1 \data_buff_reg[21][1]  ( .D(n778), .E(n763), .CK(clk), .QN(n183) );
  EDFFX1 \data_buff_reg[21][0]  ( .D(n777), .E(n763), .CK(clk), .QN(n184) );
  EDFFX1 \data_buff_reg[19][7]  ( .D(datain[7]), .E(n756), .CK(clk), .QN(n193)
         );
  EDFFX1 \data_buff_reg[19][6]  ( .D(datain[6]), .E(n756), .CK(clk), .QN(n194)
         );
  EDFFX1 \data_buff_reg[19][5]  ( .D(datain[5]), .E(n756), .CK(clk), .QN(n195)
         );
  EDFFX1 \data_buff_reg[19][4]  ( .D(datain[4]), .E(n756), .CK(clk), .QN(n196)
         );
  EDFFX1 \data_buff_reg[19][3]  ( .D(datain[3]), .E(n756), .CK(clk), .QN(n197)
         );
  EDFFX1 \data_buff_reg[19][2]  ( .D(datain[2]), .E(n756), .CK(clk), .QN(n198)
         );
  EDFFX1 \data_buff_reg[19][1]  ( .D(datain[1]), .E(n756), .CK(clk), .QN(n199)
         );
  EDFFX1 \data_buff_reg[19][0]  ( .D(datain[0]), .E(n756), .CK(clk), .QN(n200)
         );
  EDFFX1 \data_buff_reg[14][7]  ( .D(datain[7]), .E(n746), .CK(clk), .QN(n233)
         );
  EDFFX1 \data_buff_reg[14][6]  ( .D(datain[6]), .E(n746), .CK(clk), .QN(n234)
         );
  EDFFX1 \data_buff_reg[14][5]  ( .D(datain[5]), .E(n746), .CK(clk), .QN(n235)
         );
  EDFFX1 \data_buff_reg[14][4]  ( .D(datain[4]), .E(n746), .CK(clk), .QN(n236)
         );
  EDFFX1 \data_buff_reg[14][3]  ( .D(datain[3]), .E(n746), .CK(clk), .QN(n237)
         );
  EDFFX1 \data_buff_reg[14][2]  ( .D(datain[2]), .E(n746), .CK(clk), .QN(n238)
         );
  EDFFX1 \data_buff_reg[14][1]  ( .D(datain[1]), .E(n746), .CK(clk), .QN(n239)
         );
  EDFFX1 \data_buff_reg[14][0]  ( .D(datain[0]), .E(n746), .CK(clk), .QN(n240)
         );
  EDFFX1 \data_buff_reg[12][7]  ( .D(datain[7]), .E(n744), .CK(clk), .QN(n249)
         );
  EDFFX1 \data_buff_reg[12][6]  ( .D(datain[6]), .E(n744), .CK(clk), .QN(n250)
         );
  EDFFX1 \data_buff_reg[12][5]  ( .D(datain[5]), .E(n744), .CK(clk), .QN(n251)
         );
  EDFFX1 \data_buff_reg[12][4]  ( .D(datain[4]), .E(n744), .CK(clk), .QN(n252)
         );
  EDFFX1 \data_buff_reg[12][3]  ( .D(datain[3]), .E(n744), .CK(clk), .QN(n253)
         );
  EDFFX1 \data_buff_reg[12][2]  ( .D(datain[2]), .E(n744), .CK(clk), .QN(n254)
         );
  EDFFX1 \data_buff_reg[12][1]  ( .D(datain[1]), .E(n744), .CK(clk), .QN(n255)
         );
  EDFFX1 \data_buff_reg[12][0]  ( .D(datain[0]), .E(n744), .CK(clk), .QN(n256)
         );
  EDFFX1 \data_buff_reg[10][7]  ( .D(datain[7]), .E(n742), .CK(clk), .QN(n265)
         );
  EDFFX1 \data_buff_reg[10][6]  ( .D(datain[6]), .E(n742), .CK(clk), .QN(n266)
         );
  EDFFX1 \data_buff_reg[10][5]  ( .D(datain[5]), .E(n742), .CK(clk), .QN(n267)
         );
  EDFFX1 \data_buff_reg[10][4]  ( .D(datain[4]), .E(n742), .CK(clk), .QN(n268)
         );
  EDFFX1 \data_buff_reg[10][3]  ( .D(datain[3]), .E(n742), .CK(clk), .QN(n269)
         );
  EDFFX1 \data_buff_reg[10][2]  ( .D(datain[2]), .E(n742), .CK(clk), .QN(n270)
         );
  EDFFX1 \data_buff_reg[10][1]  ( .D(datain[1]), .E(n742), .CK(clk), .QN(n271)
         );
  EDFFX1 \data_buff_reg[10][0]  ( .D(datain[0]), .E(n742), .CK(clk), .QN(n272)
         );
  EDFFX1 \data_buff_reg[5][7]  ( .D(datain[7]), .E(n761), .CK(clk), .QN(n305)
         );
  EDFFX1 \data_buff_reg[5][6]  ( .D(datain[6]), .E(n761), .CK(clk), .QN(n306)
         );
  EDFFX1 \data_buff_reg[5][5]  ( .D(datain[5]), .E(n761), .CK(clk), .QN(n307)
         );
  EDFFX1 \data_buff_reg[5][4]  ( .D(datain[4]), .E(n761), .CK(clk), .QN(n308)
         );
  EDFFX1 \data_buff_reg[5][3]  ( .D(datain[3]), .E(n761), .CK(clk), .QN(n309)
         );
  EDFFX1 \data_buff_reg[5][2]  ( .D(datain[2]), .E(n761), .CK(clk), .QN(n310)
         );
  EDFFX1 \data_buff_reg[5][1]  ( .D(datain[1]), .E(n761), .CK(clk), .QN(n311)
         );
  EDFFX1 \data_buff_reg[5][0]  ( .D(datain[0]), .E(n761), .CK(clk), .QN(n312)
         );
  EDFFX1 \data_buff_reg[3][7]  ( .D(datain[7]), .E(n754), .CK(clk), .QN(n321)
         );
  EDFFX1 \data_buff_reg[3][6]  ( .D(datain[6]), .E(n754), .CK(clk), .QN(n322)
         );
  EDFFX1 \data_buff_reg[3][5]  ( .D(datain[5]), .E(n754), .CK(clk), .QN(n323)
         );
  EDFFX1 \data_buff_reg[3][4]  ( .D(datain[4]), .E(n754), .CK(clk), .QN(n324)
         );
  EDFFX1 \data_buff_reg[3][3]  ( .D(datain[3]), .E(n754), .CK(clk), .QN(n325)
         );
  EDFFX1 \data_buff_reg[3][2]  ( .D(datain[2]), .E(n754), .CK(clk), .QN(n326)
         );
  EDFFX1 \data_buff_reg[3][1]  ( .D(datain[1]), .E(n754), .CK(clk), .QN(n327)
         );
  EDFFX1 \data_buff_reg[3][0]  ( .D(datain[0]), .E(n754), .CK(clk), .QN(n328)
         );
  EDFFX1 \data_buff_reg[1][7]  ( .D(datain[7]), .E(n753), .CK(clk), .QN(n337)
         );
  EDFFX1 \data_buff_reg[1][6]  ( .D(datain[6]), .E(n753), .CK(clk), .QN(n338)
         );
  EDFFX1 \data_buff_reg[1][5]  ( .D(datain[5]), .E(n753), .CK(clk), .QN(n339)
         );
  EDFFX1 \data_buff_reg[1][4]  ( .D(datain[4]), .E(n753), .CK(clk), .QN(n340)
         );
  EDFFX1 \data_buff_reg[1][3]  ( .D(datain[3]), .E(n753), .CK(clk), .QN(n341)
         );
  EDFFX1 \data_buff_reg[1][2]  ( .D(datain[2]), .E(n753), .CK(clk), .QN(n342)
         );
  EDFFX1 \data_buff_reg[1][1]  ( .D(datain[1]), .E(n753), .CK(clk), .QN(n343)
         );
  EDFFX1 \data_buff_reg[1][0]  ( .D(datain[0]), .E(n753), .CK(clk), .QN(n344)
         );
  EDFFXL \data_buff_reg[31][7]  ( .D(n784), .E(n739), .CK(clk), .QN(n97) );
  EDFFXL \data_buff_reg[31][6]  ( .D(n783), .E(n739), .CK(clk), .QN(n98) );
  EDFFXL \data_buff_reg[31][5]  ( .D(n782), .E(n739), .CK(clk), .QN(n99) );
  EDFFXL \data_buff_reg[31][4]  ( .D(n781), .E(n739), .CK(clk), .QN(n100) );
  EDFFXL \data_buff_reg[31][3]  ( .D(n780), .E(n739), .CK(clk), .QN(n101) );
  EDFFXL \data_buff_reg[31][2]  ( .D(n779), .E(n739), .CK(clk), .QN(n102) );
  EDFFXL \data_buff_reg[31][1]  ( .D(n778), .E(n739), .CK(clk), .QN(n103) );
  EDFFXL \data_buff_reg[31][0]  ( .D(n777), .E(n739), .CK(clk), .QN(n104) );
  EDFFXL \data_buff_reg[29][7]  ( .D(n784), .E(n737), .CK(clk), .QN(n113) );
  EDFFXL \data_buff_reg[29][6]  ( .D(n783), .E(n737), .CK(clk), .QN(n114) );
  EDFFXL \data_buff_reg[29][5]  ( .D(n782), .E(n737), .CK(clk), .QN(n115) );
  EDFFXL \data_buff_reg[29][4]  ( .D(n781), .E(n737), .CK(clk), .QN(n116) );
  EDFFXL \data_buff_reg[29][3]  ( .D(n780), .E(n737), .CK(clk), .QN(n117) );
  EDFFXL \data_buff_reg[29][2]  ( .D(n779), .E(n737), .CK(clk), .QN(n118) );
  EDFFXL \data_buff_reg[29][1]  ( .D(n778), .E(n737), .CK(clk), .QN(n119) );
  EDFFXL \data_buff_reg[29][0]  ( .D(n777), .E(n737), .CK(clk), .QN(n120) );
  EDFFXL \data_buff_reg[27][7]  ( .D(n784), .E(n751), .CK(clk), .QN(n129) );
  EDFFXL \data_buff_reg[27][6]  ( .D(n783), .E(n751), .CK(clk), .QN(n130) );
  EDFFXL \data_buff_reg[27][5]  ( .D(n782), .E(n751), .CK(clk), .QN(n131) );
  EDFFXL \data_buff_reg[27][4]  ( .D(n781), .E(n751), .CK(clk), .QN(n132) );
  EDFFXL \data_buff_reg[27][3]  ( .D(n780), .E(n751), .CK(clk), .QN(n133) );
  EDFFXL \data_buff_reg[27][2]  ( .D(n779), .E(n751), .CK(clk), .QN(n134) );
  EDFFXL \data_buff_reg[27][1]  ( .D(n778), .E(n751), .CK(clk), .QN(n135) );
  EDFFXL \data_buff_reg[27][0]  ( .D(n777), .E(n751), .CK(clk), .QN(n136) );
  EDFFX1 \data_buff_reg[22][7]  ( .D(datain[7]), .E(n759), .CK(clk), .QN(n169)
         );
  EDFFX1 \data_buff_reg[22][6]  ( .D(datain[6]), .E(n759), .CK(clk), .QN(n170)
         );
  EDFFX1 \data_buff_reg[22][5]  ( .D(datain[5]), .E(n759), .CK(clk), .QN(n171)
         );
  EDFFX1 \data_buff_reg[22][4]  ( .D(datain[4]), .E(n759), .CK(clk), .QN(n172)
         );
  EDFFX1 \data_buff_reg[22][3]  ( .D(datain[3]), .E(n759), .CK(clk), .QN(n173)
         );
  EDFFX1 \data_buff_reg[22][2]  ( .D(datain[2]), .E(n759), .CK(clk), .QN(n174)
         );
  EDFFX1 \data_buff_reg[22][1]  ( .D(datain[1]), .E(n759), .CK(clk), .QN(n175)
         );
  EDFFX1 \data_buff_reg[22][0]  ( .D(datain[0]), .E(n759), .CK(clk), .QN(n176)
         );
  EDFFX1 \data_buff_reg[20][7]  ( .D(datain[7]), .E(n762), .CK(clk), .QN(n185)
         );
  EDFFX1 \data_buff_reg[20][6]  ( .D(datain[6]), .E(n762), .CK(clk), .QN(n186)
         );
  EDFFX1 \data_buff_reg[20][5]  ( .D(datain[5]), .E(n762), .CK(clk), .QN(n187)
         );
  EDFFX1 \data_buff_reg[20][4]  ( .D(datain[4]), .E(n762), .CK(clk), .QN(n188)
         );
  EDFFX1 \data_buff_reg[20][3]  ( .D(datain[3]), .E(n762), .CK(clk), .QN(n189)
         );
  EDFFX1 \data_buff_reg[20][2]  ( .D(datain[2]), .E(n762), .CK(clk), .QN(n190)
         );
  EDFFX1 \data_buff_reg[20][1]  ( .D(datain[1]), .E(n762), .CK(clk), .QN(n191)
         );
  EDFFX1 \data_buff_reg[20][0]  ( .D(datain[0]), .E(n762), .CK(clk), .QN(n192)
         );
  EDFFX1 \data_buff_reg[18][7]  ( .D(datain[7]), .E(n770), .CK(clk), .QN(n201)
         );
  EDFFX1 \data_buff_reg[18][6]  ( .D(datain[6]), .E(n770), .CK(clk), .QN(n202)
         );
  EDFFX1 \data_buff_reg[18][5]  ( .D(datain[5]), .E(n770), .CK(clk), .QN(n203)
         );
  EDFFX1 \data_buff_reg[18][4]  ( .D(datain[4]), .E(n770), .CK(clk), .QN(n204)
         );
  EDFFX1 \data_buff_reg[18][3]  ( .D(datain[3]), .E(n770), .CK(clk), .QN(n205)
         );
  EDFFX1 \data_buff_reg[18][2]  ( .D(datain[2]), .E(n770), .CK(clk), .QN(n206)
         );
  EDFFX1 \data_buff_reg[18][1]  ( .D(datain[1]), .E(n770), .CK(clk), .QN(n207)
         );
  EDFFX1 \data_buff_reg[18][0]  ( .D(datain[0]), .E(n770), .CK(clk), .QN(n208)
         );
  EDFFX1 \data_buff_reg[13][7]  ( .D(datain[7]), .E(n745), .CK(clk), .QN(n241)
         );
  EDFFX1 \data_buff_reg[13][6]  ( .D(datain[6]), .E(n745), .CK(clk), .QN(n242)
         );
  EDFFX1 \data_buff_reg[13][5]  ( .D(datain[5]), .E(n745), .CK(clk), .QN(n243)
         );
  EDFFX1 \data_buff_reg[13][4]  ( .D(datain[4]), .E(n745), .CK(clk), .QN(n244)
         );
  EDFFX1 \data_buff_reg[13][3]  ( .D(datain[3]), .E(n745), .CK(clk), .QN(n245)
         );
  EDFFX1 \data_buff_reg[13][2]  ( .D(datain[2]), .E(n745), .CK(clk), .QN(n246)
         );
  EDFFX1 \data_buff_reg[13][1]  ( .D(datain[1]), .E(n745), .CK(clk), .QN(n247)
         );
  EDFFX1 \data_buff_reg[13][0]  ( .D(datain[0]), .E(n745), .CK(clk), .QN(n248)
         );
  EDFFX1 \data_buff_reg[11][1]  ( .D(datain[1]), .E(n743), .CK(clk), .QN(n263)
         );
  EDFFX1 \data_buff_reg[11][0]  ( .D(datain[0]), .E(n743), .CK(clk), .QN(n264)
         );
  EDFFX1 \data_buff_reg[11][7]  ( .D(datain[7]), .E(n743), .CK(clk), .QN(n257)
         );
  EDFFX1 \data_buff_reg[11][6]  ( .D(datain[6]), .E(n743), .CK(clk), .QN(n258)
         );
  EDFFX1 \data_buff_reg[11][5]  ( .D(datain[5]), .E(n743), .CK(clk), .QN(n259)
         );
  EDFFX1 \data_buff_reg[11][4]  ( .D(datain[4]), .E(n743), .CK(clk), .QN(n260)
         );
  EDFFX1 \data_buff_reg[11][3]  ( .D(datain[3]), .E(n743), .CK(clk), .QN(n261)
         );
  EDFFX1 \data_buff_reg[11][2]  ( .D(datain[2]), .E(n743), .CK(clk), .QN(n262)
         );
  EDFFX1 \data_buff_reg[9][7]  ( .D(datain[7]), .E(n741), .CK(clk), .QN(n273)
         );
  EDFFX1 \data_buff_reg[9][6]  ( .D(datain[6]), .E(n741), .CK(clk), .QN(n274)
         );
  EDFFX1 \data_buff_reg[9][5]  ( .D(datain[5]), .E(n741), .CK(clk), .QN(n275)
         );
  EDFFX1 \data_buff_reg[9][4]  ( .D(datain[4]), .E(n741), .CK(clk), .QN(n276)
         );
  EDFFX1 \data_buff_reg[9][3]  ( .D(datain[3]), .E(n741), .CK(clk), .QN(n277)
         );
  EDFFX1 \data_buff_reg[9][2]  ( .D(datain[2]), .E(n741), .CK(clk), .QN(n278)
         );
  EDFFX1 \data_buff_reg[9][1]  ( .D(datain[1]), .E(n741), .CK(clk), .QN(n279)
         );
  EDFFX1 \data_buff_reg[9][0]  ( .D(datain[0]), .E(n741), .CK(clk), .QN(n280)
         );
  EDFFX1 \data_buff_reg[4][7]  ( .D(datain[7]), .E(n760), .CK(clk), .QN(n313)
         );
  EDFFX1 \data_buff_reg[4][6]  ( .D(datain[6]), .E(n760), .CK(clk), .QN(n314)
         );
  EDFFX1 \data_buff_reg[4][5]  ( .D(datain[5]), .E(n760), .CK(clk), .QN(n315)
         );
  EDFFX1 \data_buff_reg[4][4]  ( .D(datain[4]), .E(n760), .CK(clk), .QN(n316)
         );
  EDFFX1 \data_buff_reg[4][3]  ( .D(datain[3]), .E(n760), .CK(clk), .QN(n317)
         );
  EDFFX1 \data_buff_reg[4][2]  ( .D(datain[2]), .E(n760), .CK(clk), .QN(n318)
         );
  EDFFX1 \data_buff_reg[4][1]  ( .D(datain[1]), .E(n760), .CK(clk), .QN(n319)
         );
  EDFFX1 \data_buff_reg[4][0]  ( .D(datain[0]), .E(n760), .CK(clk), .QN(n320)
         );
  EDFFX1 \data_buff_reg[2][7]  ( .D(datain[7]), .E(n769), .CK(clk), .QN(n329)
         );
  EDFFX1 \data_buff_reg[2][6]  ( .D(datain[6]), .E(n769), .CK(clk), .QN(n330)
         );
  EDFFX1 \data_buff_reg[2][5]  ( .D(datain[5]), .E(n769), .CK(clk), .QN(n331)
         );
  EDFFX1 \data_buff_reg[2][4]  ( .D(datain[4]), .E(n769), .CK(clk), .QN(n332)
         );
  EDFFX1 \data_buff_reg[2][3]  ( .D(datain[3]), .E(n769), .CK(clk), .QN(n333)
         );
  EDFFX1 \data_buff_reg[2][2]  ( .D(datain[2]), .E(n769), .CK(clk), .QN(n334)
         );
  EDFFX1 \data_buff_reg[2][1]  ( .D(datain[1]), .E(n769), .CK(clk), .QN(n335)
         );
  EDFFX1 \data_buff_reg[2][0]  ( .D(datain[0]), .E(n769), .CK(clk), .QN(n336)
         );
  EDFFX1 \data_buff_reg[0][0]  ( .D(datain[0]), .E(n765), .CK(clk), .QN(n352)
         );
  EDFFX1 \data_buff_reg[0][1]  ( .D(datain[1]), .E(n765), .CK(clk), .QN(n351)
         );
  EDFFX1 \data_buff_reg[0][3]  ( .D(datain[3]), .E(n765), .CK(clk), .QN(n349)
         );
  EDFFX1 \data_buff_reg[0][4]  ( .D(datain[4]), .E(n765), .CK(clk), .QN(n348)
         );
  EDFFX1 \data_buff_reg[0][5]  ( .D(datain[5]), .E(n765), .CK(clk), .QN(n347)
         );
  EDFFX1 \data_buff_reg[0][6]  ( .D(datain[6]), .E(n765), .CK(clk), .QN(n346)
         );
  EDFFX1 \data_buff_reg[0][7]  ( .D(datain[7]), .E(n765), .CK(clk), .QN(n345)
         );
  EDFFX1 \data_buff_reg[0][2]  ( .D(datain[2]), .E(n765), .CK(clk), .QN(n350)
         );
  DFFRX2 cur_state_reg ( .D(next_state), .CK(clk), .RN(n776), .Q(cur_state), 
        .QN(n64) );
  DFFRX2 \col_reg[0]  ( .D(n699), .CK(clk), .RN(n789), .Q(col[0]), .QN(n375)
         );
  DFFRX2 \row_reg[0]  ( .D(n701), .CK(clk), .RN(n776), .Q(row[0]), .QN(n355)
         );
  EDFFXL \data_buff_reg[33][7]  ( .D(n784), .E(n764), .CK(clk), .QN(n81) );
  EDFFXL \data_buff_reg[33][6]  ( .D(n783), .E(n764), .CK(clk), .QN(n82) );
  EDFFXL \data_buff_reg[33][5]  ( .D(n782), .E(n764), .CK(clk), .QN(n83) );
  EDFFXL \data_buff_reg[33][4]  ( .D(n781), .E(n764), .CK(clk), .QN(n84) );
  EDFFXL \data_buff_reg[33][3]  ( .D(n780), .E(n764), .CK(clk), .QN(n85) );
  EDFFXL \data_buff_reg[33][2]  ( .D(n779), .E(n764), .CK(clk), .QN(n86) );
  EDFFXL \data_buff_reg[33][1]  ( .D(n778), .E(n764), .CK(clk), .QN(n87) );
  EDFFXL \data_buff_reg[33][0]  ( .D(n777), .E(n764), .CK(clk), .QN(n88) );
  EDFFXL \data_buff_reg[34][7]  ( .D(n784), .E(n771), .CK(clk), .QN(n73) );
  EDFFXL \data_buff_reg[34][6]  ( .D(n783), .E(n771), .CK(clk), .QN(n74) );
  EDFFXL \data_buff_reg[34][5]  ( .D(n782), .E(n771), .CK(clk), .QN(n75) );
  EDFFXL \data_buff_reg[34][4]  ( .D(n781), .E(n771), .CK(clk), .QN(n76) );
  EDFFXL \data_buff_reg[34][3]  ( .D(n780), .E(n771), .CK(clk), .QN(n77) );
  EDFFXL \data_buff_reg[34][2]  ( .D(n779), .E(n771), .CK(clk), .QN(n78) );
  EDFFXL \data_buff_reg[34][1]  ( .D(n778), .E(n771), .CK(clk), .QN(n79) );
  EDFFXL \data_buff_reg[34][0]  ( .D(n777), .E(n771), .CK(clk), .QN(n80) );
  EDFFXL \data_buff_reg[16][7]  ( .D(n784), .E(n752), .CK(clk), .QN(n217) );
  EDFFXL \data_buff_reg[16][6]  ( .D(n783), .E(n752), .CK(clk), .QN(n218) );
  EDFFXL \data_buff_reg[16][5]  ( .D(n782), .E(n752), .CK(clk), .QN(n219) );
  EDFFXL \data_buff_reg[16][4]  ( .D(n781), .E(n752), .CK(clk), .QN(n220) );
  EDFFXL \data_buff_reg[16][3]  ( .D(n780), .E(n752), .CK(clk), .QN(n221) );
  EDFFXL \data_buff_reg[16][2]  ( .D(n779), .E(n752), .CK(clk), .QN(n222) );
  EDFFXL \data_buff_reg[16][1]  ( .D(n778), .E(n752), .CK(clk), .QN(n223) );
  EDFFXL \data_buff_reg[16][0]  ( .D(n777), .E(n752), .CK(clk), .QN(n224) );
  EDFFXL \data_buff_reg[17][7]  ( .D(n784), .E(n755), .CK(clk), .QN(n209) );
  EDFFXL \data_buff_reg[17][6]  ( .D(n783), .E(n755), .CK(clk), .QN(n210) );
  EDFFXL \data_buff_reg[17][5]  ( .D(n782), .E(n755), .CK(clk), .QN(n211) );
  EDFFXL \data_buff_reg[17][4]  ( .D(n781), .E(n755), .CK(clk), .QN(n212) );
  EDFFXL \data_buff_reg[17][3]  ( .D(n780), .E(n755), .CK(clk), .QN(n213) );
  EDFFXL \data_buff_reg[17][2]  ( .D(n779), .E(n755), .CK(clk), .QN(n214) );
  EDFFXL \data_buff_reg[17][1]  ( .D(n778), .E(n755), .CK(clk), .QN(n215) );
  EDFFXL \data_buff_reg[17][0]  ( .D(n777), .E(n755), .CK(clk), .QN(n216) );
  DFFSX1 \col_reg[1]  ( .D(n698), .CK(clk), .SN(n776), .Q(col[1]), .QN(n801)
         );
  DFFRHQX1 \dataout_reg[6]  ( .D(n695), .CK(clk), .RN(n789), .Q(n811) );
  DFFRHQX1 output_valid_reg ( .D(n697), .CK(clk), .RN(n789), .Q(n818) );
  DFFRHQX1 \dataout_reg[7]  ( .D(n696), .CK(clk), .RN(n789), .Q(n810) );
  DFFRHQX1 busy_reg ( .D(n700), .CK(clk), .RN(n789), .Q(n819) );
  DFFRHQX1 \dataout_reg[5]  ( .D(n694), .CK(clk), .RN(n789), .Q(n812) );
  DFFRHQX1 \dataout_reg[4]  ( .D(n693), .CK(clk), .RN(n789), .Q(n813) );
  DFFRHQX1 \dataout_reg[3]  ( .D(n692), .CK(clk), .RN(n789), .Q(n814) );
  DFFRHQX1 \dataout_reg[2]  ( .D(n691), .CK(clk), .RN(n789), .Q(n815) );
  DFFRHQX1 \dataout_reg[1]  ( .D(n690), .CK(clk), .RN(n789), .Q(n816) );
  DFFRHQX1 \dataout_reg[0]  ( .D(n689), .CK(clk), .RN(n789), .Q(n817) );
  DFFRX2 \img_counter_reg[2]  ( .D(n704), .CK(clk), .RN(n789), .Q(
        img_counter[2]), .QN(n370) );
  DFFRHQX1 \img_counter_reg[5]  ( .D(n710), .CK(clk), .RN(n789), .Q(
        img_counter[5]) );
  DFFRX2 \img_counter_reg[0]  ( .D(n711), .CK(clk), .RN(n776), .Q(
        img_counter[0]), .QN(n372) );
  DFFRX2 \img_counter_reg[4]  ( .D(n706), .CK(clk), .RN(n776), .Q(
        img_counter[4]), .QN(n368) );
  DFFRX2 \img_counter_reg[3]  ( .D(n705), .CK(clk), .RN(n776), .Q(
        img_counter[3]), .QN(n369) );
  DFFRX2 \img_counter_reg[1]  ( .D(n703), .CK(clk), .RN(n776), .Q(
        img_counter[1]), .QN(n371) );
  DFFRHQX1 \cmd_reg_reg[2]  ( .D(n709), .CK(clk), .RN(n789), .Q(cmd_reg[2]) );
  DFFRHQX1 \cmd_reg_reg[1]  ( .D(n707), .CK(clk), .RN(n789), .Q(cmd_reg[1]) );
  DFFRHQX1 \cmd_reg_reg[0]  ( .D(n708), .CK(clk), .RN(n789), .Q(cmd_reg[0]) );
  DFFSX2 \row_reg[1]  ( .D(n702), .CK(clk), .SN(n789), .Q(row[1]), .QN(n800)
         );
  NAND2X2 U396 ( .A(img_counter[3]), .B(row[0]), .Y(n803) );
  CMPR32X2 U397 ( .A(N165), .B(N164), .C(\mult_57/n2 ), .CO(\mult_57/n1 ), .S(
        N170) );
  CLKXOR2X2 U398 ( .A(img_counter[5]), .B(n802), .Y(N164) );
  OAI2BB1X1 U399 ( .A0N(n803), .A1N(n800), .B0(img_counter[4]), .Y(n804) );
  OAI21X1 U400 ( .A0(n803), .A1(n800), .B0(n804), .Y(n802) );
  XOR2X4 U401 ( .A(n800), .B(img_counter[4]), .Y(n805) );
  NAND2X1 U402 ( .A(img_counter[0]), .B(col[0]), .Y(n807) );
  NOR2X1 U403 ( .A(n786), .B(out_pos[4]), .Y(n591) );
  CLKINVX1 U404 ( .A(n734), .Y(n596) );
  CLKINVX1 U405 ( .A(n733), .Y(n597) );
  OR2X1 U406 ( .A(out_pos[4]), .B(n712), .Y(n733) );
  NOR2X2 U407 ( .A(n788), .B(out_pos[0]), .Y(n575) );
  NAND2X2 U408 ( .A(n596), .B(n775), .Y(n428) );
  OR2X1 U409 ( .A(out_pos[3]), .B(n787), .Y(n712) );
  CLKINVX1 U410 ( .A(img_counter[5]), .Y(n367) );
  INVXL U411 ( .A(n817), .Y(n713) );
  INVX12 U412 ( .A(n713), .Y(dataout[0]) );
  INVXL U413 ( .A(n816), .Y(n715) );
  INVX12 U414 ( .A(n715), .Y(dataout[1]) );
  INVXL U415 ( .A(n815), .Y(n717) );
  INVX12 U416 ( .A(n717), .Y(dataout[2]) );
  INVXL U417 ( .A(n814), .Y(n719) );
  INVX12 U418 ( .A(n719), .Y(dataout[3]) );
  INVXL U419 ( .A(n813), .Y(n721) );
  INVX12 U420 ( .A(n721), .Y(dataout[4]) );
  INVXL U421 ( .A(n812), .Y(n723) );
  INVX12 U422 ( .A(n723), .Y(dataout[5]) );
  INVXL U423 ( .A(n819), .Y(n725) );
  INVX12 U424 ( .A(n725), .Y(busy) );
  INVXL U425 ( .A(n810), .Y(n727) );
  INVX12 U426 ( .A(n727), .Y(dataout[7]) );
  INVXL U427 ( .A(n818), .Y(n729) );
  INVX12 U428 ( .A(n729), .Y(output_valid) );
  INVXL U429 ( .A(n811), .Y(n731) );
  INVX12 U430 ( .A(n731), .Y(dataout[6]) );
  INVX3 U431 ( .A(reset), .Y(n789) );
  INVXL U432 ( .A(cmd_reg[0]), .Y(n366) );
  INVXL U433 ( .A(cmd_reg[1]), .Y(n364) );
  INVXL U434 ( .A(cmd_reg[2]), .Y(n362) );
  XOR2X1 U435 ( .A(n803), .B(n805), .Y(N163) );
  ADDFX2 U436 ( .A(N169), .B(N175), .CI(\add_57_3/carry [3]), .CO(
        \add_57_3/carry [4]), .S(out_pos[3]) );
  XOR2X2 U437 ( .A(N170), .B(\add_57_3/carry [4]), .Y(out_pos[4]) );
  ADDFXL U438 ( .A(\mult_57/n3 ), .B(N163), .CI(N164), .CO(\mult_57/n2 ), .S(
        N169) );
  AND2X1 U439 ( .A(N170), .B(\add_57_3/carry [4]), .Y(\add_57_3/carry [5]) );
  NAND2BX4 U440 ( .AN(out_pos[5]), .B(n735), .Y(n734) );
  NOR3X1 U441 ( .A(out_pos[2]), .B(out_pos[4]), .C(out_pos[3]), .Y(n735) );
  AND2X2 U442 ( .A(n635), .B(n772), .Y(n770) );
  AND2X2 U443 ( .A(out_pos[4]), .B(out_pos[3]), .Y(n577) );
  AND2X2 U444 ( .A(n591), .B(n787), .Y(n589) );
  CLKXOR2X2 U445 ( .A(N171), .B(\add_57_3/carry [5]), .Y(out_pos[5]) );
  XOR2X1 U446 ( .A(img_counter[2]), .B(n806), .Y(N174) );
  NOR2BX4 U447 ( .AN(n609), .B(n633), .Y(n621) );
  AND2X2 U448 ( .A(n609), .B(n618), .Y(n612) );
  CLKAND2X3 U449 ( .A(n661), .B(n609), .Y(n654) );
  AND2X4 U450 ( .A(n609), .B(n643), .Y(n635) );
  AND2X2 U451 ( .A(out_pos[4]), .B(n786), .Y(n584) );
  NAND2X2 U452 ( .A(n596), .B(n773), .Y(n430) );
  NAND2X2 U453 ( .A(n596), .B(n774), .Y(n427) );
  NAND2X2 U454 ( .A(n596), .B(n575), .Y(n429) );
  XOR2XL U455 ( .A(n807), .B(n809), .Y(N173) );
  XOR2X1 U456 ( .A(img_counter[3]), .B(row[0]), .Y(N167) );
  AND2XL U457 ( .A(n802), .B(img_counter[5]), .Y(N165) );
  AND2XL U458 ( .A(n806), .B(img_counter[2]), .Y(N175) );
  AOI211XL U459 ( .A0(n601), .A1(col[0]), .B0(n602), .C0(n603), .Y(n599) );
  AOI211XL U460 ( .A0(col[0]), .A1(n604), .B0(n601), .C0(n600), .Y(n598) );
  NOR3XL U461 ( .A(n795), .B(col[1]), .C(col[0]), .Y(n602) );
  XOR2X1 U462 ( .A(img_counter[0]), .B(col[0]), .Y(out_pos[0]) );
  NOR3XL U463 ( .A(img_counter[3]), .B(img_counter[5]), .C(n368), .Y(n643) );
  NOR3XL U464 ( .A(img_counter[4]), .B(img_counter[5]), .C(img_counter[3]), 
        .Y(n661) );
  NOR3XL U465 ( .A(img_counter[3]), .B(img_counter[4]), .C(n367), .Y(n618) );
  NOR3XL U466 ( .A(img_counter[0]), .B(img_counter[2]), .C(n371), .Y(n613) );
  OAI32XL U467 ( .A0(n600), .A1(col[0]), .A2(n793), .B0(n792), .B1(n375), .Y(
        n699) );
  OAI32XL U468 ( .A0(n666), .A1(row[0]), .A2(n797), .B0(n791), .B1(n355), .Y(
        n701) );
  AOI211XL U469 ( .A0(n669), .A1(row[0]), .B0(n670), .C0(n603), .Y(n668) );
  AOI211XL U470 ( .A0(row[0]), .A1(n671), .B0(n669), .C0(n666), .Y(n665) );
  NOR3XL U471 ( .A(n798), .B(row[1]), .C(row[0]), .Y(n670) );
  OAI2BB1XL U472 ( .A0N(n677), .A1N(n674), .B0(img_counter[4]), .Y(n680) );
  NOR3X1 U473 ( .A(img_counter[0]), .B(img_counter[1]), .C(n370), .Y(n627) );
  NOR3X1 U474 ( .A(n372), .B(img_counter[1]), .C(n370), .Y(n625) );
  NOR3X1 U475 ( .A(n371), .B(img_counter[0]), .C(n370), .Y(n623) );
  NOR3X1 U476 ( .A(n372), .B(n371), .C(n370), .Y(n620) );
  XOR2XL U477 ( .A(\r422/carry [5]), .B(img_counter[5]), .Y(N252) );
  NAND3XL U478 ( .A(img_counter[4]), .B(n367), .C(img_counter[3]), .Y(n633) );
  NAND2X2 U479 ( .A(n573), .B(n773), .Y(n388) );
  NAND2X2 U480 ( .A(n589), .B(n775), .Y(n414) );
  NAND2X2 U481 ( .A(n589), .B(n773), .Y(n416) );
  NAND2X2 U482 ( .A(n582), .B(n773), .Y(n402) );
  NAND2X2 U483 ( .A(n573), .B(n775), .Y(n407) );
  NAND2X2 U484 ( .A(n582), .B(n775), .Y(n421) );
  NAND2X2 U485 ( .A(n774), .B(out_pos[5]), .Y(n393) );
  NAND2X2 U486 ( .A(out_pos[5]), .B(n773), .Y(n395) );
  NAND2X2 U487 ( .A(n775), .B(out_pos[5]), .Y(n396) );
  NAND2X2 U488 ( .A(n575), .B(out_pos[5]), .Y(n394) );
  NAND2X2 U489 ( .A(n597), .B(n774), .Y(n431) );
  NAND2X2 U490 ( .A(n571), .B(n773), .Y(n392) );
  NAND2X2 U491 ( .A(n571), .B(n775), .Y(n390) );
  NAND2X2 U492 ( .A(n582), .B(n575), .Y(n401) );
  NAND2X2 U493 ( .A(n583), .B(n774), .Y(n403) );
  NAND2X2 U494 ( .A(n583), .B(n575), .Y(n405) );
  NAND2X2 U495 ( .A(n590), .B(n775), .Y(n418) );
  NAND2X2 U496 ( .A(n597), .B(n775), .Y(n432) );
  NAND2X2 U497 ( .A(n571), .B(n774), .Y(n389) );
  NAND2X2 U498 ( .A(n571), .B(n575), .Y(n391) );
  NAND2X2 U499 ( .A(n583), .B(n775), .Y(n404) );
  NAND2X2 U500 ( .A(n583), .B(n773), .Y(n406) );
  NAND2X2 U501 ( .A(n589), .B(n575), .Y(n415) );
  NAND2X2 U502 ( .A(n590), .B(n774), .Y(n417) );
  NAND2X2 U503 ( .A(n590), .B(n575), .Y(n419) );
  NAND2X2 U504 ( .A(n597), .B(n575), .Y(n435) );
  NAND2X2 U505 ( .A(n573), .B(n774), .Y(n409) );
  NAND2X2 U506 ( .A(n590), .B(n773), .Y(n422) );
  NAND2X2 U507 ( .A(n597), .B(n773), .Y(n433) );
  NAND2X2 U508 ( .A(n582), .B(n774), .Y(n420) );
  NAND2X2 U509 ( .A(n573), .B(n575), .Y(n408) );
  NAND2X2 U510 ( .A(n589), .B(n774), .Y(n434) );
  AND2X2 U511 ( .A(n577), .B(n787), .Y(n573) );
  AND2X2 U512 ( .A(n584), .B(n787), .Y(n582) );
  CLKINVX1 U513 ( .A(out_pos[1]), .Y(n788) );
  CLKBUFX3 U514 ( .A(n574), .Y(n773) );
  NOR2X1 U515 ( .A(n788), .B(n785), .Y(n574) );
  CLKBUFX3 U516 ( .A(n576), .Y(n775) );
  NOR2X1 U517 ( .A(n785), .B(out_pos[1]), .Y(n576) );
  NAND2X1 U518 ( .A(n794), .B(n795), .Y(n605) );
  NAND2X1 U519 ( .A(n798), .B(n799), .Y(n667) );
  AND2X2 U520 ( .A(n627), .B(n621), .Y(n736) );
  AND2X2 U521 ( .A(n625), .B(n621), .Y(n737) );
  AND2X2 U522 ( .A(n623), .B(n621), .Y(n738) );
  AND2X2 U523 ( .A(n620), .B(n621), .Y(n739) );
  AND2X2 U524 ( .A(n645), .B(n617), .Y(n740) );
  AND2X2 U525 ( .A(n645), .B(n615), .Y(n741) );
  AND2X2 U526 ( .A(n645), .B(n772), .Y(n742) );
  AND2X2 U527 ( .A(n645), .B(n629), .Y(n743) );
  AND2X2 U528 ( .A(n645), .B(n627), .Y(n744) );
  AND2X2 U529 ( .A(n645), .B(n625), .Y(n745) );
  AND2X2 U530 ( .A(n645), .B(n623), .Y(n746) );
  AND2X2 U531 ( .A(n645), .B(n620), .Y(n747) );
  AND2X2 U532 ( .A(n621), .B(n617), .Y(n748) );
  AND2X2 U533 ( .A(n621), .B(n615), .Y(n749) );
  AND2X2 U534 ( .A(n621), .B(n772), .Y(n750) );
  AND2X2 U535 ( .A(n621), .B(n629), .Y(n751) );
  AND2X2 U536 ( .A(n635), .B(n617), .Y(n752) );
  AND2X2 U537 ( .A(n654), .B(n615), .Y(n753) );
  AND2X2 U538 ( .A(n654), .B(n629), .Y(n754) );
  AND2X2 U539 ( .A(n635), .B(n615), .Y(n755) );
  AND2X2 U540 ( .A(n635), .B(n629), .Y(n756) );
  AND2X2 U541 ( .A(n617), .B(n612), .Y(n757) );
  AND2X2 U542 ( .A(n654), .B(n623), .Y(n758) );
  AND2X2 U543 ( .A(n635), .B(n623), .Y(n759) );
  AND2X2 U544 ( .A(n654), .B(n627), .Y(n760) );
  AND2X2 U545 ( .A(n654), .B(n625), .Y(n761) );
  AND2X2 U546 ( .A(n635), .B(n627), .Y(n762) );
  AND2X2 U547 ( .A(n635), .B(n625), .Y(n763) );
  AND2X2 U548 ( .A(n615), .B(n612), .Y(n764) );
  AND3X2 U549 ( .A(n661), .B(n617), .C(n609), .Y(n765) );
  AND2X2 U550 ( .A(n609), .B(n610), .Y(n766) );
  AND2X2 U551 ( .A(n654), .B(n620), .Y(n767) );
  AND2X2 U552 ( .A(n635), .B(n620), .Y(n768) );
  AND2X2 U553 ( .A(n654), .B(n772), .Y(n769) );
  AND2X2 U554 ( .A(n612), .B(n772), .Y(n771) );
  AND2X2 U555 ( .A(n577), .B(out_pos[2]), .Y(n571) );
  AND2X2 U556 ( .A(n584), .B(out_pos[2]), .Y(n583) );
  AND2X2 U557 ( .A(n591), .B(out_pos[2]), .Y(n590) );
  CLKINVX1 U558 ( .A(out_pos[2]), .Y(n787) );
  CLKINVX1 U559 ( .A(out_pos[3]), .Y(n786) );
  CLKINVX1 U560 ( .A(out_pos[0]), .Y(n785) );
  CLKBUFX3 U561 ( .A(n572), .Y(n774) );
  NOR2X1 U562 ( .A(out_pos[0]), .B(out_pos[1]), .Y(n572) );
  INVX3 U563 ( .A(n378), .Y(n790) );
  CLKINVX1 U564 ( .A(n604), .Y(n795) );
  CLKINVX1 U565 ( .A(n671), .Y(n798) );
  CLKINVX1 U566 ( .A(n603), .Y(n796) );
  NAND2X1 U567 ( .A(n378), .B(n772), .Y(n679) );
  CLKINVX1 U568 ( .A(n601), .Y(n794) );
  CLKINVX1 U569 ( .A(n669), .Y(n799) );
  AND2X2 U570 ( .A(n618), .B(n629), .Y(n610) );
  NAND3BX1 U571 ( .AN(n664), .B(n772), .C(n643), .Y(n376) );
  CLKBUFX3 U572 ( .A(n789), .Y(n776) );
  OAI222XL U573 ( .A0(n394), .A1(n80), .B0(n395), .B1(n72), .C0(n396), .C1(n88), .Y(n384) );
  OAI222XL U574 ( .A0(n394), .A1(n79), .B0(n395), .B1(n71), .C0(n396), .C1(n87), .Y(n441) );
  OAI222XL U575 ( .A0(n394), .A1(n78), .B0(n395), .B1(n70), .C0(n396), .C1(n86), .Y(n462) );
  OAI222XL U576 ( .A0(n394), .A1(n77), .B0(n395), .B1(n69), .C0(n396), .C1(n85), .Y(n483) );
  OAI222XL U577 ( .A0(n394), .A1(n76), .B0(n395), .B1(n68), .C0(n396), .C1(n84), .Y(n504) );
  OAI222XL U578 ( .A0(n394), .A1(n75), .B0(n395), .B1(n67), .C0(n396), .C1(n83), .Y(n525) );
  OAI222XL U579 ( .A0(n394), .A1(n74), .B0(n395), .B1(n66), .C0(n396), .C1(n82), .Y(n546) );
  OAI222XL U580 ( .A0(n394), .A1(n73), .B0(n395), .B1(n65), .C0(n396), .C1(n81), .Y(n567) );
  OAI222XL U581 ( .A0(n407), .A1(n152), .B0(n408), .B1(n144), .C0(n409), .C1(
        n160), .Y(n397) );
  OAI222XL U582 ( .A0(n420), .A1(n224), .B0(n421), .B1(n216), .C0(n422), .C1(
        n232), .Y(n410) );
  OAI222XL U583 ( .A0(n407), .A1(n151), .B0(n408), .B1(n143), .C0(n409), .C1(
        n159), .Y(n445) );
  OAI222XL U584 ( .A0(n420), .A1(n223), .B0(n421), .B1(n215), .C0(n422), .C1(
        n231), .Y(n449) );
  OAI222XL U585 ( .A0(n407), .A1(n150), .B0(n408), .B1(n142), .C0(n409), .C1(
        n158), .Y(n466) );
  OAI222XL U586 ( .A0(n420), .A1(n222), .B0(n421), .B1(n214), .C0(n422), .C1(
        n230), .Y(n470) );
  OAI222XL U587 ( .A0(n407), .A1(n149), .B0(n408), .B1(n141), .C0(n409), .C1(
        n157), .Y(n487) );
  OAI222XL U588 ( .A0(n420), .A1(n221), .B0(n421), .B1(n213), .C0(n422), .C1(
        n229), .Y(n491) );
  OAI222XL U589 ( .A0(n407), .A1(n148), .B0(n408), .B1(n140), .C0(n409), .C1(
        n156), .Y(n508) );
  OAI222XL U590 ( .A0(n420), .A1(n220), .B0(n421), .B1(n212), .C0(n422), .C1(
        n228), .Y(n512) );
  OAI222XL U591 ( .A0(n407), .A1(n147), .B0(n408), .B1(n139), .C0(n409), .C1(
        n155), .Y(n529) );
  OAI222XL U592 ( .A0(n420), .A1(n219), .B0(n421), .B1(n211), .C0(n422), .C1(
        n227), .Y(n533) );
  OAI222XL U593 ( .A0(n407), .A1(n146), .B0(n408), .B1(n138), .C0(n409), .C1(
        n154), .Y(n550) );
  OAI222XL U594 ( .A0(n420), .A1(n218), .B0(n421), .B1(n210), .C0(n422), .C1(
        n226), .Y(n554) );
  OAI222XL U595 ( .A0(n407), .A1(n145), .B0(n408), .B1(n137), .C0(n409), .C1(
        n153), .Y(n578) );
  OAI222XL U596 ( .A0(n420), .A1(n217), .B0(n421), .B1(n209), .C0(n422), .C1(
        n225), .Y(n585) );
  OAI22XL U597 ( .A0(n427), .A1(n352), .B0(n428), .B1(n344), .Y(n426) );
  OAI22XL U598 ( .A0(n427), .A1(n351), .B0(n428), .B1(n343), .Y(n456) );
  OAI22XL U599 ( .A0(n427), .A1(n350), .B0(n428), .B1(n342), .Y(n477) );
  OAI22XL U600 ( .A0(n427), .A1(n349), .B0(n428), .B1(n341), .Y(n498) );
  OAI22XL U601 ( .A0(n427), .A1(n348), .B0(n428), .B1(n340), .Y(n519) );
  OAI22XL U602 ( .A0(n427), .A1(n347), .B0(n428), .B1(n339), .Y(n540) );
  OAI22XL U603 ( .A0(n427), .A1(n346), .B0(n428), .B1(n338), .Y(n561) );
  OAI22XL U604 ( .A0(n427), .A1(n345), .B0(n428), .B1(n337), .Y(n595) );
  OAI22XL U605 ( .A0(n414), .A1(n280), .B0(n415), .B1(n272), .Y(n413) );
  OAI22XL U606 ( .A0(n414), .A1(n279), .B0(n415), .B1(n271), .Y(n452) );
  OAI22XL U607 ( .A0(n414), .A1(n278), .B0(n415), .B1(n270), .Y(n473) );
  OAI22XL U608 ( .A0(n414), .A1(n277), .B0(n415), .B1(n269), .Y(n494) );
  OAI22XL U609 ( .A0(n414), .A1(n276), .B0(n415), .B1(n268), .Y(n515) );
  OAI22XL U610 ( .A0(n414), .A1(n275), .B0(n415), .B1(n267), .Y(n536) );
  OAI22XL U611 ( .A0(n414), .A1(n274), .B0(n415), .B1(n266), .Y(n557) );
  OAI22XL U612 ( .A0(n414), .A1(n273), .B0(n415), .B1(n265), .Y(n588) );
  OAI22XL U613 ( .A0(n401), .A1(n208), .B0(n402), .B1(n200), .Y(n400) );
  OAI22XL U614 ( .A0(n401), .A1(n207), .B0(n402), .B1(n199), .Y(n448) );
  OAI22XL U615 ( .A0(n401), .A1(n206), .B0(n402), .B1(n198), .Y(n469) );
  OAI22XL U616 ( .A0(n401), .A1(n205), .B0(n402), .B1(n197), .Y(n490) );
  OAI22XL U617 ( .A0(n401), .A1(n204), .B0(n402), .B1(n196), .Y(n511) );
  OAI22XL U618 ( .A0(n401), .A1(n203), .B0(n402), .B1(n195), .Y(n532) );
  OAI22XL U619 ( .A0(n401), .A1(n202), .B0(n402), .B1(n194), .Y(n553) );
  OAI22XL U620 ( .A0(n401), .A1(n201), .B0(n402), .B1(n193), .Y(n581) );
  OAI22XL U621 ( .A0(n418), .A1(n248), .B0(n419), .B1(n240), .Y(n411) );
  OAI22XL U622 ( .A0(n418), .A1(n247), .B0(n419), .B1(n239), .Y(n450) );
  OAI22XL U623 ( .A0(n418), .A1(n246), .B0(n419), .B1(n238), .Y(n471) );
  OAI22XL U624 ( .A0(n418), .A1(n245), .B0(n419), .B1(n237), .Y(n492) );
  OAI22XL U625 ( .A0(n418), .A1(n244), .B0(n419), .B1(n236), .Y(n513) );
  OAI22XL U626 ( .A0(n418), .A1(n243), .B0(n419), .B1(n235), .Y(n534) );
  OAI22XL U627 ( .A0(n418), .A1(n242), .B0(n419), .B1(n234), .Y(n555) );
  OAI22XL U628 ( .A0(n418), .A1(n241), .B0(n419), .B1(n233), .Y(n586) );
  OAI22XL U629 ( .A0(n403), .A1(n192), .B0(n404), .B1(n184), .Y(n399) );
  OAI22XL U630 ( .A0(n416), .A1(n264), .B0(n417), .B1(n256), .Y(n412) );
  OAI22XL U631 ( .A0(n403), .A1(n191), .B0(n404), .B1(n183), .Y(n447) );
  OAI22XL U632 ( .A0(n416), .A1(n263), .B0(n417), .B1(n255), .Y(n451) );
  OAI22XL U633 ( .A0(n403), .A1(n190), .B0(n404), .B1(n182), .Y(n468) );
  OAI22XL U634 ( .A0(n416), .A1(n262), .B0(n417), .B1(n254), .Y(n472) );
  OAI22XL U635 ( .A0(n403), .A1(n189), .B0(n404), .B1(n181), .Y(n489) );
  OAI22XL U636 ( .A0(n416), .A1(n261), .B0(n417), .B1(n253), .Y(n493) );
  OAI22XL U637 ( .A0(n403), .A1(n188), .B0(n404), .B1(n180), .Y(n510) );
  OAI22XL U638 ( .A0(n416), .A1(n260), .B0(n417), .B1(n252), .Y(n514) );
  OAI22XL U639 ( .A0(n403), .A1(n187), .B0(n404), .B1(n179), .Y(n531) );
  OAI22XL U640 ( .A0(n416), .A1(n259), .B0(n417), .B1(n251), .Y(n535) );
  OAI22XL U641 ( .A0(n403), .A1(n186), .B0(n404), .B1(n178), .Y(n552) );
  OAI22XL U642 ( .A0(n416), .A1(n258), .B0(n417), .B1(n250), .Y(n556) );
  OAI22XL U643 ( .A0(n403), .A1(n185), .B0(n404), .B1(n177), .Y(n580) );
  OAI22XL U644 ( .A0(n416), .A1(n257), .B0(n417), .B1(n249), .Y(n587) );
  OAI22XL U645 ( .A0(n405), .A1(n176), .B0(n406), .B1(n168), .Y(n398) );
  OAI22XL U646 ( .A0(n405), .A1(n175), .B0(n406), .B1(n167), .Y(n446) );
  OAI22XL U647 ( .A0(n405), .A1(n174), .B0(n406), .B1(n166), .Y(n467) );
  OAI22XL U648 ( .A0(n405), .A1(n173), .B0(n406), .B1(n165), .Y(n488) );
  OAI22XL U649 ( .A0(n405), .A1(n172), .B0(n406), .B1(n164), .Y(n509) );
  OAI22XL U650 ( .A0(n405), .A1(n171), .B0(n406), .B1(n163), .Y(n530) );
  OAI22XL U651 ( .A0(n405), .A1(n170), .B0(n406), .B1(n162), .Y(n551) );
  OAI22XL U652 ( .A0(n405), .A1(n169), .B0(n406), .B1(n161), .Y(n579) );
  NOR4X1 U653 ( .A(n384), .B(n385), .C(n386), .D(n387), .Y(n383) );
  OAI22XL U654 ( .A0(n390), .A1(n120), .B0(n391), .B1(n112), .Y(n386) );
  OAI22XL U655 ( .A0(n388), .A1(n136), .B0(n389), .B1(n128), .Y(n387) );
  OAI22XL U656 ( .A0(n392), .A1(n104), .B0(n393), .B1(n96), .Y(n385) );
  NOR4X1 U657 ( .A(n441), .B(n442), .C(n443), .D(n444), .Y(n440) );
  OAI22XL U658 ( .A0(n390), .A1(n119), .B0(n391), .B1(n111), .Y(n443) );
  OAI22XL U659 ( .A0(n388), .A1(n135), .B0(n389), .B1(n127), .Y(n444) );
  OAI22XL U660 ( .A0(n392), .A1(n103), .B0(n393), .B1(n95), .Y(n442) );
  NOR4X1 U661 ( .A(n462), .B(n463), .C(n464), .D(n465), .Y(n461) );
  OAI22XL U662 ( .A0(n390), .A1(n118), .B0(n391), .B1(n110), .Y(n464) );
  OAI22XL U663 ( .A0(n388), .A1(n134), .B0(n389), .B1(n126), .Y(n465) );
  OAI22XL U664 ( .A0(n392), .A1(n102), .B0(n393), .B1(n94), .Y(n463) );
  NOR4X1 U665 ( .A(n483), .B(n484), .C(n485), .D(n486), .Y(n482) );
  OAI22XL U666 ( .A0(n390), .A1(n117), .B0(n391), .B1(n109), .Y(n485) );
  OAI22XL U667 ( .A0(n388), .A1(n133), .B0(n389), .B1(n125), .Y(n486) );
  OAI22XL U668 ( .A0(n392), .A1(n101), .B0(n393), .B1(n93), .Y(n484) );
  NOR4X1 U669 ( .A(n504), .B(n505), .C(n506), .D(n507), .Y(n503) );
  OAI22XL U670 ( .A0(n390), .A1(n116), .B0(n391), .B1(n108), .Y(n506) );
  OAI22XL U671 ( .A0(n388), .A1(n132), .B0(n389), .B1(n124), .Y(n507) );
  OAI22XL U672 ( .A0(n392), .A1(n100), .B0(n393), .B1(n92), .Y(n505) );
  NOR4X1 U673 ( .A(n525), .B(n526), .C(n527), .D(n528), .Y(n524) );
  OAI22XL U674 ( .A0(n390), .A1(n115), .B0(n391), .B1(n107), .Y(n527) );
  OAI22XL U675 ( .A0(n388), .A1(n131), .B0(n389), .B1(n123), .Y(n528) );
  OAI22XL U676 ( .A0(n392), .A1(n99), .B0(n393), .B1(n91), .Y(n526) );
  NOR4X1 U677 ( .A(n546), .B(n547), .C(n548), .D(n549), .Y(n545) );
  OAI22XL U678 ( .A0(n390), .A1(n114), .B0(n391), .B1(n106), .Y(n548) );
  OAI22XL U679 ( .A0(n388), .A1(n130), .B0(n389), .B1(n122), .Y(n549) );
  OAI22XL U680 ( .A0(n392), .A1(n98), .B0(n393), .B1(n90), .Y(n547) );
  NOR4X1 U681 ( .A(n567), .B(n568), .C(n569), .D(n570), .Y(n566) );
  OAI22XL U682 ( .A0(n390), .A1(n113), .B0(n391), .B1(n105), .Y(n569) );
  OAI22XL U683 ( .A0(n388), .A1(n129), .B0(n389), .B1(n121), .Y(n570) );
  OAI22XL U684 ( .A0(n392), .A1(n97), .B0(n393), .B1(n89), .Y(n568) );
  NOR4X1 U685 ( .A(n423), .B(n424), .C(n425), .D(n426), .Y(n380) );
  OAI222XL U686 ( .A0(n433), .A1(n296), .B0(n434), .B1(n288), .C0(n435), .C1(
        n304), .Y(n423) );
  OAI22XL U687 ( .A0(n431), .A1(n320), .B0(n432), .B1(n312), .Y(n424) );
  OAI22XL U688 ( .A0(n429), .A1(n336), .B0(n430), .B1(n328), .Y(n425) );
  NOR4X1 U689 ( .A(n453), .B(n454), .C(n455), .D(n456), .Y(n437) );
  OAI222XL U690 ( .A0(n433), .A1(n295), .B0(n434), .B1(n287), .C0(n435), .C1(
        n303), .Y(n453) );
  OAI22XL U691 ( .A0(n431), .A1(n319), .B0(n432), .B1(n311), .Y(n454) );
  OAI22XL U692 ( .A0(n429), .A1(n335), .B0(n430), .B1(n327), .Y(n455) );
  NOR4X1 U693 ( .A(n474), .B(n475), .C(n476), .D(n477), .Y(n458) );
  OAI222XL U694 ( .A0(n433), .A1(n294), .B0(n434), .B1(n286), .C0(n435), .C1(
        n302), .Y(n474) );
  OAI22XL U695 ( .A0(n431), .A1(n318), .B0(n432), .B1(n310), .Y(n475) );
  OAI22XL U696 ( .A0(n429), .A1(n334), .B0(n430), .B1(n326), .Y(n476) );
  NOR4X1 U697 ( .A(n495), .B(n496), .C(n497), .D(n498), .Y(n479) );
  OAI222XL U698 ( .A0(n433), .A1(n293), .B0(n434), .B1(n285), .C0(n435), .C1(
        n301), .Y(n495) );
  OAI22XL U699 ( .A0(n431), .A1(n317), .B0(n432), .B1(n309), .Y(n496) );
  OAI22XL U700 ( .A0(n429), .A1(n333), .B0(n430), .B1(n325), .Y(n497) );
  NOR4X1 U701 ( .A(n516), .B(n517), .C(n518), .D(n519), .Y(n500) );
  OAI222XL U702 ( .A0(n433), .A1(n292), .B0(n434), .B1(n284), .C0(n435), .C1(
        n300), .Y(n516) );
  OAI22XL U703 ( .A0(n431), .A1(n316), .B0(n432), .B1(n308), .Y(n517) );
  OAI22XL U704 ( .A0(n429), .A1(n332), .B0(n430), .B1(n324), .Y(n518) );
  NOR4X1 U705 ( .A(n537), .B(n538), .C(n539), .D(n540), .Y(n521) );
  OAI222XL U706 ( .A0(n433), .A1(n291), .B0(n434), .B1(n283), .C0(n435), .C1(
        n299), .Y(n537) );
  OAI22XL U707 ( .A0(n431), .A1(n315), .B0(n432), .B1(n307), .Y(n538) );
  OAI22XL U708 ( .A0(n429), .A1(n331), .B0(n430), .B1(n323), .Y(n539) );
  NOR4X1 U709 ( .A(n558), .B(n559), .C(n560), .D(n561), .Y(n542) );
  OAI222XL U710 ( .A0(n433), .A1(n290), .B0(n434), .B1(n282), .C0(n435), .C1(
        n298), .Y(n558) );
  OAI22XL U711 ( .A0(n431), .A1(n314), .B0(n432), .B1(n306), .Y(n559) );
  OAI22XL U712 ( .A0(n429), .A1(n330), .B0(n430), .B1(n322), .Y(n560) );
  NOR4X1 U713 ( .A(n592), .B(n593), .C(n594), .D(n595), .Y(n563) );
  OAI222XL U714 ( .A0(n433), .A1(n289), .B0(n434), .B1(n281), .C0(n435), .C1(
        n297), .Y(n592) );
  OAI22XL U715 ( .A0(n431), .A1(n313), .B0(n432), .B1(n305), .Y(n593) );
  OAI22XL U716 ( .A0(n429), .A1(n329), .B0(n430), .B1(n321), .Y(n594) );
  AO22XL U717 ( .A0(dataout[0]), .A1(n790), .B0(n378), .B1(n379), .Y(n689) );
  NAND4X1 U718 ( .A(n380), .B(n381), .C(n382), .D(n383), .Y(n379) );
  NOR4X1 U719 ( .A(n410), .B(n411), .C(n412), .D(n413), .Y(n381) );
  NOR4X1 U720 ( .A(n397), .B(n398), .C(n399), .D(n400), .Y(n382) );
  AO22XL U721 ( .A0(dataout[1]), .A1(n790), .B0(n378), .B1(n436), .Y(n690) );
  NAND4X1 U722 ( .A(n437), .B(n438), .C(n439), .D(n440), .Y(n436) );
  NOR4X1 U723 ( .A(n449), .B(n450), .C(n451), .D(n452), .Y(n438) );
  NOR4X1 U724 ( .A(n445), .B(n446), .C(n447), .D(n448), .Y(n439) );
  AO22XL U725 ( .A0(dataout[2]), .A1(n790), .B0(n378), .B1(n457), .Y(n691) );
  NAND4X1 U726 ( .A(n458), .B(n459), .C(n460), .D(n461), .Y(n457) );
  NOR4X1 U727 ( .A(n470), .B(n471), .C(n472), .D(n473), .Y(n459) );
  NOR4X1 U728 ( .A(n466), .B(n467), .C(n468), .D(n469), .Y(n460) );
  AO22XL U729 ( .A0(dataout[3]), .A1(n790), .B0(n378), .B1(n478), .Y(n692) );
  NAND4X1 U730 ( .A(n479), .B(n480), .C(n481), .D(n482), .Y(n478) );
  NOR4X1 U731 ( .A(n491), .B(n492), .C(n493), .D(n494), .Y(n480) );
  NOR4X1 U732 ( .A(n487), .B(n488), .C(n489), .D(n490), .Y(n481) );
  AO22XL U733 ( .A0(dataout[4]), .A1(n790), .B0(n378), .B1(n499), .Y(n693) );
  NAND4X1 U734 ( .A(n500), .B(n501), .C(n502), .D(n503), .Y(n499) );
  NOR4X1 U735 ( .A(n512), .B(n513), .C(n514), .D(n515), .Y(n501) );
  NOR4X1 U736 ( .A(n508), .B(n509), .C(n510), .D(n511), .Y(n502) );
  AO22XL U737 ( .A0(dataout[5]), .A1(n790), .B0(n378), .B1(n520), .Y(n694) );
  NAND4X1 U738 ( .A(n521), .B(n522), .C(n523), .D(n524), .Y(n520) );
  NOR4X1 U739 ( .A(n533), .B(n534), .C(n535), .D(n536), .Y(n522) );
  NOR4X1 U740 ( .A(n529), .B(n530), .C(n531), .D(n532), .Y(n523) );
  AO22XL U741 ( .A0(dataout[6]), .A1(n790), .B0(n378), .B1(n541), .Y(n695) );
  NAND4X1 U742 ( .A(n542), .B(n543), .C(n544), .D(n545), .Y(n541) );
  NOR4X1 U743 ( .A(n554), .B(n555), .C(n556), .D(n557), .Y(n543) );
  NOR4X1 U744 ( .A(n550), .B(n551), .C(n552), .D(n553), .Y(n544) );
  AO22X1 U745 ( .A0(n378), .A1(n562), .B0(dataout[7]), .B1(n790), .Y(n696) );
  NAND4X1 U746 ( .A(n563), .B(n564), .C(n565), .D(n566), .Y(n562) );
  NOR4X1 U747 ( .A(n585), .B(n586), .C(n587), .D(n588), .Y(n564) );
  NOR4X1 U748 ( .A(n578), .B(n579), .C(n580), .D(n581), .Y(n565) );
  NAND2X1 U749 ( .A(n377), .B(n683), .Y(n681) );
  OAI31XL U750 ( .A0(n605), .A1(n610), .A2(n667), .B0(cur_state), .Y(n683) );
  XOR2X1 U751 ( .A(n801), .B(img_counter[1]), .Y(n809) );
  OAI21XL U752 ( .A0(n807), .A1(n801), .B0(n808), .Y(n806) );
  OAI2BB1X1 U753 ( .A0N(n807), .A1N(n801), .B0(img_counter[1]), .Y(n808) );
  NAND2X1 U754 ( .A(cmd_valid), .B(n64), .Y(n377) );
  OAI2BB2XL U755 ( .B0(cur_state), .B1(n663), .A0N(busy), .A1N(n663), .Y(n700)
         );
  OA21XL U756 ( .A0(n64), .A1(n376), .B0(n377), .Y(n663) );
  OAI2BB2XL U757 ( .B0(n362), .B1(n681), .A0N(cmd[2]), .A1N(n682), .Y(n709) );
  OAI2BB2XL U758 ( .B0(n366), .B1(n681), .A0N(cmd[0]), .A1N(n682), .Y(n708) );
  OAI2BB2XL U759 ( .B0(n364), .B1(n681), .A0N(cmd[1]), .A1N(n682), .Y(n707) );
  AND2X2 U760 ( .A(n681), .B(n64), .Y(n682) );
  OAI2BB1X1 U761 ( .A0N(n376), .A1N(cur_state), .B0(n377), .Y(next_state) );
  ADDFX2 U762 ( .A(N168), .B(N174), .CI(\add_57_3/carry [2]), .CO(
        \add_57_3/carry [3]), .S(out_pos[2]) );
  CLKBUFX3 U763 ( .A(datain[0]), .Y(n777) );
  CLKBUFX3 U764 ( .A(datain[1]), .Y(n778) );
  CLKBUFX3 U765 ( .A(datain[2]), .Y(n779) );
  CLKBUFX3 U766 ( .A(datain[3]), .Y(n780) );
  CLKBUFX3 U767 ( .A(datain[4]), .Y(n781) );
  CLKBUFX3 U768 ( .A(datain[5]), .Y(n782) );
  CLKBUFX3 U769 ( .A(datain[6]), .Y(n783) );
  CLKBUFX3 U770 ( .A(datain[7]), .Y(n784) );
  OAI31X1 U771 ( .A0(n606), .A1(n603), .A2(n607), .B0(cur_state), .Y(n600) );
  OAI22XL U772 ( .A0(n801), .A1(n795), .B0(n375), .B1(n795), .Y(n606) );
  OAI22XL U773 ( .A0(col[1]), .A1(n794), .B0(col[0]), .B1(n794), .Y(n607) );
  OAI31X1 U774 ( .A0(n672), .A1(n603), .A2(n673), .B0(cur_state), .Y(n666) );
  OAI22XL U775 ( .A0(n800), .A1(n798), .B0(n355), .B1(n798), .Y(n672) );
  OAI22XL U776 ( .A0(row[1]), .A1(n799), .B0(row[0]), .B1(n799), .Y(n673) );
  NOR2X4 U777 ( .A(n64), .B(n664), .Y(n378) );
  NOR3X2 U778 ( .A(n371), .B(img_counter[2]), .C(n372), .Y(n629) );
  NOR3X2 U779 ( .A(cmd_reg[1]), .B(cmd_reg[2]), .C(n366), .Y(n603) );
  CLKINVX1 U780 ( .A(n605), .Y(n793) );
  CLKINVX1 U781 ( .A(n600), .Y(n792) );
  CLKINVX1 U782 ( .A(n667), .Y(n797) );
  CLKINVX1 U783 ( .A(n666), .Y(n791) );
  NAND2X1 U784 ( .A(n684), .B(n362), .Y(n664) );
  OAI211X1 U785 ( .A0(n367), .A1(n674), .B0(n685), .C0(n686), .Y(n710) );
  AO21X1 U786 ( .A0(n633), .A1(n687), .B0(n679), .Y(n686) );
  NAND2X1 U787 ( .A(N252), .B(n675), .Y(n685) );
  OAI21XL U788 ( .A0(n368), .A1(n369), .B0(img_counter[5]), .Y(n687) );
  NOR3X1 U789 ( .A(cmd_reg[0]), .B(cmd_reg[2]), .C(n364), .Y(n601) );
  NOR2X1 U790 ( .A(cmd_reg[1]), .B(cmd_reg[0]), .Y(n684) );
  OAI22XL U791 ( .A0(n598), .A1(n801), .B0(n599), .B1(n600), .Y(n698) );
  OAI22XL U792 ( .A0(n665), .A1(n800), .B0(n668), .B1(n666), .Y(n702) );
  NOR2X1 U793 ( .A(n362), .B(n684), .Y(n669) );
  NOR3X1 U794 ( .A(n366), .B(cmd_reg[2]), .C(n364), .Y(n604) );
  AND2X2 U795 ( .A(cmd_reg[2]), .B(n684), .Y(n671) );
  NAND3X1 U796 ( .A(n772), .B(n369), .C(n378), .Y(n677) );
  AO21XL U797 ( .A0(output_valid), .A1(cur_state), .B0(n378), .Y(n697) );
  ADDHXL U798 ( .A(img_counter[1]), .B(img_counter[0]), .CO(\r422/carry [2]), 
        .S(N248) );
  ADDHXL U799 ( .A(img_counter[3]), .B(\r422/carry [3]), .CO(\r422/carry [4]), 
        .S(N250) );
  ADDHXL U800 ( .A(img_counter[2]), .B(\r422/carry [2]), .CO(\r422/carry [3]), 
        .S(N249) );
  ADDHXL U801 ( .A(img_counter[4]), .B(\r422/carry [4]), .CO(\r422/carry [5]), 
        .S(N251) );
  AO21X1 U802 ( .A0(N251), .A1(n675), .B0(n678), .Y(n706) );
  OAI31XL U803 ( .A0(n679), .A1(img_counter[4]), .A2(n369), .B0(n680), .Y(n678) );
  NOR3X2 U804 ( .A(img_counter[1]), .B(img_counter[2]), .C(img_counter[0]), 
        .Y(n617) );
  NOR3X2 U805 ( .A(img_counter[1]), .B(img_counter[2]), .C(n372), .Y(n615) );
  NAND3X1 U806 ( .A(n796), .B(n664), .C(cur_state), .Y(n674) );
  OAI211X1 U807 ( .A0(n369), .A1(n674), .B0(n676), .C0(n677), .Y(n705) );
  NAND2X1 U808 ( .A(N250), .B(n675), .Y(n676) );
  AND2X2 U809 ( .A(n688), .B(cur_state), .Y(n675) );
  OAI22XL U810 ( .A0(n610), .A1(n796), .B0(n772), .B1(n664), .Y(n688) );
  OAI2BB2XL U811 ( .B0(n371), .B1(n674), .A0N(N248), .A1N(n675), .Y(n703) );
  OAI2BB2XL U812 ( .B0(n372), .B1(n674), .A0N(n372), .A1N(n675), .Y(n711) );
  OAI2BB2XL U813 ( .B0(n370), .B1(n674), .A0N(N249), .A1N(n675), .Y(n704) );
  CLKBUFX3 U814 ( .A(n613), .Y(n772) );
  AND2X1 U815 ( .A(N173), .B(N167), .Y(\add_57_3/carry [2]) );
  XOR2X1 U816 ( .A(N173), .B(N167), .Y(out_pos[1]) );
  XOR2X1 U817 ( .A(\mult_57/n1 ), .B(N165), .Y(N171) );
endmodule


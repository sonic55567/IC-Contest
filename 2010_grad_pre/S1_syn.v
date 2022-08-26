/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : Q-2019.12
// Date      : Wed Mar  2 20:32:56 2022
/////////////////////////////////////////////////////////////


module S1 ( clk, rst, updown, S1_done, RB1_RW, RB1_A, RB1_D, RB1_Q, sen, sd );
  output [4:0] RB1_A;
  output [7:0] RB1_D;
  input [7:0] RB1_Q;
  input clk, rst, updown;
  output S1_done, RB1_RW;
  inout sen,  sd;
  wire   N33, N34, N35, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, sen_reg, sd_reg, N119, N121, N122, N123, N124, n5,
         n6, n7, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n23, n25, n26, n27, n28, n29, n30, n31, n34, n35, n36, n37, n41,
         n45, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n64, n65, n66, n67, n70, n71, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n90, n92, n94, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n122, n123,
         n124, n125, n126, n127, n128, n129, n130, n131, n132, n133, n134,
         n135, n136, n137, n138, n139, n140, n141, n142, n143, n144, n145,
         n146, n147, n148, n149, n150, n151, n152, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182,
         n183, n184, n185, n186, n187, n188, n189, n190, n191, n192, n193;
  wire   [2:0] state;

  TBUFX16 sd_tri ( .A(sd_reg), .OE(n187), .Y(sd) );
  TBUFX16 sen_tri ( .A(sen_reg), .OE(n187), .Y(sen) );
  DFFRX1 \S2_A_reg[0]  ( .D(n145), .CK(clk), .RN(n186), .QN(n74) );
  DFFRX1 \S2_A_reg[2]  ( .D(n143), .CK(clk), .RN(n173), .QN(n76) );
  DFFRX1 \S2_A_reg[1]  ( .D(n141), .CK(clk), .RN(n186), .QN(n75) );
  DFFSX1 sen_reg_reg ( .D(n115), .CK(clk), .SN(n186), .Q(sen_reg) );
  DFFRX1 \count_reg[3]  ( .D(n111), .CK(clk), .RN(n186), .Q(n152), .QN(n77) );
  DFFRX1 \RB1_A_reg[0]  ( .D(n124), .CK(clk), .RN(n186), .Q(n197), .QN(n98) );
  DFFRX1 \RB1_A_reg[2]  ( .D(n150), .CK(clk), .RN(n173), .Q(n196), .QN(n87) );
  DFFSX1 RB1_RW_reg ( .D(n99), .CK(clk), .SN(n173), .QN(n151) );
  DFFRX1 \RB1_D_reg[0]  ( .D(n140), .CK(clk), .RN(n173), .Q(n205), .QN(n78) );
  DFFRX1 \RB1_D_reg[1]  ( .D(n147), .CK(clk), .RN(n173), .Q(n204), .QN(n79) );
  DFFRX1 \RB1_D_reg[2]  ( .D(n126), .CK(clk), .RN(n173), .Q(n203), .QN(n80) );
  DFFRX1 \RB1_D_reg[3]  ( .D(n128), .CK(clk), .RN(n173), .Q(n202), .QN(n81) );
  DFFRX1 \RB1_D_reg[4]  ( .D(n149), .CK(clk), .RN(n173), .Q(n201), .QN(n82) );
  DFFRX1 \RB1_D_reg[5]  ( .D(n130), .CK(clk), .RN(n186), .Q(n200), .QN(n83) );
  DFFRX1 \RB1_D_reg[6]  ( .D(n132), .CK(clk), .RN(n186), .Q(n199), .QN(n84) );
  DFFRX1 \RB1_D_reg[7]  ( .D(n134), .CK(clk), .RN(n186), .Q(n198), .QN(n85) );
  DFFRX1 S1_done_reg ( .D(n136), .CK(clk), .RN(n173), .Q(n194), .QN(n90) );
  DFFRX1 \RB1_A_reg[4]  ( .D(n137), .CK(clk), .RN(n173), .Q(n195), .QN(n97) );
  DFFRX1 \state_reg[2]  ( .D(n120), .CK(clk), .RN(n186), .Q(state[2]), .QN(
        n192) );
  DFFRX1 \state_reg[0]  ( .D(n122), .CK(clk), .RN(n186), .Q(state[0]), .QN(
        n190) );
  DFFRX1 \state_reg[1]  ( .D(n188), .CK(clk), .RN(n186), .Q(state[1]), .QN(
        n191) );
  DFFRX1 sd_reg_reg ( .D(n116), .CK(clk), .RN(n186), .Q(sd_reg) );
  DFFSX1 \count_reg[2]  ( .D(n112), .CK(clk), .SN(n186), .Q(N35), .QN(n94) );
  DFFSX1 \count_reg[1]  ( .D(n113), .CK(clk), .SN(n186), .Q(N34), .QN(n184) );
  DFFSX2 \count_reg[0]  ( .D(n138), .CK(clk), .SN(n186), .Q(N33), .QN(n185) );
  DFFRX1 \RB1_A_reg[3]  ( .D(n108), .CK(clk), .RN(n186), .QN(n86) );
  DFFRX1 \RB1_A_reg[1]  ( .D(n110), .CK(clk), .RN(n186), .QN(n88) );
  INVXL U101 ( .A(n105), .Y(n125) );
  CLKINVX1 U102 ( .A(n125), .Y(n126) );
  INVXL U103 ( .A(n104), .Y(n127) );
  CLKINVX1 U104 ( .A(n127), .Y(n128) );
  INVXL U105 ( .A(n102), .Y(n129) );
  CLKINVX1 U106 ( .A(n129), .Y(n130) );
  INVXL U107 ( .A(n101), .Y(n131) );
  CLKINVX1 U108 ( .A(n131), .Y(n132) );
  INVXL U109 ( .A(n100), .Y(n133) );
  CLKINVX1 U110 ( .A(n133), .Y(n134) );
  INVXL U111 ( .A(n92), .Y(n135) );
  CLKINVX1 U112 ( .A(n135), .Y(n136) );
  NAND2XL U113 ( .A(n90), .B(n5), .Y(n92) );
  BUFX2 U114 ( .A(n123), .Y(n137) );
  INVXL U115 ( .A(n65), .Y(n188) );
  AOI32XL U116 ( .A0(state[0]), .A1(n192), .A2(n191), .B0(n122), .B1(state[1]), 
        .Y(n65) );
  BUFX2 U117 ( .A(n114), .Y(n138) );
  INVXL U118 ( .A(n107), .Y(n139) );
  CLKINVX1 U119 ( .A(n139), .Y(n140) );
  BUFX2 U120 ( .A(n118), .Y(n141) );
  XOR2XL U121 ( .A(n59), .B(n75), .Y(n118) );
  CLKINVX1 U122 ( .A(n117), .Y(n142) );
  CLKINVX1 U123 ( .A(n142), .Y(n143) );
  XNOR2XL U124 ( .A(n76), .B(n58), .Y(n117) );
  CLKINVX1 U125 ( .A(n119), .Y(n144) );
  CLKINVX1 U126 ( .A(n144), .Y(n145) );
  XNOR2XL U127 ( .A(n74), .B(n52), .Y(n119) );
  INVXL U128 ( .A(n106), .Y(n146) );
  CLKINVX1 U129 ( .A(n146), .Y(n147) );
  INVXL U130 ( .A(n103), .Y(n148) );
  CLKINVX1 U131 ( .A(n148), .Y(n149) );
  BUFX2 U132 ( .A(n109), .Y(n150) );
  CLKINVX1 U133 ( .A(n196), .Y(n177) );
  INVX3 U134 ( .A(rst), .Y(n186) );
  INVX16 U135 ( .A(n86), .Y(RB1_A[3]) );
  INVX16 U136 ( .A(n88), .Y(RB1_A[1]) );
  INVX16 U137 ( .A(n151), .Y(RB1_RW) );
  BUFX12 U138 ( .A(n195), .Y(RB1_A[4]) );
  BUFX12 U139 ( .A(n194), .Y(S1_done) );
  BUFX12 U140 ( .A(n198), .Y(RB1_D[7]) );
  BUFX12 U141 ( .A(n199), .Y(RB1_D[6]) );
  BUFX12 U142 ( .A(n200), .Y(RB1_D[5]) );
  BUFX12 U143 ( .A(n201), .Y(RB1_D[4]) );
  BUFX12 U144 ( .A(n202), .Y(RB1_D[3]) );
  BUFX12 U145 ( .A(n203), .Y(RB1_D[2]) );
  BUFX12 U146 ( .A(n204), .Y(RB1_D[1]) );
  BUFX12 U147 ( .A(n205), .Y(RB1_D[0]) );
  INVX12 U148 ( .A(n177), .Y(RB1_A[2]) );
  INVX12 U149 ( .A(n98), .Y(RB1_A[0]) );
  XOR2XL U150 ( .A(RB1_A[4]), .B(n176), .Y(N124) );
  NOR2XL U151 ( .A(RB1_A[3]), .B(n175), .Y(n176) );
  XNOR2XL U152 ( .A(RB1_A[3]), .B(n175), .Y(N123) );
  AO21XL U153 ( .A0(n197), .A1(RB1_A[1]), .B0(n174), .Y(N121) );
  NAND2X1 U154 ( .A(n187), .B(n56), .Y(n50) );
  NOR2X1 U155 ( .A(N34), .B(N33), .Y(n13) );
  NOR2X1 U156 ( .A(n187), .B(sen), .Y(n10) );
  OAI31XL U157 ( .A0(n66), .A1(n97), .A2(n98), .B0(n57), .Y(n64) );
  NAND2X1 U158 ( .A(n184), .B(N33), .Y(n20) );
  NAND2X1 U159 ( .A(n185), .B(N34), .Y(n18) );
  NAND2X1 U160 ( .A(n13), .B(n50), .Y(n48) );
  CLKINVX1 U161 ( .A(n13), .Y(n193) );
  NAND2X1 U162 ( .A(n50), .B(n7), .Y(n12) );
  NAND4X1 U163 ( .A(n10), .B(n13), .C(N35), .D(n152), .Y(n70) );
  NAND2X1 U164 ( .A(n57), .B(n187), .Y(n36) );
  NAND2X1 U165 ( .A(n45), .B(n7), .Y(n111) );
  XNOR2X1 U166 ( .A(n152), .B(n47), .Y(n45) );
  NOR2X1 U167 ( .A(N35), .B(n48), .Y(n47) );
  NAND2X1 U168 ( .A(n54), .B(n189), .Y(n56) );
  CLKINVX1 U169 ( .A(n57), .Y(n189) );
  NAND2X1 U170 ( .A(N34), .B(N33), .Y(n14) );
  NAND3X1 U171 ( .A(n191), .B(n192), .C(n190), .Y(n54) );
  AND2X2 U172 ( .A(n64), .B(n57), .Y(n120) );
  CLKBUFX3 U173 ( .A(n186), .Y(n173) );
  INVX3 U174 ( .A(updown), .Y(n187) );
  NAND2BX1 U175 ( .AN(n17), .B(sd), .Y(n15) );
  NAND2BX1 U176 ( .AN(n27), .B(sd), .Y(n25) );
  NAND2X1 U177 ( .A(sen), .B(updown), .Y(n7) );
  NAND3X1 U178 ( .A(n77), .B(n94), .C(n10), .Y(n27) );
  NAND3X1 U179 ( .A(n77), .B(N35), .C(n10), .Y(n17) );
  OAI2BB2XL U180 ( .B0(n98), .B1(n71), .A0N(n71), .A1N(n168), .Y(n124) );
  AO21X1 U181 ( .A0(n98), .A1(n187), .B0(n34), .Y(n168) );
  OAI21XL U182 ( .A0(n193), .A1(n35), .B0(n36), .Y(n71) );
  NAND3X1 U183 ( .A(n94), .B(n152), .C(n10), .Y(n35) );
  OAI22XL U184 ( .A0(n184), .A1(n50), .B0(n51), .B1(n12), .Y(n113) );
  NOR2BX1 U185 ( .AN(n14), .B(n13), .Y(n51) );
  OAI22XL U186 ( .A0(n185), .A1(n50), .B0(N33), .B1(n12), .Y(n114) );
  OAI2BB2XL U187 ( .B0(n87), .B1(n37), .A0N(n37), .A1N(n169), .Y(n109) );
  AO21X1 U188 ( .A0(N122), .A1(n187), .B0(n34), .Y(n169) );
  OAI21XL U189 ( .A0(n18), .A1(n35), .B0(n36), .Y(n37) );
  OAI2BB2XL U190 ( .B0(n86), .B1(n31), .A0N(n31), .A1N(n170), .Y(n108) );
  AO21X1 U191 ( .A0(N123), .A1(n187), .B0(n34), .Y(n170) );
  OAI21XL U192 ( .A0(n14), .A1(n35), .B0(n36), .Y(n31) );
  OAI2BB2XL U193 ( .B0(n97), .B1(n67), .A0N(n67), .A1N(n171), .Y(n123) );
  AO21X1 U194 ( .A0(N124), .A1(n187), .B0(n34), .Y(n171) );
  NAND2X1 U195 ( .A(n36), .B(n70), .Y(n67) );
  OAI2BB2XL U196 ( .B0(n88), .B1(n41), .A0N(n41), .A1N(n172), .Y(n110) );
  AO21X1 U197 ( .A0(N121), .A1(n187), .B0(n34), .Y(n172) );
  OAI21XL U198 ( .A0(n20), .A1(n35), .B0(n36), .Y(n41) );
  OAI22XL U199 ( .A0(n14), .A1(n25), .B0(n81), .B1(n26), .Y(n104) );
  NOR2X1 U200 ( .A(n14), .B(n27), .Y(n26) );
  OAI22XL U201 ( .A0(n14), .A1(n15), .B0(n85), .B1(n16), .Y(n100) );
  NOR2X1 U202 ( .A(n14), .B(n17), .Y(n16) );
  OAI22XL U203 ( .A0(n193), .A1(n25), .B0(n78), .B1(n30), .Y(n107) );
  NOR2X1 U204 ( .A(n193), .B(n27), .Y(n30) );
  OAI22XL U205 ( .A0(n20), .A1(n25), .B0(n79), .B1(n29), .Y(n106) );
  NOR2X1 U206 ( .A(n20), .B(n27), .Y(n29) );
  OAI22XL U207 ( .A0(n18), .A1(n25), .B0(n80), .B1(n28), .Y(n105) );
  NOR2X1 U208 ( .A(n18), .B(n27), .Y(n28) );
  OAI22XL U209 ( .A0(n193), .A1(n15), .B0(n82), .B1(n23), .Y(n103) );
  NOR2X1 U210 ( .A(n193), .B(n17), .Y(n23) );
  OAI22XL U211 ( .A0(n15), .A1(n20), .B0(n83), .B1(n21), .Y(n102) );
  NOR2X1 U212 ( .A(n17), .B(n20), .Y(n21) );
  OAI22XL U213 ( .A0(n15), .A1(n18), .B0(n84), .B1(n19), .Y(n101) );
  NOR2X1 U214 ( .A(n17), .B(n18), .Y(n19) );
  OAI2BB2XL U215 ( .B0(n9), .B1(n10), .A0N(RB1_RW), .A1N(n9), .Y(n99) );
  NOR2BX1 U216 ( .AN(n11), .B(n12), .Y(n9) );
  NAND4X1 U217 ( .A(n77), .B(n94), .C(n13), .D(updown), .Y(n11) );
  NAND4X1 U218 ( .A(n87), .B(n88), .C(n86), .D(n6), .Y(n5) );
  NOR4X1 U219 ( .A(n97), .B(n98), .C(n7), .D(RB1_RW), .Y(n6) );
  AND2X2 U220 ( .A(sd), .B(updown), .Y(n34) );
  OAI2BB2XL U221 ( .B0(n55), .B1(n50), .A0N(n50), .A1N(sd_reg), .Y(n116) );
  AOI2BB2X1 U222 ( .B0(N119), .B1(n57), .A0N(n76), .A1N(n54), .Y(n55) );
  NAND2X1 U223 ( .A(n49), .B(n7), .Y(n112) );
  XNOR2X1 U224 ( .A(n94), .B(n48), .Y(n49) );
  NOR2X1 U225 ( .A(n56), .B(updown), .Y(n52) );
  NOR2X1 U226 ( .A(n75), .B(n59), .Y(n58) );
  NAND2BX1 U227 ( .AN(n74), .B(n52), .Y(n59) );
  NAND2BX1 U228 ( .AN(n52), .B(n53), .Y(n115) );
  OAI21XL U229 ( .A0(updown), .A1(n54), .B0(sen_reg), .Y(n53) );
  NOR3X2 U230 ( .A(n190), .B(state[2]), .C(n191), .Y(n57) );
  OR3X2 U231 ( .A(n87), .B(n86), .C(n88), .Y(n66) );
  OAI21XL U232 ( .A0(state[2]), .A1(state[0]), .B0(n64), .Y(n122) );
  NOR2X1 U233 ( .A(RB1_A[1]), .B(n197), .Y(n174) );
  NAND2X1 U234 ( .A(n174), .B(n177), .Y(n175) );
  OAI21XL U235 ( .A0(n174), .A1(n177), .B0(n175), .Y(N122) );
  AOI22X1 U236 ( .A0(RB1_Q[2]), .A1(n185), .B0(RB1_Q[3]), .B1(N33), .Y(n179)
         );
  AOI22X1 U237 ( .A0(RB1_Q[0]), .A1(n185), .B0(RB1_Q[1]), .B1(N33), .Y(n178)
         );
  OA22X1 U238 ( .A0(n184), .A1(n179), .B0(N34), .B1(n178), .Y(n183) );
  AOI22X1 U239 ( .A0(RB1_Q[6]), .A1(n185), .B0(RB1_Q[7]), .B1(N33), .Y(n181)
         );
  AOI22X1 U240 ( .A0(RB1_Q[4]), .A1(n185), .B0(RB1_Q[5]), .B1(N33), .Y(n180)
         );
  OAI22XL U241 ( .A0(n181), .A1(n184), .B0(N34), .B1(n180), .Y(n182) );
  OAI2BB2XL U242 ( .B0(n183), .B1(N35), .A0N(N35), .A1N(n182), .Y(N119) );
endmodule


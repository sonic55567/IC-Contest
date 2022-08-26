/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : Q-2019.12
// Date      : Sat Mar  5 20:25:38 2022
/////////////////////////////////////////////////////////////


module SET_DW01_add_0 ( A, B, CI, SUM, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [7:1] carry;

  ADDFXL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(SUM[7]), .S(SUM[6]) );
  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module SET ( clk, rst, en, central, radius, mode, busy, valid, candidate );
  input [23:0] central;
  input [11:0] radius;
  input [1:0] mode;
  output [7:0] candidate;
  input clk, rst, en;
  output busy, valid;
  wire   a, b, c, N89, N90, N91, N92, N93, N94, N95, N96, N97, N172, N173,
         N174, N175, N176, N177, N180, N181, N182, N183, N184, N185, N186,
         N187, N188, n32, n33, n34, n35, n38, n44, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83,
         n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97,
         n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109,
         n110, n111, n112, n113, n114, n115, n116, n117, n118, n119, n120,
         n121, n122, n123, n124, n125, n126, n127, n128, n129, n130, n131,
         n132, n133, n134, n135, n136, n137, n138, n139, n140, n141, n142,
         n143, n144, n145, n146, n147, n148, n149, n150, n151, n152, n153,
         n154, n155, n156, n157, n158, n159, n160, n161, n162, n163, n164,
         n165, n166, n167, n168, n169, n170, n171, n172, n173, n174, n175,
         n176, n177, n181, n182, n183, n184, n185, n186, n187, n188, n189,
         n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200,
         n201, n202, n203, n204, n205, n206, n207, n208, n209, \mult_20/n13 ,
         \mult_20/n12 , \mult_20/n10 , \mult_20/n9 , \mult_20/n7 ,
         \mult_20/n5 , \mult_20/n4 , \mult_20/n3 , \mult_20/n2 , n210, n211,
         n212, n213, n214, n215, n216, n217, n218, n219, n220, n221, n222,
         n223, n224, n225, n226, n227, n228, n229, n230, n231, n232, n233,
         n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, n244,
         n245, n246, n247, n248, n249, n250, n251, n252, n253, n254, n255,
         n256, n257;
  wire   [3:0] A;
  wire   [6:0] mul;
  wire   [5:0] xy_count;
  wire   [3:0] state;
  wire   [7:0] dis_square_x;
  wire   [7:0] dis_square_y;
  wire   [5:2] \add_122/carry ;
  wire   [5:2] \r422/carry ;
  assign candidate[6] = 1'b0;
  assign candidate[7] = 1'b0;
  assign busy = 1'b0;

  OAI31X2 U121 ( .A0(n171), .A1(n172), .A2(n173), .B0(n241), .Y(n66) );
  SET_DW01_add_0 r416 ( .A({1'b0, dis_square_x[6:0]}), .B({1'b0, 
        dis_square_y[6:0]}), .CI(1'b0), .SUM({N96, N95, N94, N93, N92, N91, 
        N90, N89}) );
  ADDFXL \mult_20/U3  ( .A(A[2]), .B(\mult_20/n9 ), .CI(\mult_20/n3 ), .CO(
        \mult_20/n2 ), .S(mul[5]) );
  DFFX1 \xy_count_reg[5]  ( .D(n208), .CK(clk), .Q(xy_count[5]), .QN(n38) );
  EDFFX1 \dis_square_x_reg[6]  ( .D(mul[6]), .E(n214), .CK(clk), .Q(
        dis_square_x[6]) );
  EDFFX1 \dis_square_y_reg[6]  ( .D(mul[6]), .E(n213), .CK(clk), .Q(
        dis_square_y[6]) );
  DFFX1 \xy_count_reg[2]  ( .D(n206), .CK(clk), .Q(xy_count[2]), .QN(n44) );
  EDFFX1 \dis_square_x_reg[5]  ( .D(mul[5]), .E(n214), .CK(clk), .Q(
        dis_square_x[5]) );
  EDFFX1 \dis_square_x_reg[4]  ( .D(mul[4]), .E(n214), .CK(clk), .Q(
        dis_square_x[4]) );
  EDFFX1 \dis_square_x_reg[3]  ( .D(mul[3]), .E(n214), .CK(clk), .Q(
        dis_square_x[3]) );
  EDFFX1 \dis_square_y_reg[5]  ( .D(mul[5]), .E(n213), .CK(clk), .Q(
        dis_square_y[5]) );
  EDFFX1 \dis_square_y_reg[4]  ( .D(mul[4]), .E(n213), .CK(clk), .Q(
        dis_square_y[4]) );
  EDFFX1 \dis_square_y_reg[3]  ( .D(mul[3]), .E(n213), .CK(clk), .Q(
        dis_square_y[3]) );
  EDFFX1 \dis_square_x_reg[2]  ( .D(mul[2]), .E(n214), .CK(clk), .Q(
        dis_square_x[2]) );
  EDFFX1 \dis_square_y_reg[0]  ( .D(mul[0]), .E(n213), .CK(clk), .Q(
        dis_square_y[0]) );
  EDFFX1 \dis_square_y_reg[2]  ( .D(mul[2]), .E(n213), .CK(clk), .Q(
        dis_square_y[2]) );
  EDFFX1 \dis_square_x_reg[0]  ( .D(mul[0]), .E(n214), .CK(clk), .Q(
        dis_square_x[0]) );
  DFFRX1 \state_reg[1]  ( .D(N186), .CK(clk), .RN(n241), .Q(state[1]), .QN(n34) );
  DFFRX1 \state_reg[0]  ( .D(N185), .CK(clk), .RN(n241), .Q(state[0]), .QN(n35) );
  DFFQXL \dis_square_x_reg[1]  ( .D(n212), .CK(clk), .Q(dis_square_x[1]) );
  DFFQXL \dis_square_y_reg[1]  ( .D(n211), .CK(clk), .Q(dis_square_y[1]) );
  DFFRX1 \state_reg[3]  ( .D(N188), .CK(clk), .RN(n241), .Q(state[3]), .QN(n32) );
  DFFRX1 \state_reg[2]  ( .D(N187), .CK(clk), .RN(n241), .Q(state[2]), .QN(n33) );
  DFFXL c_reg ( .D(n201), .CK(clk), .Q(c), .QN(n256) );
  DFFXL b_reg ( .D(n202), .CK(clk), .Q(b), .QN(n257) );
  DFFXL a_reg ( .D(n203), .CK(clk), .Q(a) );
  DFFXL \xy_count_reg[4]  ( .D(n204), .CK(clk), .Q(xy_count[4]), .QN(n255) );
  DFFXL \xy_count_reg[1]  ( .D(n207), .CK(clk), .Q(xy_count[1]), .QN(n253) );
  DFFQX2 \counter_reg[0]  ( .D(n195), .CK(clk), .Q(candidate[0]) );
  DFFX1 \A_reg[0]  ( .D(n200), .CK(clk), .Q(mul[0]), .QN(n234) );
  DFFQX2 \counter_reg[5]  ( .D(n190), .CK(clk), .Q(candidate[5]) );
  DFFQX2 \counter_reg[4]  ( .D(n191), .CK(clk), .Q(candidate[4]) );
  DFFQX2 \counter_reg[3]  ( .D(n192), .CK(clk), .Q(candidate[3]) );
  DFFQX2 \counter_reg[2]  ( .D(n193), .CK(clk), .Q(candidate[2]) );
  DFFQX2 \counter_reg[1]  ( .D(n194), .CK(clk), .Q(candidate[1]) );
  DFFX1 \xy_count_reg[0]  ( .D(n209), .CK(clk), .Q(xy_count[0]), .QN(n248) );
  DFFX1 \xy_count_reg[3]  ( .D(n205), .CK(clk), .Q(xy_count[3]), .QN(n254) );
  DFFX1 \A_reg[3]  ( .D(n197), .CK(clk), .Q(A[3]) );
  DFFX1 \A_reg[2]  ( .D(n198), .CK(clk), .Q(A[2]) );
  DFFX1 \A_reg[1]  ( .D(n199), .CK(clk), .Q(A[1]) );
  DFFQX2 valid_reg ( .D(n196), .CK(clk), .Q(valid) );
  AOI21X1 U190 ( .A0(n234), .A1(N89), .B0(N90), .Y(n210) );
  ADDFX2 U191 ( .A(\mult_20/n7 ), .B(\mult_20/n10 ), .CI(\mult_20/n4 ), .CO(
        \mult_20/n3 ), .S(mul[4]) );
  ADDHX1 U192 ( .A(\mult_20/n12 ), .B(\mult_20/n5 ), .CO(\mult_20/n4 ), .S(
        mul[3]) );
  ADDHX1 U193 ( .A(A[1]), .B(\mult_20/n13 ), .CO(\mult_20/n5 ), .S(mul[2]) );
  NAND2BXL U194 ( .AN(A[1]), .B(A[2]), .Y(\mult_20/n7 ) );
  NAND2XL U195 ( .A(A[1]), .B(A[3]), .Y(\mult_20/n9 ) );
  NAND2XL U196 ( .A(A[3]), .B(A[2]), .Y(n222) );
  AND2XL U197 ( .A(A[1]), .B(mul[0]), .Y(\mult_20/n13 ) );
  AND2XL U198 ( .A(A[2]), .B(mul[0]), .Y(\mult_20/n12 ) );
  NAND2XL U199 ( .A(mul[0]), .B(A[3]), .Y(\mult_20/n10 ) );
  NOR2BX1 U200 ( .AN(dis_square_y[1]), .B(n213), .Y(n211) );
  NOR2BX1 U201 ( .AN(dis_square_x[1]), .B(n214), .Y(n212) );
  NOR2XL U202 ( .A(n239), .B(mul[4]), .Y(n223) );
  AOI2BB2XL U203 ( .B0(n239), .B1(mul[4]), .A0N(N94), .A1N(n236), .Y(n228) );
  NAND2XL U204 ( .A(mul[2]), .B(n238), .Y(n227) );
  NOR2XL U205 ( .A(n238), .B(mul[2]), .Y(n226) );
  NAND2X1 U206 ( .A(n54), .B(n241), .Y(n51) );
  NOR2X1 U207 ( .A(state[1]), .B(state[0]), .Y(n63) );
  NOR3X1 U208 ( .A(n253), .B(n248), .C(n44), .Y(n91) );
  NOR2X1 U209 ( .A(n34), .B(state[2]), .Y(n188) );
  NAND3X1 U210 ( .A(n63), .B(state[3]), .C(state[2]), .Y(n60) );
  NOR4X1 U211 ( .A(n32), .B(n35), .C(state[1]), .D(state[2]), .Y(n74) );
  NOR3X1 U212 ( .A(n255), .B(n254), .C(n38), .Y(n77) );
  NOR2X1 U213 ( .A(n35), .B(state[3]), .Y(n186) );
  NAND3X1 U214 ( .A(n35), .B(n32), .C(n188), .Y(n82) );
  NAND3X2 U215 ( .A(state[2]), .B(state[1]), .C(n186), .Y(n96) );
  NAND3X1 U216 ( .A(n188), .B(n35), .C(state[3]), .Y(n174) );
  CLKINVX1 U217 ( .A(n170), .Y(n251) );
  NAND3X1 U218 ( .A(n249), .B(n170), .C(n252), .Y(n173) );
  NAND3X1 U219 ( .A(n216), .B(n73), .C(n96), .Y(n171) );
  OAI222XL U220 ( .A0(n129), .A1(n96), .B0(n130), .B1(n98), .C0(n131), .C1(
        n100), .Y(n114) );
  XOR2X1 U221 ( .A(n132), .B(n220), .Y(n131) );
  XOR2X1 U222 ( .A(n138), .B(n219), .Y(n129) );
  XOR2X1 U223 ( .A(n134), .B(n220), .Y(n130) );
  OAI222XL U224 ( .A0(n95), .A1(n96), .B0(n97), .B1(n98), .C0(n99), .C1(n100), 
        .Y(n67) );
  XOR2X1 U225 ( .A(n101), .B(n102), .Y(n99) );
  XOR2X1 U226 ( .A(n109), .B(n110), .Y(n95) );
  XOR2X1 U227 ( .A(n105), .B(n106), .Y(n97) );
  NOR2BX1 U228 ( .AN(n181), .B(n60), .Y(n182) );
  NOR2X1 U229 ( .A(n51), .B(n53), .Y(n52) );
  OAI222XL U230 ( .A0(n155), .A1(n96), .B0(n156), .B1(n98), .C0(n157), .C1(
        n100), .Y(n142) );
  XNOR2X1 U231 ( .A(n158), .B(n218), .Y(n157) );
  XNOR2X1 U232 ( .A(n161), .B(n217), .Y(n155) );
  XNOR2X1 U233 ( .A(n160), .B(n218), .Y(n156) );
  OAI2BB2XL U234 ( .B0(n181), .B1(n254), .A0N(N182), .A1N(n182), .Y(n205) );
  OAI2BB2XL U235 ( .B0(n181), .B1(n255), .A0N(N183), .A1N(n182), .Y(n204) );
  OAI2BB2XL U236 ( .B0(n181), .B1(n253), .A0N(N180), .A1N(n182), .Y(n207) );
  CLKINVX1 U237 ( .A(n148), .Y(n242) );
  CLKINVX1 U238 ( .A(n152), .Y(n244) );
  CLKINVX1 U239 ( .A(n162), .Y(n246) );
  CLKINVX1 U240 ( .A(n159), .Y(n245) );
  CLKINVX1 U241 ( .A(n154), .Y(n243) );
  NOR2X1 U242 ( .A(n219), .B(n79), .Y(n78) );
  AND2X2 U243 ( .A(n173), .B(n241), .Y(n213) );
  AND2X2 U244 ( .A(n172), .B(n241), .Y(n214) );
  CLKINVX1 U245 ( .A(n225), .Y(n240) );
  CLKINVX1 U246 ( .A(mul[5]), .Y(n236) );
  NAND2X1 U247 ( .A(N97), .B(n241), .Y(n175) );
  CLKINVX1 U248 ( .A(mul[6]), .Y(n237) );
  INVXL U249 ( .A(mul[3]), .Y(n235) );
  CLKINVX1 U250 ( .A(N93), .Y(n239) );
  CLKINVX1 U251 ( .A(N91), .Y(n238) );
  CLKINVX1 U252 ( .A(n74), .Y(n252) );
  NAND2X1 U253 ( .A(n186), .B(n188), .Y(n170) );
  CLKINVX1 U254 ( .A(n71), .Y(n249) );
  NAND3X1 U255 ( .A(n100), .B(n82), .C(n98), .Y(n172) );
  AND2X2 U256 ( .A(n56), .B(n60), .Y(n183) );
  CLKBUFX3 U257 ( .A(n127), .Y(n218) );
  XNOR2X1 U258 ( .A(n253), .B(n248), .Y(n127) );
  CLKBUFX3 U259 ( .A(n120), .Y(n217) );
  XNOR2X1 U260 ( .A(n255), .B(n254), .Y(n120) );
  NAND4X1 U261 ( .A(n184), .B(n249), .C(n187), .D(n100), .Y(N187) );
  AND2X2 U262 ( .A(n216), .B(n170), .Y(n187) );
  NAND4X1 U263 ( .A(n189), .B(n252), .C(n100), .D(n73), .Y(N186) );
  NAND4X1 U264 ( .A(n183), .B(n189), .C(n98), .D(n216), .Y(N185) );
  OA21XL U265 ( .A0(n60), .A1(n64), .B0(n53), .Y(n184) );
  NAND2X1 U266 ( .A(n77), .B(n91), .Y(n64) );
  NAND4X1 U267 ( .A(n184), .B(n174), .C(n185), .D(n252), .Y(N188) );
  AND2X2 U268 ( .A(n96), .B(n98), .Y(n185) );
  AND3X2 U269 ( .A(n249), .B(n82), .C(n174), .Y(n189) );
  NOR2X2 U270 ( .A(n183), .B(rst), .Y(n181) );
  OAI222XL U271 ( .A0(n247), .A1(n252), .B0(n82), .B1(n154), .C0(n73), .C1(
        n148), .Y(n167) );
  CLKINVX1 U272 ( .A(radius[0]), .Y(n247) );
  AOI222XL U273 ( .A0(n250), .A1(n136), .B0(n168), .B1(n248), .C0(n169), .C1(
        n254), .Y(n165) );
  CLKINVX1 U274 ( .A(n98), .Y(n250) );
  OAI222XL U275 ( .A0(central[8]), .A1(n100), .B0(central[0]), .B1(n98), .C0(
        central[16]), .C1(n82), .Y(n168) );
  OAI222XL U276 ( .A0(central[12]), .A1(n216), .B0(central[4]), .B1(n96), .C0(
        central[20]), .C1(n73), .Y(n169) );
  OAI21XL U277 ( .A0(n55), .A1(n53), .B0(n56), .Y(n54) );
  AOI32X1 U278 ( .A0(n57), .A1(n257), .A2(a), .B0(b), .B1(n58), .Y(n55) );
  OAI2BB1X1 U279 ( .A0N(c), .A1N(mode[1]), .B0(mode[0]), .Y(n57) );
  NOR2BX1 U280 ( .AN(central[0]), .B(n248), .Y(n136) );
  OAI21X1 U281 ( .A0(n136), .A1(n218), .B0(n137), .Y(n108) );
  AO21X1 U282 ( .A0(n218), .A1(n136), .B0(central[1]), .Y(n137) );
  OAI21X1 U283 ( .A0(n246), .A1(n217), .B0(n140), .Y(n112) );
  AO21X1 U284 ( .A0(n217), .A1(n246), .B0(central[5]), .Y(n140) );
  OAI21X1 U285 ( .A0(n245), .A1(n218), .B0(n133), .Y(n104) );
  AO21X1 U286 ( .A0(n218), .A1(n245), .B0(central[9]), .Y(n133) );
  OAI21X1 U287 ( .A0(n242), .A1(n217), .B0(n121), .Y(n79) );
  AO21X1 U288 ( .A0(n217), .A1(n242), .B0(central[21]), .Y(n121) );
  OAI21X1 U289 ( .A0(n244), .A1(n217), .B0(n125), .Y(n88) );
  AO21X1 U290 ( .A0(n217), .A1(n244), .B0(central[13]), .Y(n125) );
  OAI21X1 U291 ( .A0(n243), .A1(n218), .B0(n128), .Y(n93) );
  AO21X1 U292 ( .A0(n218), .A1(n243), .B0(central[17]), .Y(n128) );
  XOR2X1 U293 ( .A(central[7]), .B(n77), .Y(n110) );
  XOR2X1 U294 ( .A(central[3]), .B(n91), .Y(n106) );
  XOR2X1 U295 ( .A(central[11]), .B(n91), .Y(n102) );
  XOR2X1 U296 ( .A(central[2]), .B(n108), .Y(n134) );
  XOR2X1 U297 ( .A(central[6]), .B(n112), .Y(n138) );
  XOR2X1 U298 ( .A(central[10]), .B(n104), .Y(n132) );
  XOR2X1 U299 ( .A(n124), .B(n219), .Y(n123) );
  XOR2X1 U300 ( .A(central[14]), .B(n88), .Y(n124) );
  XOR2X1 U301 ( .A(n85), .B(n86), .Y(n83) );
  XOR2X1 U302 ( .A(central[15]), .B(n77), .Y(n86) );
  OAI2BB2XL U303 ( .B0(central[14]), .B1(n87), .A0N(n88), .A1N(n219), .Y(n85)
         );
  NOR2X1 U304 ( .A(n219), .B(n88), .Y(n87) );
  OAI2BB2XL U305 ( .B0(n141), .B1(n66), .A0N(A[1]), .A1N(n66), .Y(n199) );
  NOR4X1 U306 ( .A(n142), .B(n143), .C(n144), .D(n145), .Y(n141) );
  AO22X1 U307 ( .A0(radius[9]), .A1(n251), .B0(radius[5]), .B1(n71), .Y(n145)
         );
  OAI22XL U308 ( .A0(n149), .A1(n82), .B0(n150), .B1(n216), .Y(n143) );
  OAI2BB2XL U309 ( .B0(n113), .B1(n66), .A0N(A[2]), .A1N(n66), .Y(n198) );
  NOR4X1 U310 ( .A(n114), .B(n115), .C(n116), .D(n117), .Y(n113) );
  AO22X1 U311 ( .A0(radius[10]), .A1(n251), .B0(radius[6]), .B1(n71), .Y(n117)
         );
  OAI22XL U312 ( .A0(n122), .A1(n82), .B0(n123), .B1(n216), .Y(n115) );
  OAI2BB2XL U313 ( .B0(n65), .B1(n66), .A0N(A[3]), .A1N(n66), .Y(n197) );
  NOR4X1 U314 ( .A(n67), .B(n68), .C(n69), .D(n70), .Y(n65) );
  AO22X1 U315 ( .A0(radius[11]), .A1(n251), .B0(radius[7]), .B1(n71), .Y(n70)
         );
  OAI22XL U316 ( .A0(n81), .A1(n82), .B0(n83), .B1(n216), .Y(n68) );
  OAI2BB2XL U317 ( .B0(n66), .B1(n163), .A0N(mul[0]), .A1N(n66), .Y(n200) );
  NOR4BBX1 U318 ( .AN(n164), .BN(n165), .C(n166), .D(n167), .Y(n163) );
  AOI22X1 U319 ( .A0(radius[4]), .A1(n71), .B0(radius[8]), .B1(n251), .Y(n164)
         );
  OAI222XL U320 ( .A0(n216), .A1(n152), .B0(n96), .B1(n162), .C0(n100), .C1(
        n159), .Y(n166) );
  XNOR2X1 U321 ( .A(n153), .B(n218), .Y(n149) );
  XNOR2X1 U322 ( .A(n243), .B(central[17]), .Y(n153) );
  XNOR2X1 U323 ( .A(n151), .B(n217), .Y(n150) );
  XNOR2X1 U324 ( .A(n244), .B(central[13]), .Y(n151) );
  XOR2X1 U325 ( .A(n126), .B(n220), .Y(n122) );
  XOR2X1 U326 ( .A(central[18]), .B(n93), .Y(n126) );
  OAI2BB2XL U327 ( .B0(n146), .B1(n73), .A0N(radius[1]), .A1N(n74), .Y(n144)
         );
  XNOR2X1 U328 ( .A(n147), .B(n217), .Y(n146) );
  XNOR2X1 U329 ( .A(n242), .B(central[21]), .Y(n147) );
  OAI2BB2XL U330 ( .B0(n118), .B1(n73), .A0N(radius[2]), .A1N(n74), .Y(n116)
         );
  XOR2X1 U331 ( .A(n119), .B(n219), .Y(n118) );
  XOR2X1 U332 ( .A(central[22]), .B(n79), .Y(n119) );
  XNOR2X1 U333 ( .A(n136), .B(central[1]), .Y(n160) );
  XNOR2X1 U334 ( .A(n246), .B(central[5]), .Y(n161) );
  XNOR2X1 U335 ( .A(n245), .B(central[9]), .Y(n158) );
  XNOR2X1 U336 ( .A(a), .B(n59), .Y(n58) );
  OAI2BB1X1 U337 ( .A0N(n256), .A1N(mode[0]), .B0(mode[1]), .Y(n59) );
  NAND2X1 U338 ( .A(central[20]), .B(xy_count[3]), .Y(n148) );
  NAND2X1 U339 ( .A(central[12]), .B(xy_count[3]), .Y(n152) );
  NAND2X1 U340 ( .A(central[4]), .B(xy_count[3]), .Y(n162) );
  NAND2X1 U341 ( .A(central[8]), .B(xy_count[0]), .Y(n159) );
  NAND2X1 U342 ( .A(central[16]), .B(xy_count[0]), .Y(n154) );
  OAI2BB2XL U343 ( .B0(central[2]), .B1(n107), .A0N(n108), .A1N(n220), .Y(n105) );
  NOR2X1 U344 ( .A(n220), .B(n108), .Y(n107) );
  OAI2BB2XL U345 ( .B0(n72), .B1(n73), .A0N(radius[3]), .A1N(n74), .Y(n69) );
  XOR2X1 U346 ( .A(n75), .B(n76), .Y(n72) );
  XOR2X1 U347 ( .A(central[23]), .B(n77), .Y(n76) );
  OAI2BB2XL U348 ( .B0(central[22]), .B1(n78), .A0N(n79), .A1N(n219), .Y(n75)
         );
  OAI2BB2XL U349 ( .B0(n181), .B1(n248), .A0N(n248), .A1N(n182), .Y(n209) );
  OAI2BB2XL U350 ( .B0(n181), .B1(n44), .A0N(N181), .A1N(n182), .Y(n206) );
  OAI2BB2XL U351 ( .B0(n181), .B1(n38), .A0N(N184), .A1N(n182), .Y(n208) );
  INVX3 U352 ( .A(rst), .Y(n241) );
  OAI2BB2XL U353 ( .B0(central[6]), .B1(n111), .A0N(n112), .A1N(n219), .Y(n109) );
  NOR2X1 U354 ( .A(n219), .B(n112), .Y(n111) );
  OAI2BB2XL U355 ( .B0(central[10]), .B1(n103), .A0N(n104), .A1N(n220), .Y(
        n101) );
  NOR2X1 U356 ( .A(n220), .B(n104), .Y(n103) );
  XOR2X1 U357 ( .A(n89), .B(n90), .Y(n81) );
  XOR2X1 U358 ( .A(central[19]), .B(n91), .Y(n90) );
  OAI2BB2XL U359 ( .B0(central[18]), .B1(n92), .A0N(n93), .A1N(n220), .Y(n89)
         );
  NOR2X1 U360 ( .A(n220), .B(n93), .Y(n92) );
  AO22X1 U361 ( .A0(candidate[0]), .A1(n51), .B0(N172), .B1(n52), .Y(n195) );
  CLKINVX1 U362 ( .A(candidate[0]), .Y(N172) );
  AO22X1 U363 ( .A0(candidate[4]), .A1(n51), .B0(N176), .B1(n52), .Y(n191) );
  AO22X1 U364 ( .A0(candidate[3]), .A1(n51), .B0(N175), .B1(n52), .Y(n192) );
  AO22X1 U365 ( .A0(candidate[2]), .A1(n51), .B0(N174), .B1(n52), .Y(n193) );
  AO22X1 U366 ( .A0(candidate[1]), .A1(n51), .B0(N173), .B1(n52), .Y(n194) );
  AO22X1 U367 ( .A0(candidate[5]), .A1(n51), .B0(N177), .B1(n52), .Y(n190) );
  OAI2BB2XL U368 ( .B0(n216), .B1(n175), .A0N(n215), .A1N(a), .Y(n203) );
  OR2X1 U369 ( .A(rst), .B(n216), .Y(n215) );
  OAI22XL U370 ( .A0(n96), .A1(n175), .B0(n177), .B1(n257), .Y(n202) );
  NOR2X1 U371 ( .A(rst), .B(n96), .Y(n177) );
  OAI22XL U372 ( .A0(n174), .A1(n175), .B0(n176), .B1(n256), .Y(n201) );
  NOR2X1 U373 ( .A(rst), .B(n174), .Y(n176) );
  OAI2BB2XL U374 ( .B0(n60), .B1(n61), .A0N(valid), .A1N(n61), .Y(n196) );
  NAND2X1 U375 ( .A(n62), .B(n241), .Y(n61) );
  OAI32X1 U376 ( .A0(n33), .A1(n63), .A2(n32), .B0(n60), .B1(n64), .Y(n62) );
  NOR4X2 U377 ( .A(n33), .B(n34), .C(state[0]), .D(state[3]), .Y(n71) );
  NAND3X2 U378 ( .A(state[2]), .B(n34), .C(n186), .Y(n100) );
  NAND3X2 U379 ( .A(state[3]), .B(n33), .C(n63), .Y(n98) );
  NAND3X2 U380 ( .A(n34), .B(n33), .C(n186), .Y(n73) );
  NAND3X1 U381 ( .A(state[0]), .B(n188), .C(state[3]), .Y(n53) );
  NAND3X1 U382 ( .A(n33), .B(n32), .C(n63), .Y(n56) );
  CLKBUFX3 U383 ( .A(n84), .Y(n216) );
  NAND3X1 U384 ( .A(n63), .B(n32), .C(state[2]), .Y(n84) );
  CLKBUFX3 U385 ( .A(n80), .Y(n219) );
  XOR2X1 U386 ( .A(n139), .B(n38), .Y(n80) );
  NAND2X1 U387 ( .A(xy_count[4]), .B(xy_count[3]), .Y(n139) );
  CLKBUFX3 U388 ( .A(n94), .Y(n220) );
  XOR2X1 U389 ( .A(n135), .B(n44), .Y(n94) );
  NAND2X1 U390 ( .A(xy_count[1]), .B(xy_count[0]), .Y(n135) );
  ADDHXL U391 ( .A(candidate[1]), .B(candidate[0]), .CO(\r422/carry [2]), .S(
        N173) );
  ADDHXL U392 ( .A(candidate[2]), .B(\r422/carry [2]), .CO(\r422/carry [3]), 
        .S(N174) );
  ADDHXL U393 ( .A(candidate[3]), .B(\r422/carry [3]), .CO(\r422/carry [4]), 
        .S(N175) );
  ADDHXL U394 ( .A(xy_count[3]), .B(\add_122/carry [3]), .CO(
        \add_122/carry [4]), .S(N182) );
  ADDHXL U395 ( .A(xy_count[1]), .B(xy_count[0]), .CO(\add_122/carry [2]), .S(
        N180) );
  ADDHXL U396 ( .A(xy_count[2]), .B(\add_122/carry [2]), .CO(
        \add_122/carry [3]), .S(N181) );
  ADDHXL U397 ( .A(candidate[4]), .B(\r422/carry [4]), .CO(\r422/carry [5]), 
        .S(N176) );
  ADDHXL U398 ( .A(xy_count[4]), .B(\add_122/carry [4]), .CO(
        \add_122/carry [5]), .S(N183) );
  XOR2X1 U399 ( .A(A[3]), .B(\mult_20/n2 ), .Y(n221) );
  XOR2X1 U400 ( .A(n222), .B(n221), .Y(mul[6]) );
  XOR2X1 U401 ( .A(\r422/carry [5]), .B(candidate[5]), .Y(N177) );
  XOR2X1 U402 ( .A(\add_122/carry [5]), .B(xy_count[5]), .Y(N184) );
  OAI222XL U403 ( .A0(N94), .A1(n236), .B0(N94), .B1(n223), .C0(n223), .C1(
        n236), .Y(n225) );
  AOI21X1 U404 ( .A0(N95), .A1(n240), .B0(N96), .Y(n224) );
  OAI21XL U405 ( .A0(mul[6]), .A1(n225), .B0(n224), .Y(n233) );
  OAI22XL U406 ( .A0(n226), .A1(n235), .B0(N92), .B1(n226), .Y(n231) );
  OAI222XL U407 ( .A0(N92), .A1(n235), .B0(N92), .B1(n227), .C0(n227), .C1(
        n235), .Y(n230) );
  AOI22X1 U408 ( .A0(n228), .A1(N95), .B0(n228), .B1(n237), .Y(n229) );
  AOI211X1 U409 ( .A0(n210), .A1(n231), .B0(n230), .C0(n229), .Y(n232) );
  AOI211X1 U410 ( .A0(N95), .A1(n237), .B0(n233), .C0(n232), .Y(N97) );
endmodule


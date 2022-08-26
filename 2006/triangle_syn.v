/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : Q-2019.12
// Date      : Mon Mar 22 23:35:42 2021
/////////////////////////////////////////////////////////////


module triangle_DW_mult_uns_0 ( a, b, product );
  input [4:0] a;
  input [4:0] b;
  output [9:0] product;
  wire   n2, n3, n4, n7, n8, n10, n11, n12, n14, n16, n17, n20, n21, n24, n25,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70;

  ADDFXL U3 ( .A(n8), .B(n10), .CI(n3), .CO(n2), .S(product[3]) );
  ADDFXL U4 ( .A(n4), .B(n17), .CI(n12), .CO(n3), .S(product[2]) );
  ADDHXL U5 ( .A(n21), .B(n25), .CO(n4), .S(product[1]) );
  ADDFXL U8 ( .A(n14), .B(n16), .CI(n11), .CO(n7), .S(n8) );
  ADDHXL U11 ( .A(n24), .B(n20), .CO(n11), .S(n12) );
  CLKINVX1 U37 ( .A(b[0]), .Y(n55) );
  CLKINVX1 U38 ( .A(a[1]), .Y(n57) );
  CLKINVX1 U39 ( .A(a[2]), .Y(n56) );
  CLKINVX1 U40 ( .A(a[0]), .Y(n58) );
  CLKINVX1 U41 ( .A(b[1]), .Y(n54) );
  CLKINVX1 U42 ( .A(b[2]), .Y(n53) );
  XOR2X1 U43 ( .A(n59), .B(n60), .Y(product[4]) );
  XOR2X1 U44 ( .A(n61), .B(n62), .Y(n60) );
  XOR2X1 U45 ( .A(n63), .B(n64), .Y(n62) );
  NAND2BX1 U46 ( .AN(n65), .B(n66), .Y(n64) );
  NAND2X1 U47 ( .A(b[2]), .B(a[2]), .Y(n63) );
  AND2X1 U48 ( .A(a[3]), .B(b[1]), .Y(n61) );
  XOR2X1 U49 ( .A(n67), .B(n68), .Y(n59) );
  XOR2X1 U50 ( .A(n69), .B(n70), .Y(n68) );
  NAND2X1 U51 ( .A(b[4]), .B(a[0]), .Y(n70) );
  NAND2X1 U52 ( .A(b[3]), .B(a[1]), .Y(n69) );
  XOR2X1 U53 ( .A(n7), .B(n2), .Y(n67) );
  NOR2X1 U54 ( .A(n58), .B(n55), .Y(product[0]) );
  NOR2X1 U55 ( .A(n58), .B(n54), .Y(n25) );
  NOR2X1 U56 ( .A(n58), .B(n53), .Y(n24) );
  NOR2X1 U57 ( .A(n57), .B(n55), .Y(n21) );
  NOR2X1 U58 ( .A(n57), .B(n54), .Y(n20) );
  NOR2X1 U59 ( .A(n56), .B(n55), .Y(n17) );
  NOR2X1 U60 ( .A(n54), .B(n56), .Y(n16) );
  NAND2X1 U61 ( .A(b[0]), .B(a[3]), .Y(n14) );
  XOR2X1 U62 ( .A(n66), .B(n65), .Y(n10) );
  NOR2X1 U63 ( .A(n53), .B(n57), .Y(n65) );
  NAND2X1 U64 ( .A(a[0]), .B(b[3]), .Y(n66) );
endmodule


module triangle_DW_mult_uns_1 ( a, b, product );
  input [4:0] a;
  input [4:0] b;
  output [9:0] product;
  wire   n2, n3, n4, n7, n8, n9, n10, n11, n12, n14, n16, n17, n19, n20, n21,
         n22, n23, n24, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62;

  ADDFXL U3 ( .A(n3), .B(n10), .CI(n8), .CO(n2), .S(product[3]) );
  ADDFXL U4 ( .A(n4), .B(n17), .CI(n12), .CO(n3), .S(product[2]) );
  ADDHXL U5 ( .A(n21), .B(n24), .CO(n4), .S(product[1]) );
  ADDFXL U8 ( .A(n14), .B(n22), .CI(n11), .CO(n7), .S(n8) );
  ADDHXL U9 ( .A(n16), .B(n19), .CO(n9), .S(n10) );
  ADDHXL U10 ( .A(n23), .B(n20), .CO(n11), .S(n12) );
  CLKINVX1 U34 ( .A(b[1]), .Y(n51) );
  CLKINVX1 U35 ( .A(a[1]), .Y(n54) );
  CLKINVX1 U36 ( .A(b[2]), .Y(n50) );
  CLKINVX1 U37 ( .A(a[2]), .Y(n53) );
  CLKINVX1 U38 ( .A(a[0]), .Y(n55) );
  CLKINVX1 U39 ( .A(b[0]), .Y(n52) );
  XOR2X1 U40 ( .A(n56), .B(n57), .Y(product[4]) );
  XOR2X1 U41 ( .A(n2), .B(n58), .Y(n57) );
  XOR2X1 U42 ( .A(n9), .B(n7), .Y(n58) );
  XOR2X1 U43 ( .A(n59), .B(n60), .Y(n56) );
  XOR2X1 U44 ( .A(n61), .B(n62), .Y(n60) );
  NAND2X1 U45 ( .A(b[3]), .B(a[1]), .Y(n62) );
  NAND2X1 U46 ( .A(b[2]), .B(a[2]), .Y(n61) );
  NAND2X1 U47 ( .A(b[1]), .B(a[3]), .Y(n59) );
  NOR2X1 U48 ( .A(n55), .B(n52), .Y(product[0]) );
  NOR2X1 U49 ( .A(n51), .B(n55), .Y(n24) );
  NOR2X1 U50 ( .A(n50), .B(n55), .Y(n23) );
  NAND2X1 U51 ( .A(a[0]), .B(b[3]), .Y(n22) );
  NOR2X1 U52 ( .A(n54), .B(n52), .Y(n21) );
  NOR2X1 U53 ( .A(n51), .B(n54), .Y(n20) );
  NOR2X1 U54 ( .A(n50), .B(n54), .Y(n19) );
  NOR2X1 U55 ( .A(n53), .B(n52), .Y(n17) );
  NOR2X1 U56 ( .A(n51), .B(n53), .Y(n16) );
  NAND2X1 U57 ( .A(b[0]), .B(a[3]), .Y(n14) );
endmodule


module triangle ( clk, reset, nt, xi, yi, busy, po, xo, yo );
  input [2:0] xi;
  input [2:0] yi;
  output [2:0] xo;
  output [2:0] yo;
  input clk, reset, nt;
  output busy, po;
  wire   \x1[0] , N47, N62, N63, N64, N65, N66, N67, N93, n19, n21, n25, n27,
         n28, n29, n31, n33, n34, n35, n36, n37, n39, n40, n41, n42, n43, n44,
         n47, n49, n50, n51, n55, n56, n57, n58, n59, n60, n61, n62, n63, n65,
         n66, n70, n71, n73, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         N28, N27, N26, N25, N24, N23, N22, N20, N19, N18, N17, N9, N16, N15,
         N14, N13, N12, N11, N10, \sub_15_2/A[0] , n99, n102, n104, n106, n108,
         n110, n112, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179;
  wire   [2:0] y3;
  wire   [2:0] x2;
  wire   [2:0] x3;
  wire   [4:0] A;
  wire   [2:0] y2;
  wire   [2:0] xt;
  wire   [4:0] B;
  wire   [5:0] \sub_15_2/carry ;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9;

  triangle_DW_mult_uns_0 mult_15 ( .a({N20, N20, N19, N18, N17}), .b({n99, N28, 
        N27, N26, N25}), .product({SYNOPSYS_UNCONNECTED__0, 
        SYNOPSYS_UNCONNECTED__1, SYNOPSYS_UNCONNECTED__2, 
        SYNOPSYS_UNCONNECTED__3, SYNOPSYS_UNCONNECTED__4, B}) );
  triangle_DW_mult_uns_1 mult_14 ( .a({N12, N12, N11, N10, N9}), .b({N16, N16, 
        N15, N14, N13}), .product({SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, A}) );
  DFFRX1 \y3_reg[1]  ( .D(n89), .CK(clk), .RN(n137), .Q(y3[1]), .QN(n155) );
  DFFRX1 \y3_reg[0]  ( .D(n88), .CK(clk), .RN(n137), .Q(y3[0]), .QN(n158) );
  DFFRX1 \x2_reg[0]  ( .D(n96), .CK(clk), .RN(n137), .Q(x2[0]), .QN(n151) );
  DFFRX1 \y2_reg[1]  ( .D(n78), .CK(clk), .RN(n137), .Q(y2[1]) );
  DFFRX1 \x2_reg[1]  ( .D(n94), .CK(clk), .RN(n137), .Q(x2[1]), .QN(n149) );
  DFFRX1 \y3_reg[2]  ( .D(n90), .CK(clk), .RN(n137), .Q(y3[2]) );
  DFFRX1 \y2_reg[0]  ( .D(n77), .CK(clk), .RN(n137), .Q(y2[0]) );
  DFFRX1 \x2_reg[2]  ( .D(n95), .CK(clk), .RN(n137), .Q(x2[2]) );
  DFFRX1 \y2_reg[2]  ( .D(n79), .CK(clk), .RN(n137), .Q(y2[2]) );
  DFFRX1 \x1_reg[2]  ( .D(n63), .CK(clk), .RN(n137), .QN(n152) );
  DFFRX1 \x1_reg[1]  ( .D(n62), .CK(clk), .RN(n137), .QN(n153) );
  DFFRX1 \x1_reg[0]  ( .D(n61), .CK(clk), .RN(n137), .Q(\x1[0] ) );
  DFFRX1 busy_reg ( .D(n85), .CK(clk), .RN(n137), .QN(n58) );
  DFFRX1 po_reg ( .D(n76), .CK(clk), .RN(n137), .QN(n60) );
  DFFRX1 flag_reg ( .D(n86), .CK(clk), .RN(n137), .Q(n160), .QN(n59) );
  DFFRX1 \counter_reg[1]  ( .D(n97), .CK(clk), .RN(n137), .QN(n65) );
  DFFRX1 \counter_reg[0]  ( .D(n98), .CK(clk), .RN(n137), .Q(n148), .QN(n66)
         );
  EDFFHQX1 \yo_reg[2]  ( .D(N67), .E(N93), .CK(clk), .Q(n116) );
  EDFFHQX1 \yo_reg[1]  ( .D(N66), .E(N93), .CK(clk), .Q(n115) );
  EDFFHQX1 \yo_reg[0]  ( .D(N65), .E(N93), .CK(clk), .Q(n114) );
  EDFFHQX1 \xo_reg[2]  ( .D(N64), .E(N93), .CK(clk), .Q(n117) );
  EDFFHQX1 \xo_reg[1]  ( .D(N63), .E(N93), .CK(clk), .Q(n118) );
  EDFFHQX1 \xo_reg[0]  ( .D(N62), .E(N93), .CK(clk), .Q(n119) );
  DFFRX1 \x3_reg[0]  ( .D(n91), .CK(clk), .RN(n137), .Q(x3[0]), .QN(n120) );
  DFFRX1 \x3_reg[1]  ( .D(n92), .CK(clk), .RN(n137), .Q(x3[1]), .QN(n121) );
  DFFRX1 \x3_reg[2]  ( .D(n93), .CK(clk), .RN(n137), .Q(x3[2]), .QN(n122) );
  DFFRX1 \xt_reg[0]  ( .D(n81), .CK(clk), .RN(n137), .Q(xt[0]), .QN(
        \sub_15_2/A[0] ) );
  DFFRX1 \xt_reg[1]  ( .D(n82), .CK(clk), .RN(n137), .Q(xt[1]), .QN(n71) );
  DFFRX1 \xt_reg[2]  ( .D(n80), .CK(clk), .RN(n137), .Q(xt[2]), .QN(n70) );
  DFFRX1 \yt_reg[1]  ( .D(n84), .CK(clk), .RN(n137), .Q(N66), .QN(n159) );
  DFFRX1 \yt_reg[2]  ( .D(n83), .CK(clk), .RN(n137), .Q(N67), .QN(n73) );
  DFFRX1 \yt_reg[0]  ( .D(n87), .CK(clk), .RN(n137), .Q(N65), .QN(n75) );
  NOR2X1 U80 ( .A(N24), .B(\sub_15_2/carry [3]), .Y(n99) );
  INVX12 U81 ( .A(n60), .Y(po) );
  INVX12 U82 ( .A(n58), .Y(busy) );
  INVXL U83 ( .A(n119), .Y(n102) );
  INVX12 U84 ( .A(n102), .Y(xo[0]) );
  INVXL U85 ( .A(n118), .Y(n104) );
  INVX12 U86 ( .A(n104), .Y(xo[1]) );
  INVXL U87 ( .A(n117), .Y(n106) );
  INVX12 U88 ( .A(n106), .Y(xo[2]) );
  INVXL U89 ( .A(n114), .Y(n108) );
  INVX12 U90 ( .A(n108), .Y(yo[0]) );
  INVXL U91 ( .A(n115), .Y(n110) );
  INVX12 U92 ( .A(n110), .Y(yo[1]) );
  INVXL U93 ( .A(n116), .Y(n112) );
  INVX12 U94 ( .A(n112), .Y(yo[2]) );
  NAND2X1 U95 ( .A(n65), .B(n148), .Y(n21) );
  CLKINVX1 U96 ( .A(n126), .Y(n132) );
  CLKINVX1 U97 ( .A(A[3]), .Y(n131) );
  CLKINVX1 U98 ( .A(A[2]), .Y(n130) );
  CLKINVX1 U99 ( .A(A[1]), .Y(n129) );
  CLKINVX1 U100 ( .A(B[4]), .Y(n133) );
  CLKINVX1 U101 ( .A(n35), .Y(n136) );
  NAND2X1 U102 ( .A(n47), .B(n136), .Y(n39) );
  CLKINVX1 U103 ( .A(n37), .Y(n134) );
  NOR2BX1 U104 ( .AN(N47), .B(n19), .Y(n35) );
  NOR2X1 U105 ( .A(n19), .B(N47), .Y(n37) );
  NAND2X1 U106 ( .A(n33), .B(n19), .Y(n25) );
  NAND2X1 U107 ( .A(n140), .B(n19), .Y(n33) );
  NAND2X1 U108 ( .A(n140), .B(n136), .Y(n47) );
  CLKINVX1 U109 ( .A(n172), .Y(n156) );
  CLKINVX1 U110 ( .A(n166), .Y(n150) );
  CLKINVX1 U111 ( .A(n178), .Y(n157) );
  NAND3X1 U112 ( .A(n21), .B(n140), .C(n147), .Y(n51) );
  CLKINVX1 U113 ( .A(n50), .Y(n147) );
  CLKINVX1 U114 ( .A(n49), .Y(n154) );
  XNOR2X1 U115 ( .A(n156), .B(n171), .Y(N10) );
  XNOR2X1 U116 ( .A(y3[1]), .B(N66), .Y(n171) );
  XNOR2X1 U117 ( .A(n150), .B(n165), .Y(N14) );
  XNOR2X1 U118 ( .A(x2[1]), .B(x3[1]), .Y(n165) );
  XNOR2X1 U119 ( .A(n157), .B(n177), .Y(N18) );
  XNOR2X1 U120 ( .A(y3[1]), .B(y2[1]), .Y(n177) );
  XNOR2X1 U121 ( .A(n161), .B(n163), .Y(N15) );
  XOR2X1 U122 ( .A(x3[2]), .B(x2[2]), .Y(n163) );
  XNOR2X1 U123 ( .A(n173), .B(n175), .Y(N19) );
  XOR2X1 U124 ( .A(y2[2]), .B(y3[2]), .Y(n175) );
  XNOR2X1 U125 ( .A(n167), .B(n169), .Y(N11) );
  XOR2X1 U126 ( .A(N67), .B(y3[2]), .Y(n169) );
  OAI21XL U127 ( .A0(y2[0]), .A1(n158), .B0(n178), .Y(N17) );
  OAI21XL U128 ( .A0(N65), .A1(n158), .B0(n172), .Y(N9) );
  OAI21XL U129 ( .A0(x3[0]), .A1(n151), .B0(n166), .Y(N13) );
  OAI21XL U130 ( .A0(n157), .A1(n155), .B0(n176), .Y(n173) );
  AO21X1 U131 ( .A0(n155), .A1(n157), .B0(y2[1]), .Y(n176) );
  OAI21XL U132 ( .A0(n150), .A1(n149), .B0(n164), .Y(n161) );
  AO21X1 U133 ( .A0(n149), .A1(n150), .B0(x3[1]), .Y(n164) );
  ADDFXL U134 ( .A(N23), .B(n122), .CI(\sub_15_2/carry [2]), .CO(
        \sub_15_2/carry [3]), .S(N27) );
  XNOR2X1 U135 ( .A(xt[2]), .B(n179), .Y(N23) );
  NAND2X1 U136 ( .A(xt[1]), .B(xt[0]), .Y(n179) );
  OAI21XL U137 ( .A0(y3[2]), .A1(n167), .B0(n168), .Y(N12) );
  OAI2BB1X1 U138 ( .A0N(n167), .A1N(y3[2]), .B0(N67), .Y(n168) );
  OAI21XL U139 ( .A0(x2[2]), .A1(n161), .B0(n162), .Y(N16) );
  OAI2BB1X1 U140 ( .A0N(n161), .A1N(x2[2]), .B0(x3[2]), .Y(n162) );
  OAI21XL U141 ( .A0(y3[2]), .A1(n173), .B0(n174), .Y(N20) );
  OAI2BB1X1 U142 ( .A0N(n173), .A1N(y3[2]), .B0(y2[2]), .Y(n174) );
  CLKINVX1 U143 ( .A(nt), .Y(n140) );
  NAND2X1 U144 ( .A(y2[0]), .B(n158), .Y(n178) );
  NAND2X1 U145 ( .A(N65), .B(n158), .Y(n172) );
  NAND2X1 U146 ( .A(x3[0]), .B(n151), .Y(n166) );
  OA21XL U147 ( .A0(N65), .A1(n136), .B0(n47), .Y(n43) );
  OA21XL U148 ( .A0(xt[0]), .A1(n134), .B0(n33), .Y(n31) );
  OAI21XL U149 ( .A0(n156), .A1(n155), .B0(n170), .Y(n167) );
  AO21X1 U150 ( .A0(n155), .A1(n156), .B0(N66), .Y(n170) );
  OAI21XL U151 ( .A0(n159), .A1(n43), .B0(n44), .Y(n84) );
  AOI32X1 U152 ( .A0(n35), .A1(n159), .A2(N65), .B0(n135), .B1(yi[1]), .Y(n44)
         );
  CLKINVX1 U153 ( .A(n39), .Y(n135) );
  ADDFXL U154 ( .A(N22), .B(n121), .CI(\sub_15_2/carry [1]), .CO(
        \sub_15_2/carry [2]), .S(N26) );
  XNOR2X1 U155 ( .A(xt[1]), .B(\sub_15_2/A[0] ), .Y(N22) );
  OAI222XL U156 ( .A0(n75), .A1(n47), .B0(n146), .B1(n39), .C0(N65), .C1(n136), 
        .Y(n87) );
  OAI221XL U157 ( .A0(n141), .A1(n25), .B0(n152), .B1(n136), .C0(n27), .Y(n80)
         );
  AOI32X1 U158 ( .A0(xt[1]), .A1(xt[0]), .A2(n28), .B0(xt[2]), .B1(n29), .Y(
        n27) );
  NOR2BX1 U159 ( .AN(n70), .B(n134), .Y(n28) );
  OAI21XL U160 ( .A0(xt[1]), .A1(n134), .B0(n31), .Y(n29) );
  OAI221XL U161 ( .A0(n71), .A1(n31), .B0(n153), .B1(n136), .C0(n36), .Y(n82)
         );
  AOI32X1 U162 ( .A0(xt[0]), .A1(n37), .A2(n71), .B0(n138), .B1(xi[1]), .Y(n36) );
  CLKINVX1 U163 ( .A(n25), .Y(n138) );
  OAI221XL U164 ( .A0(n143), .A1(n25), .B0(\sub_15_2/A[0] ), .B1(n33), .C0(n34), .Y(n81) );
  AOI2BB2X1 U165 ( .B0(n35), .B1(\x1[0] ), .A0N(n134), .A1N(xt[0]), .Y(n34) );
  OAI211X1 U166 ( .A0(n144), .A1(n39), .B0(n40), .C0(n41), .Y(n83) );
  NAND4X1 U167 ( .A(N66), .B(N65), .C(n35), .D(n73), .Y(n41) );
  NAND2X1 U168 ( .A(N67), .B(n42), .Y(n40) );
  OAI21XL U169 ( .A0(N66), .A1(n136), .B0(n43), .Y(n42) );
  OAI22XL U170 ( .A0(nt), .A1(n59), .B0(n58), .B1(n49), .Y(n86) );
  OAI22XL U171 ( .A0(n120), .A1(n50), .B0(n143), .B1(n147), .Y(n91) );
  OAI22XL U172 ( .A0(n121), .A1(n50), .B0(n142), .B1(n147), .Y(n92) );
  OAI22XL U173 ( .A0(n122), .A1(n50), .B0(n141), .B1(n147), .Y(n93) );
  OAI22XL U174 ( .A0(n140), .A1(n142), .B0(nt), .B1(n153), .Y(n62) );
  OAI22XL U175 ( .A0(n140), .A1(n141), .B0(nt), .B1(n152), .Y(n63) );
  OAI2BB2XL U176 ( .B0(n21), .B1(n146), .A0N(y2[0]), .A1N(n21), .Y(n77) );
  OAI2BB2XL U177 ( .B0(n21), .B1(n145), .A0N(y2[1]), .A1N(n21), .Y(n78) );
  OAI2BB2XL U178 ( .B0(n21), .B1(n144), .A0N(y2[2]), .A1N(n21), .Y(n79) );
  OAI2BB2XL U179 ( .B0(n143), .B1(n21), .A0N(x2[0]), .A1N(n21), .Y(n96) );
  OAI2BB2XL U180 ( .B0(n141), .B1(n21), .A0N(x2[2]), .A1N(n21), .Y(n95) );
  OAI2BB2XL U181 ( .B0(n142), .B1(n21), .A0N(x2[1]), .A1N(n21), .Y(n94) );
  NOR2X1 U182 ( .A(reset), .B(n58), .Y(N93) );
  OAI2BB2XL U183 ( .B0(n145), .B1(n147), .A0N(n147), .A1N(y3[1]), .Y(n89) );
  OAI2BB2XL U184 ( .B0(n146), .B1(n147), .A0N(n147), .A1N(y3[0]), .Y(n88) );
  OAI2BB2XL U185 ( .B0(n144), .B1(n147), .A0N(n147), .A1N(y3[2]), .Y(n90) );
  OAI21XL U186 ( .A0(n65), .A1(n51), .B0(n21), .Y(n97) );
  CLKINVX1 U187 ( .A(xi[2]), .Y(n141) );
  AO22X1 U188 ( .A0(nt), .A1(xi[0]), .B0(n140), .B1(\x1[0] ), .Y(n61) );
  CLKINVX1 U189 ( .A(xi[1]), .Y(n142) );
  OAI32X1 U190 ( .A0(n148), .A1(n139), .A2(n50), .B0(n66), .B1(n51), .Y(n98)
         );
  CLKINVX1 U191 ( .A(n51), .Y(n139) );
  AND3X2 U192 ( .A(xt[2]), .B(xt[0]), .C(xt[1]), .Y(N24) );
  CLKINVX1 U193 ( .A(yi[0]), .Y(n146) );
  CLKINVX1 U194 ( .A(yi[2]), .Y(n144) );
  CLKINVX1 U195 ( .A(xi[0]), .Y(n143) );
  CLKINVX1 U196 ( .A(yi[1]), .Y(n145) );
  NAND2BX1 U197 ( .AN(n58), .B(n49), .Y(n19) );
  NAND3X1 U198 ( .A(n55), .B(n56), .C(n57), .Y(n49) );
  XOR2X1 U199 ( .A(y3[0]), .B(n75), .Y(n57) );
  XOR2X1 U200 ( .A(y3[1]), .B(n159), .Y(n56) );
  XOR2X1 U201 ( .A(y3[2]), .B(n73), .Y(n55) );
  NOR2X1 U202 ( .A(n148), .B(n65), .Y(n50) );
  OAI22XL U203 ( .A0(\sub_15_2/A[0] ), .A1(n154), .B0(n120), .B1(n49), .Y(N62)
         );
  OAI22XL U204 ( .A0(n71), .A1(n154), .B0(n121), .B1(n49), .Y(N63) );
  OAI22XL U205 ( .A0(n70), .A1(n154), .B0(n122), .B1(n49), .Y(N64) );
  AOI21X1 U206 ( .A0(n60), .A1(n19), .B0(n160), .Y(n76) );
  AOI21X1 U207 ( .A0(n58), .A1(n147), .B0(n160), .Y(n85) );
  INVX3 U208 ( .A(reset), .Y(n137) );
  XNOR2X1 U209 ( .A(\sub_15_2/carry [3]), .B(N24), .Y(N28) );
  OR2X1 U210 ( .A(n120), .B(\sub_15_2/A[0] ), .Y(\sub_15_2/carry [1]) );
  XNOR2X1 U211 ( .A(\sub_15_2/A[0] ), .B(n120), .Y(N25) );
  AOI2BB1X1 U212 ( .A0N(n129), .A1N(B[1]), .B0(A[0]), .Y(n123) );
  NAND2BX1 U213 ( .AN(B[3]), .B(A[3]), .Y(n124) );
  AOI32X1 U214 ( .A0(B[2]), .A1(n130), .A2(n124), .B0(n131), .B1(B[3]), .Y(
        n126) );
  AOI221XL U215 ( .A0(B[1]), .A1(n129), .B0(n123), .B1(B[0]), .C0(n132), .Y(
        n128) );
  OAI21XL U216 ( .A0(B[2]), .A1(n130), .B0(n124), .Y(n125) );
  AO22X1 U217 ( .A0(n133), .A1(A[4]), .B0(n126), .B1(n125), .Y(n127) );
  OAI22XL U218 ( .A0(A[4]), .A1(n133), .B0(n128), .B1(n127), .Y(N47) );
endmodule


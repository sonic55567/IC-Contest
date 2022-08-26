/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : Q-2019.12
// Date      : Wed Mar  2 20:33:01 2022
/////////////////////////////////////////////////////////////


module S2 ( clk, rst, updown, S2_done, RB2_RW, RB2_A, RB2_D, RB2_Q, sen, sd );
  output [2:0] RB2_A;
  output [17:0] RB2_D;
  input [17:0] RB2_Q;
  input clk, rst, updown;
  output S2_done, RB2_RW;
  inout sen,  sd;
  wire   n292, n293, n294, n295, n296, n297, n298, n299, n300, n301, n302,
         n303, n304, n305, n306, n307, n308, n309, n310, n311, n312, n313,
         n314, sen_reg, sd_reg, N145, N146, N147, N148, N150, N151, N152, N153,
         N165, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n36, n37,
         n38, n39, n40, n43, n44, n45, n47, n49, n50, n54, n56, n58, n60, n61,
         n62, n63, n64, n66, n68, n69, n70, n71, n72, n73, n74, n77, n78, n79,
         n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93,
         n95, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108,
         n109, n110, n112, n113, n114, n115, n116, n117, n118, n119, n120,
         n121, n122, n123, n124, n125, n126, n127, n128, n129, n130, n131,
         n132, n133, n134, n135, n136, n137, n138, n139, n140, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176,
         n177, n178, n179, n180, n181, n182, n183, n184, n185, n186, n187,
         n188, n189, n190, n191, n192, n193, n194, n195, n196, n197, n198,
         n199, n200, n201, n202, n203, n204, n205, n206, n207, n208, n209,
         n210, n211, n212, n213, n214, n215, n216, n217, n218, n219, n220,
         n221, n222, n223, n224, n225, n226, n227, n228, n229, n230, n231,
         n232, n233, n234, n235, n236, n237, n238, n239, n240, n241, n265,
         n266, n267, n268, n269, n270, n271, n272, n273, n274, n275, n276,
         n277, n278, n279, n280, n281, n282, n283, n284, n285, n286, n287,
         n288, n289, n290, n291;
  wire   [2:0] state;
  wire   [4:0] S1_A;
  wire   [4:0] count;
  wire   [4:2] \add_96/carry ;

  TBUFX16 sd_tri ( .A(sd_reg), .OE(updown), .Y(sd) );
  TBUFX16 sen_tri ( .A(sen_reg), .OE(updown), .Y(sen) );
  DFFRX1 \S1_A_reg[1]  ( .D(n227), .CK(clk), .RN(n275), .Q(S1_A[1]), .QN(n145)
         );
  DFFRX1 \S1_A_reg[2]  ( .D(n234), .CK(clk), .RN(n275), .Q(S1_A[2]), .QN(n144)
         );
  DFFRX1 \S1_A_reg[4]  ( .D(n232), .CK(clk), .RN(n275), .Q(S1_A[4]), .QN(n142)
         );
  DFFRX1 \S1_A_reg[3]  ( .D(n237), .CK(clk), .RN(n275), .Q(S1_A[3]), .QN(n143)
         );
  DFFSX1 sen_reg_reg ( .D(n178), .CK(clk), .SN(n268), .Q(sen_reg) );
  DFFSX1 RB2_RW_reg ( .D(n230), .CK(clk), .SN(n268), .Q(n293), .QN(n146) );
  DFFRX1 \RB2_A_reg[0]  ( .D(n183), .CK(clk), .RN(n275), .Q(n296), .QN(n149)
         );
  DFFRX1 \RB2_A_reg[1]  ( .D(n182), .CK(clk), .RN(n268), .Q(n295), .QN(n148)
         );
  DFFRX1 \RB2_D_reg[0]  ( .D(n198), .CK(clk), .RN(n268), .Q(n314), .QN(n121)
         );
  DFFRX1 \RB2_D_reg[4]  ( .D(n188), .CK(clk), .RN(n268), .Q(n310), .QN(n125)
         );
  DFFRX1 \RB2_D_reg[8]  ( .D(n190), .CK(clk), .RN(n268), .Q(n306), .QN(n129)
         );
  DFFRX1 \RB2_D_reg[12]  ( .D(n192), .CK(clk), .RN(n268), .Q(n302), .QN(n133)
         );
  DFFRX1 \RB2_D_reg[16]  ( .D(n194), .CK(clk), .RN(n268), .Q(n298), .QN(n137)
         );
  DFFRX1 \RB2_D_reg[1]  ( .D(n196), .CK(clk), .RN(n268), .Q(n313), .QN(n122)
         );
  DFFRX1 \RB2_D_reg[2]  ( .D(n200), .CK(clk), .RN(n268), .Q(n312), .QN(n123)
         );
  DFFRX1 \RB2_D_reg[3]  ( .D(n202), .CK(clk), .RN(n268), .Q(n311), .QN(n124)
         );
  DFFRX1 \RB2_D_reg[5]  ( .D(n204), .CK(clk), .RN(n268), .Q(n309), .QN(n126)
         );
  DFFRX1 \RB2_D_reg[6]  ( .D(n206), .CK(clk), .RN(n268), .Q(n308), .QN(n127)
         );
  DFFRX1 \RB2_D_reg[7]  ( .D(n208), .CK(clk), .RN(n268), .Q(n307), .QN(n128)
         );
  DFFRX1 \RB2_D_reg[9]  ( .D(n210), .CK(clk), .RN(n268), .Q(n305), .QN(n130)
         );
  DFFRX1 \RB2_D_reg[10]  ( .D(n212), .CK(clk), .RN(n268), .Q(n304), .QN(n131)
         );
  DFFRX1 \RB2_D_reg[11]  ( .D(n214), .CK(clk), .RN(n275), .Q(n303), .QN(n132)
         );
  DFFRX1 \RB2_D_reg[13]  ( .D(n216), .CK(clk), .RN(n275), .Q(n301), .QN(n134)
         );
  DFFRX1 \RB2_D_reg[14]  ( .D(n218), .CK(clk), .RN(n275), .Q(n300), .QN(n135)
         );
  DFFRX1 \RB2_D_reg[15]  ( .D(n220), .CK(clk), .RN(n275), .Q(n299), .QN(n136)
         );
  DFFRX1 \RB2_D_reg[17]  ( .D(n222), .CK(clk), .RN(n275), .Q(n297), .QN(n138)
         );
  DFFRX1 S2_done_reg ( .D(n224), .CK(clk), .RN(n275), .Q(n292), .QN(n139) );
  DFFRX1 \RB2_A_reg[2]  ( .D(n238), .CK(clk), .RN(n275), .Q(n294), .QN(n147)
         );
  DFFRX1 \state_reg[1]  ( .D(n180), .CK(clk), .RN(n275), .Q(state[1]), .QN(
        n286) );
  DFFRX1 sd_reg_reg ( .D(n186), .CK(clk), .RN(n275), .Q(sd_reg) );
  DFFX1 \count_reg[2]  ( .D(n170), .CK(clk), .Q(count[2]), .QN(n290) );
  DFFX2 \count_reg[1]  ( .D(n240), .CK(clk), .Q(count[1]), .QN(n288) );
  DFFX2 \count_reg[4]  ( .D(n225), .CK(clk), .Q(count[4]), .QN(n287) );
  DFFX2 \count_reg[3]  ( .D(n228), .CK(clk), .Q(count[3]), .QN(n291) );
  DFFRX2 \state_reg[0]  ( .D(n235), .CK(clk), .RN(n275), .Q(state[0]) );
  DFFX1 \count_reg[0]  ( .D(n172), .CK(clk), .Q(count[0]), .QN(n283) );
  DFFRX1 \state_reg[2]  ( .D(n179), .CK(clk), .RN(n275), .Q(state[2]) );
  DFFRXL \S1_A_reg[0]  ( .D(n176), .CK(clk), .RN(n275), .Q(S1_A[0]), .QN(n120)
         );
  INVXL U155 ( .A(n163), .Y(n187) );
  CLKINVX1 U156 ( .A(n187), .Y(n188) );
  INVXL U157 ( .A(n159), .Y(n189) );
  CLKINVX1 U158 ( .A(n189), .Y(n190) );
  INVXL U159 ( .A(n155), .Y(n191) );
  CLKINVX1 U160 ( .A(n191), .Y(n192) );
  INVXL U161 ( .A(n151), .Y(n193) );
  CLKINVX1 U162 ( .A(n193), .Y(n194) );
  INVXL U163 ( .A(n166), .Y(n195) );
  CLKINVX1 U164 ( .A(n195), .Y(n196) );
  INVXL U165 ( .A(n167), .Y(n197) );
  CLKINVX1 U166 ( .A(n197), .Y(n198) );
  INVXL U167 ( .A(n165), .Y(n199) );
  CLKINVX1 U168 ( .A(n199), .Y(n200) );
  INVXL U169 ( .A(n164), .Y(n201) );
  CLKINVX1 U170 ( .A(n201), .Y(n202) );
  INVXL U171 ( .A(n162), .Y(n203) );
  CLKINVX1 U172 ( .A(n203), .Y(n204) );
  INVXL U173 ( .A(n161), .Y(n205) );
  CLKINVX1 U174 ( .A(n205), .Y(n206) );
  INVXL U175 ( .A(n160), .Y(n207) );
  CLKINVX1 U176 ( .A(n207), .Y(n208) );
  INVXL U177 ( .A(n158), .Y(n209) );
  CLKINVX1 U178 ( .A(n209), .Y(n210) );
  INVXL U179 ( .A(n157), .Y(n211) );
  CLKINVX1 U180 ( .A(n211), .Y(n212) );
  INVXL U181 ( .A(n156), .Y(n213) );
  CLKINVX1 U182 ( .A(n213), .Y(n214) );
  INVXL U183 ( .A(n154), .Y(n215) );
  CLKINVX1 U184 ( .A(n215), .Y(n216) );
  INVXL U185 ( .A(n153), .Y(n217) );
  CLKINVX1 U186 ( .A(n217), .Y(n218) );
  INVXL U187 ( .A(n152), .Y(n219) );
  CLKINVX1 U188 ( .A(n219), .Y(n220) );
  INVXL U189 ( .A(n150), .Y(n221) );
  CLKINVX1 U190 ( .A(n221), .Y(n222) );
  INVXL U191 ( .A(n140), .Y(n223) );
  CLKINVX1 U192 ( .A(n223), .Y(n224) );
  BUFX2 U193 ( .A(n184), .Y(n225) );
  OAI211XL U194 ( .A0(n274), .A1(n287), .B0(n86), .C0(n60), .Y(n184) );
  CLKINVX1 U195 ( .A(n175), .Y(n226) );
  CLKINVX1 U196 ( .A(n226), .Y(n227) );
  BUFX2 U197 ( .A(n169), .Y(n228) );
  CLKINVX1 U198 ( .A(n168), .Y(n229) );
  CLKINVX1 U199 ( .A(n229), .Y(n230) );
  CLKINVX1 U200 ( .A(n177), .Y(n231) );
  CLKINVX1 U201 ( .A(n231), .Y(n232) );
  CLKINVX1 U202 ( .A(n174), .Y(n233) );
  CLKINVX1 U203 ( .A(n233), .Y(n234) );
  BUFX2 U204 ( .A(n181), .Y(n235) );
  CLKINVX1 U205 ( .A(n173), .Y(n236) );
  CLKINVX1 U206 ( .A(n236), .Y(n237) );
  BUFX2 U207 ( .A(n185), .Y(n238) );
  CLKINVX1 U208 ( .A(n171), .Y(n239) );
  CLKINVX1 U209 ( .A(n239), .Y(n240) );
  NOR2X1 U210 ( .A(count[1]), .B(count[0]), .Y(n269) );
  INVX3 U211 ( .A(rst), .Y(n275) );
  NAND4XL U212 ( .A(N165), .B(count[4]), .C(n56), .D(n291), .Y(n82) );
  INVX3 U213 ( .A(state[2]), .Y(n241) );
  BUFX12 U214 ( .A(n294), .Y(RB2_A[2]) );
  BUFX12 U215 ( .A(n292), .Y(S2_done) );
  BUFX12 U216 ( .A(n297), .Y(RB2_D[17]) );
  BUFX12 U217 ( .A(n299), .Y(RB2_D[15]) );
  BUFX12 U218 ( .A(n300), .Y(RB2_D[14]) );
  BUFX12 U219 ( .A(n301), .Y(RB2_D[13]) );
  BUFX12 U220 ( .A(n303), .Y(RB2_D[11]) );
  BUFX12 U221 ( .A(n304), .Y(RB2_D[10]) );
  BUFX12 U222 ( .A(n305), .Y(RB2_D[9]) );
  BUFX12 U223 ( .A(n307), .Y(RB2_D[7]) );
  BUFX12 U224 ( .A(n308), .Y(RB2_D[6]) );
  BUFX12 U225 ( .A(n309), .Y(RB2_D[5]) );
  BUFX12 U226 ( .A(n311), .Y(RB2_D[3]) );
  BUFX12 U227 ( .A(n312), .Y(RB2_D[2]) );
  BUFX12 U228 ( .A(n313), .Y(RB2_D[1]) );
  BUFX12 U229 ( .A(n298), .Y(RB2_D[16]) );
  BUFX12 U230 ( .A(n302), .Y(RB2_D[12]) );
  BUFX12 U231 ( .A(n306), .Y(RB2_D[8]) );
  BUFX12 U232 ( .A(n310), .Y(RB2_D[4]) );
  BUFX12 U233 ( .A(n314), .Y(RB2_D[0]) );
  BUFX12 U234 ( .A(n295), .Y(RB2_A[1]) );
  BUFX12 U235 ( .A(n296), .Y(RB2_A[0]) );
  BUFX12 U236 ( .A(n293), .Y(RB2_RW) );
  OAI31XL U237 ( .A0(n276), .A1(n56), .A2(n266), .B0(n268), .Y(n87) );
  CLKINVX1 U238 ( .A(updown), .Y(n277) );
  NOR2X1 U239 ( .A(sen), .B(updown), .Y(n56) );
  NOR3X1 U240 ( .A(N165), .B(count[2]), .C(n278), .Y(n18) );
  NAND2BX1 U241 ( .AN(n17), .B(sd), .Y(n15) );
  NAND2BX1 U242 ( .AN(n14), .B(sd), .Y(n12) );
  NAND2BX1 U243 ( .AN(n26), .B(sd), .Y(n24) );
  NAND2BX1 U244 ( .AN(n23), .B(sd), .Y(n21) );
  NOR2X1 U245 ( .A(count[1]), .B(count[2]), .Y(n108) );
  NOR2X1 U246 ( .A(n290), .B(count[1]), .Y(n109) );
  NAND2X1 U247 ( .A(count[0]), .B(n288), .Y(n14) );
  NAND2X1 U248 ( .A(count[1]), .B(count[0]), .Y(n23) );
  NAND2X1 U249 ( .A(count[1]), .B(n283), .Y(n26) );
  CLKINVX1 U250 ( .A(n87), .Y(n274) );
  NAND2X1 U251 ( .A(n274), .B(n276), .Y(n60) );
  CLKINVX1 U252 ( .A(n72), .Y(n279) );
  CLKBUFX3 U253 ( .A(n64), .Y(n266) );
  NOR2X1 U254 ( .A(n284), .B(n277), .Y(n64) );
  CLKINVX1 U255 ( .A(n54), .Y(n284) );
  CLKINVX1 U256 ( .A(n56), .Y(n278) );
  CLKBUFX3 U257 ( .A(n43), .Y(n267) );
  NAND3X1 U258 ( .A(n291), .B(n287), .C(n18), .Y(n43) );
  NAND2X2 U259 ( .A(n29), .B(n291), .Y(n36) );
  AOI2BB1X1 U260 ( .A0N(n56), .A1N(updown), .B0(n87), .Y(n58) );
  OAI221XL U261 ( .A0(n282), .A1(n60), .B0(n274), .B1(n290), .C0(n61), .Y(n170) );
  CLKINVX1 U262 ( .A(n9), .Y(n282) );
  NAND2X1 U263 ( .A(N151), .B(n58), .Y(n61) );
  CLKINVX1 U264 ( .A(n10), .Y(n276) );
  OAI31X1 U265 ( .A0(n73), .A1(n63), .A2(n241), .B0(updown), .Y(n72) );
  OAI21X1 U266 ( .A0(n241), .A1(n286), .B0(n279), .Y(n69) );
  OAI22XL U267 ( .A0(n69), .A1(n70), .B0(n71), .B1(n241), .Y(n179) );
  NOR2BX1 U268 ( .AN(n69), .B(n72), .Y(n71) );
  CLKBUFX3 U269 ( .A(n275), .Y(n268) );
  NAND2X1 U270 ( .A(updown), .B(n92), .Y(n83) );
  OAI211X1 U271 ( .A0(n241), .A1(n73), .B0(n70), .C0(n285), .Y(n92) );
  NOR2X1 U272 ( .A(n92), .B(n241), .Y(n54) );
  CLKINVX1 U273 ( .A(n68), .Y(n285) );
  NOR2X1 U274 ( .A(n288), .B(n290), .Y(n110) );
  CLKINVX1 U275 ( .A(n81), .Y(n289) );
  NAND2X2 U276 ( .A(n283), .B(n288), .Y(n17) );
  OAI2BB2XL U277 ( .B0(n146), .B1(n50), .A0N(n50), .A1N(n265), .Y(n168) );
  OR2X1 U278 ( .A(n276), .B(updown), .Y(n265) );
  OAI221XL U279 ( .A0(n17), .A1(n267), .B0(n54), .B1(n277), .C0(n10), .Y(n50)
         );
  NAND2X2 U280 ( .A(count[3]), .B(n29), .Y(n20) );
  NAND3X2 U281 ( .A(n18), .B(n287), .C(count[3]), .Y(n30) );
  AOI2BB2X1 U282 ( .B0(n56), .B1(sd), .A0N(n277), .A1N(n70), .Y(n80) );
  NOR4X1 U283 ( .A(n290), .B(n278), .C(N165), .D(count[4]), .Y(n29) );
  NAND2X1 U284 ( .A(sen), .B(n277), .Y(n10) );
  OAI221XL U285 ( .A0(n9), .A1(n60), .B0(n274), .B1(n283), .C0(n62), .Y(n172)
         );
  NAND2X1 U286 ( .A(n283), .B(n58), .Y(n62) );
  NAND3X1 U287 ( .A(n18), .B(n291), .C(count[4]), .Y(n11) );
  NAND2X1 U288 ( .A(N153), .B(n58), .Y(n86) );
  OAI22XL U289 ( .A0(n20), .A1(n24), .B0(n135), .B1(n25), .Y(n153) );
  NOR2X1 U290 ( .A(n20), .B(n26), .Y(n25) );
  OAI22XL U291 ( .A0(n20), .A1(n21), .B0(n136), .B1(n22), .Y(n152) );
  NOR2X1 U292 ( .A(n23), .B(n20), .Y(n22) );
  OAI22XL U293 ( .A0(n15), .A1(n20), .B0(n133), .B1(n28), .Y(n155) );
  NOR2X1 U294 ( .A(n17), .B(n20), .Y(n28) );
  OAI22XL U295 ( .A0(n12), .A1(n20), .B0(n134), .B1(n27), .Y(n154) );
  NOR2X1 U296 ( .A(n14), .B(n20), .Y(n27) );
  OAI22XL U297 ( .A0(n15), .A1(n36), .B0(n125), .B1(n40), .Y(n163) );
  NOR2X1 U298 ( .A(n17), .B(n36), .Y(n40) );
  OAI22XL U299 ( .A0(n12), .A1(n36), .B0(n126), .B1(n39), .Y(n162) );
  NOR2X1 U300 ( .A(n14), .B(n36), .Y(n39) );
  OAI22XL U301 ( .A0(n24), .A1(n36), .B0(n127), .B1(n38), .Y(n161) );
  NOR2X1 U302 ( .A(n26), .B(n36), .Y(n38) );
  OAI22XL U303 ( .A0(n21), .A1(n36), .B0(n128), .B1(n37), .Y(n160) );
  NOR2X1 U304 ( .A(n23), .B(n36), .Y(n37) );
  OAI22XL U305 ( .A0(n15), .A1(n267), .B0(n121), .B1(n49), .Y(n167) );
  NOR2X1 U306 ( .A(n17), .B(n267), .Y(n49) );
  OAI22XL U307 ( .A0(n15), .A1(n30), .B0(n129), .B1(n34), .Y(n159) );
  NOR2X1 U308 ( .A(n17), .B(n30), .Y(n34) );
  OAI22XL U309 ( .A0(n12), .A1(n267), .B0(n122), .B1(n47), .Y(n166) );
  NOR2X1 U310 ( .A(n14), .B(n267), .Y(n47) );
  OAI22XL U311 ( .A0(n12), .A1(n30), .B0(n130), .B1(n33), .Y(n158) );
  NOR2X1 U312 ( .A(n14), .B(n30), .Y(n33) );
  OAI22XL U313 ( .A0(n24), .A1(n30), .B0(n131), .B1(n32), .Y(n157) );
  NOR2X1 U314 ( .A(n26), .B(n30), .Y(n32) );
  OAI22XL U315 ( .A0(n21), .A1(n30), .B0(n132), .B1(n31), .Y(n156) );
  NOR2X1 U316 ( .A(n23), .B(n30), .Y(n31) );
  OAI22XL U317 ( .A0(n24), .A1(n267), .B0(n123), .B1(n45), .Y(n165) );
  NOR2X1 U318 ( .A(n26), .B(n267), .Y(n45) );
  OAI22XL U319 ( .A0(n21), .A1(n267), .B0(n124), .B1(n44), .Y(n164) );
  NOR2X1 U320 ( .A(n23), .B(n267), .Y(n44) );
  OAI22XL U321 ( .A0(n11), .A1(n15), .B0(n137), .B1(n16), .Y(n151) );
  NOR2X1 U322 ( .A(n11), .B(n17), .Y(n16) );
  OAI22XL U323 ( .A0(n11), .A1(n12), .B0(n138), .B1(n13), .Y(n150) );
  NOR2X1 U324 ( .A(n11), .B(n14), .Y(n13) );
  OAI2BB2XL U325 ( .B0(n274), .B1(n291), .A0N(N152), .A1N(n58), .Y(n169) );
  OAI2BB2XL U326 ( .B0(n274), .B1(n288), .A0N(N150), .A1N(n58), .Y(n171) );
  OAI2BB2XL U327 ( .B0(n147), .B1(n88), .A0N(n89), .A1N(n88), .Y(n185) );
  OAI21XL U328 ( .A0(n277), .A1(n90), .B0(n80), .Y(n89) );
  OAI31XL U329 ( .A0(n82), .A1(n17), .A2(n290), .B0(n83), .Y(n88) );
  XNOR2X1 U330 ( .A(n147), .B(n91), .Y(n90) );
  OAI2BB2XL U331 ( .B0(n149), .B1(n84), .A0N(n85), .A1N(n84), .Y(n183) );
  OAI2BB1X1 U332 ( .A0N(updown), .A1N(n149), .B0(n80), .Y(n85) );
  OAI31XL U333 ( .A0(n81), .A1(count[0]), .A2(n82), .B0(n83), .Y(n84) );
  OAI2BB2XL U334 ( .B0(n148), .B1(n77), .A0N(n78), .A1N(n77), .Y(n182) );
  OAI21XL U335 ( .A0(n277), .A1(n79), .B0(n80), .Y(n78) );
  OAI31XL U336 ( .A0(n81), .A1(n283), .A2(n82), .B0(n83), .Y(n77) );
  XOR2X1 U337 ( .A(n148), .B(n149), .Y(n79) );
  OAI22XL U338 ( .A0(count[0]), .A1(n102), .B0(n103), .B1(n283), .Y(n101) );
  AOI222XL U339 ( .A0(RB2_Q[17]), .A1(count[4]), .B0(n104), .B1(n291), .C0(
        count[3]), .C1(n105), .Y(n103) );
  AOI222XL U340 ( .A0(RB2_Q[16]), .A1(count[4]), .B0(n114), .B1(n291), .C0(
        count[3]), .C1(n115), .Y(n102) );
  NAND2X1 U341 ( .A(n106), .B(n107), .Y(n105) );
  AOI22X1 U342 ( .A0(RB2_Q[15]), .A1(n110), .B0(RB2_Q[11]), .B1(n289), .Y(n106) );
  NAND2X1 U343 ( .A(n116), .B(n117), .Y(n115) );
  AOI22X1 U344 ( .A0(RB2_Q[8]), .A1(n108), .B0(RB2_Q[12]), .B1(n109), .Y(n117)
         );
  AOI22X1 U345 ( .A0(RB2_Q[14]), .A1(n110), .B0(RB2_Q[10]), .B1(n289), .Y(n116) );
  AOI22X1 U346 ( .A0(RB2_Q[9]), .A1(n108), .B0(RB2_Q[13]), .B1(n109), .Y(n107)
         );
  OAI2BB2XL U347 ( .B0(state[0]), .B1(n69), .A0N(n72), .A1N(state[0]), .Y(n181) );
  OAI21XL U348 ( .A0(n9), .A1(n10), .B0(n139), .Y(n140) );
  OAI2BB2XL U349 ( .B0(n73), .B1(n69), .A0N(state[1]), .A1N(n74), .Y(n180) );
  OAI21XL U350 ( .A0(state[0]), .A1(n69), .B0(n279), .Y(n74) );
  OAI2BB2XL U351 ( .B0(n120), .B1(n266), .A0N(n120), .A1N(n266), .Y(n176) );
  OAI2BB2XL U352 ( .B0(n145), .B1(n266), .A0N(N145), .A1N(n266), .Y(n175) );
  OAI2BB2XL U353 ( .B0(n143), .B1(n266), .A0N(N147), .A1N(n266), .Y(n173) );
  OAI2BB2XL U354 ( .B0(n142), .B1(n266), .A0N(N148), .A1N(n266), .Y(n177) );
  OAI2BB2XL U355 ( .B0(n144), .B1(n266), .A0N(N146), .A1N(n266), .Y(n174) );
  CLKINVX1 U356 ( .A(n98), .Y(n281) );
  OAI32X1 U357 ( .A0(n99), .A1(state[2]), .A2(state[0]), .B0(n100), .B1(n73), 
        .Y(n98) );
  OA22X1 U358 ( .A0(n286), .A1(n144), .B0(state[1]), .B1(n142), .Y(n99) );
  AOI2BB2X1 U359 ( .B0(state[2]), .B1(n101), .A0N(n143), .A1N(state[2]), .Y(
        n100) );
  NAND2X1 U360 ( .A(n118), .B(n119), .Y(n114) );
  AOI22X1 U361 ( .A0(RB2_Q[6]), .A1(n110), .B0(RB2_Q[2]), .B1(n289), .Y(n118)
         );
  AOI32X1 U362 ( .A0(n108), .A1(n287), .A2(RB2_Q[0]), .B0(RB2_Q[4]), .B1(n109), 
        .Y(n119) );
  NAND2X1 U363 ( .A(n112), .B(n113), .Y(n104) );
  AOI22X1 U364 ( .A0(RB2_Q[7]), .A1(n110), .B0(RB2_Q[3]), .B1(n289), .Y(n112)
         );
  AOI32X1 U365 ( .A0(n108), .A1(n287), .A2(RB2_Q[1]), .B0(RB2_Q[5]), .B1(n109), 
        .Y(n113) );
  AO22X1 U366 ( .A0(n93), .A1(n280), .B0(n95), .B1(sd_reg), .Y(n186) );
  CLKINVX1 U367 ( .A(n95), .Y(n280) );
  NAND2X1 U368 ( .A(updown), .B(n284), .Y(n95) );
  OAI221XL U369 ( .A0(n70), .A1(n145), .B0(n285), .B1(n120), .C0(n281), .Y(n93) );
  OAI2BB2XL U370 ( .B0(n284), .B1(n66), .A0N(n66), .A1N(sen_reg), .Y(n178) );
  OAI31XL U371 ( .A0(n241), .A1(n68), .A2(n54), .B0(updown), .Y(n66) );
  NAND2X1 U372 ( .A(state[0]), .B(n286), .Y(n73) );
  NAND3X1 U373 ( .A(state[0]), .B(n241), .C(state[1]), .Y(n70) );
  NOR3X1 U374 ( .A(state[0]), .B(state[1]), .C(n241), .Y(n68) );
  NAND2X1 U375 ( .A(count[1]), .B(n290), .Y(n81) );
  NAND2X1 U376 ( .A(n146), .B(n63), .Y(n9) );
  NOR3X1 U377 ( .A(n148), .B(n147), .C(n149), .Y(n63) );
  NAND2X1 U378 ( .A(n149), .B(n148), .Y(n91) );
  CLKINVX1 U379 ( .A(count[2]), .Y(n272) );
  ADDHXL U380 ( .A(S1_A[1]), .B(S1_A[0]), .CO(\add_96/carry [2]), .S(N145) );
  ADDHXL U381 ( .A(S1_A[2]), .B(\add_96/carry [2]), .CO(\add_96/carry [3]), 
        .S(N146) );
  ADDHXL U382 ( .A(S1_A[3]), .B(\add_96/carry [3]), .CO(\add_96/carry [4]), 
        .S(N147) );
  AO21X1 U383 ( .A0(count[0]), .A1(count[1]), .B0(n269), .Y(N150) );
  NAND2X1 U384 ( .A(n269), .B(n272), .Y(n270) );
  OAI21XL U385 ( .A0(n269), .A1(n272), .B0(n270), .Y(N151) );
  XNOR2X1 U386 ( .A(count[3]), .B(n270), .Y(N152) );
  NOR2X1 U387 ( .A(count[3]), .B(n270), .Y(n271) );
  XOR2X1 U388 ( .A(count[4]), .B(n271), .Y(N153) );
  XOR2X1 U389 ( .A(\add_96/carry [4]), .B(S1_A[4]), .Y(N148) );
  OR2X1 U390 ( .A(count[2]), .B(count[1]), .Y(n273) );
  AO22X1 U391 ( .A0(n273), .A1(count[4]), .B0(count[3]), .B1(count[4]), .Y(
        N165) );
endmodule


/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP2
// Date      : Wed Apr 18 21:51:01 2018
/////////////////////////////////////////////////////////////


module alu_DW01_addsub_0 ( A, B, CI, ADD_SUB, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI, ADD_SUB;
  output CO;

  wire   [9:0] carry;
  wire   [8:0] B_AS;
  assign carry[0] = ADD_SUB;

  XOR3X1 U1_8 ( .IN1(A[8]), .IN2(carry[0]), .IN3(carry[8]), .Q(SUM[8]) );
  FADDX1 U1_7 ( .A(A[7]), .B(B_AS[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  FADDX1 U1_6 ( .A(A[6]), .B(B_AS[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  FADDX1 U1_5 ( .A(A[5]), .B(B_AS[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  FADDX1 U1_4 ( .A(A[4]), .B(B_AS[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  FADDX1 U1_3 ( .A(A[3]), .B(B_AS[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  FADDX1 U1_2 ( .A(A[2]), .B(B_AS[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  FADDX1 U1_1 ( .A(A[1]), .B(B_AS[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1]) );
  FADDX1 U1_0 ( .A(A[0]), .B(B_AS[0]), .CI(carry[0]), .CO(carry[1]), .S(SUM[0]) );
  XOR2X1 U1 ( .IN1(B[7]), .IN2(carry[0]), .Q(B_AS[7]) );
  XOR2X1 U2 ( .IN1(B[6]), .IN2(carry[0]), .Q(B_AS[6]) );
  XOR2X1 U3 ( .IN1(B[5]), .IN2(carry[0]), .Q(B_AS[5]) );
  XOR2X1 U4 ( .IN1(B[4]), .IN2(carry[0]), .Q(B_AS[4]) );
  XOR2X1 U5 ( .IN1(B[3]), .IN2(carry[0]), .Q(B_AS[3]) );
  XOR2X1 U6 ( .IN1(B[2]), .IN2(carry[0]), .Q(B_AS[2]) );
  XOR2X1 U7 ( .IN1(B[1]), .IN2(carry[0]), .Q(B_AS[1]) );
  XOR2X1 U8 ( .IN1(B[0]), .IN2(carry[0]), .Q(B_AS[0]) );
endmodule


module alu ( in_a, in_b, opcode, alu_out, alu_zero, alu_carry );
  input [7:0] in_a;
  input [7:0] in_b;
  input [3:0] opcode;
  output [7:0] alu_out;
  output alu_zero, alu_carry;
  wire   N77, N78, N79, N80, N81, N82, N83, N84, N85, N86, N87, N88, N89, N90,
         N91, N92, N93, N94, N95, N96, N97, N98, N99, N100, N101, N102, N103,
         N104, N105, N106, N107, N108, N109, \U3/U1/Z_0 , \U3/U1/Z_1 ,
         \U3/U1/Z_2 , \U3/U1/Z_3 , \U3/U1/Z_4 , \U3/U1/Z_5 , \U3/U1/Z_6 ,
         \U3/U1/Z_7 , \U3/U2/Z_0 , \U3/U2/Z_1 , \U3/U2/Z_2 , \U3/U2/Z_3 ,
         \U3/U2/Z_4 , \U3/U2/Z_5 , \U3/U2/Z_6 , \U3/U2/Z_7 , \U3/U3/Z_0 , n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176,
         n177, n178, n179, n180, n181, n182, n183, n184, n185, n186, n187,
         n188, n189, n190, n191, n192, n193, n194, n195, n196, n197, n198,
         n199, n200, n201, n202, n203, n204, n205, n206, n207, n208, n209,
         n210, n211, n212, n213, n214, n215, n216, n217, n218, n219, n220,
         n221, n222, n223, n224, n225, n226, n227;

  alu_DW01_addsub_0 r30 ( .A({n227, \U3/U1/Z_7 , \U3/U1/Z_6 , \U3/U1/Z_5 , 
        \U3/U1/Z_4 , \U3/U1/Z_3 , \U3/U1/Z_2 , \U3/U1/Z_1 , \U3/U1/Z_0 }), .B(
        {1'b0, \U3/U2/Z_7 , \U3/U2/Z_6 , \U3/U2/Z_5 , \U3/U2/Z_4 , \U3/U2/Z_3 , 
        \U3/U2/Z_2 , \U3/U2/Z_1 , \U3/U2/Z_0 }), .CI(1'b0), .ADD_SUB(
        \U3/U3/Z_0 ), .SUM({N85, N84, N83, N82, N81, N80, N79, N78, N77}) );
  INVX0 U163 ( .IN(n147), .QN(n190) );
  INVX0 U164 ( .IN(n179), .QN(n192) );
  INVX0 U165 ( .IN(n180), .QN(n191) );
  INVX0 U166 ( .IN(opcode[0]), .QN(n188) );
  INVX0 U167 ( .IN(opcode[1]), .QN(n189) );
  AND2X1 U168 ( .IN1(opcode[3]), .IN2(n217), .Q(n151) );
  NAND2X0 U169 ( .IN1(n188), .IN2(n189), .QN(n147) );
  AND2X1 U170 ( .IN1(n151), .IN2(n190), .Q(n173) );
  NOR2X0 U171 ( .IN1(n217), .IN2(opcode[3]), .QN(n145) );
  AND2X1 U172 ( .IN1(n145), .IN2(opcode[0]), .Q(n143) );
  AND2X1 U173 ( .IN1(n143), .IN2(n189), .Q(n178) );
  NAND3X0 U174 ( .IN1(opcode[1]), .IN2(n188), .IN3(n151), .QN(n179) );
  AND2X1 U175 ( .IN1(n143), .IN2(opcode[1]), .Q(n177) );
  AO22X1 U176 ( .IN1(n226), .IN2(n192), .IN3(N109), .IN4(n177), .Q(n144) );
  AO221X1 U177 ( .IN1(n173), .IN2(in_a[1]), .IN3(N93), .IN4(n178), .IN5(n144), 
        .Q(n150) );
  NOR2X0 U178 ( .IN1(opcode[2]), .IN2(opcode[3]), .QN(n148) );
  AO22X1 U179 ( .IN1(opcode[2]), .IN2(opcode[3]), .IN3(n148), .IN4(n190), .Q(
        n181) );
  AND3X1 U180 ( .IN1(opcode[1]), .IN2(n188), .IN3(n145), .Q(n182) );
  NOR2X0 U181 ( .IN1(n189), .IN2(n188), .QN(n146) );
  AO222X1 U182 ( .IN1(n148), .IN2(n147), .IN3(n146), .IN4(n151), .IN5(n145), 
        .IN6(n190), .Q(n183) );
  AO222X1 U183 ( .IN1(n181), .IN2(in_a[0]), .IN3(N101), .IN4(n182), .IN5(N77), 
        .IN6(n183), .Q(n149) );
  OR2X1 U184 ( .IN1(n150), .IN2(n149), .Q(alu_out[0]) );
  NAND3X0 U185 ( .IN1(opcode[0]), .IN2(n189), .IN3(n151), .QN(n180) );
  AO22X1 U186 ( .IN1(n191), .IN2(in_a[0]), .IN3(N108), .IN4(n177), .Q(n152) );
  AO221X1 U187 ( .IN1(n173), .IN2(in_a[2]), .IN3(N92), .IN4(n178), .IN5(n152), 
        .Q(n155) );
  AO22X1 U188 ( .IN1(N100), .IN2(n182), .IN3(n225), .IN4(n192), .Q(n153) );
  AO221X1 U189 ( .IN1(n181), .IN2(in_a[1]), .IN3(N78), .IN4(n183), .IN5(n153), 
        .Q(n154) );
  OR2X1 U190 ( .IN1(n155), .IN2(n154), .Q(alu_out[1]) );
  AO22X1 U191 ( .IN1(n191), .IN2(in_a[1]), .IN3(N107), .IN4(n177), .Q(n156) );
  AO221X1 U192 ( .IN1(n173), .IN2(in_a[3]), .IN3(N91), .IN4(n178), .IN5(n156), 
        .Q(n159) );
  AO22X1 U193 ( .IN1(N99), .IN2(n182), .IN3(n224), .IN4(n192), .Q(n157) );
  AO221X1 U194 ( .IN1(n181), .IN2(in_a[2]), .IN3(N79), .IN4(n183), .IN5(n157), 
        .Q(n158) );
  OR2X1 U195 ( .IN1(n159), .IN2(n158), .Q(alu_out[2]) );
  AO22X1 U196 ( .IN1(n191), .IN2(in_a[2]), .IN3(N106), .IN4(n177), .Q(n160) );
  AO221X1 U197 ( .IN1(n173), .IN2(in_a[4]), .IN3(N90), .IN4(n178), .IN5(n160), 
        .Q(n163) );
  AO22X1 U198 ( .IN1(N98), .IN2(n182), .IN3(n223), .IN4(n192), .Q(n161) );
  AO221X1 U199 ( .IN1(n181), .IN2(in_a[3]), .IN3(N80), .IN4(n183), .IN5(n161), 
        .Q(n162) );
  OR2X1 U200 ( .IN1(n163), .IN2(n162), .Q(alu_out[3]) );
  AO22X1 U201 ( .IN1(n191), .IN2(in_a[3]), .IN3(N105), .IN4(n177), .Q(n164) );
  AO221X1 U202 ( .IN1(n173), .IN2(in_a[5]), .IN3(N89), .IN4(n178), .IN5(n164), 
        .Q(n167) );
  AO22X1 U203 ( .IN1(N97), .IN2(n182), .IN3(n222), .IN4(n192), .Q(n165) );
  AO221X1 U204 ( .IN1(n181), .IN2(in_a[4]), .IN3(N81), .IN4(n183), .IN5(n165), 
        .Q(n166) );
  OR2X1 U205 ( .IN1(n167), .IN2(n166), .Q(alu_out[4]) );
  AO22X1 U206 ( .IN1(n191), .IN2(in_a[4]), .IN3(N104), .IN4(n177), .Q(n168) );
  AO221X1 U207 ( .IN1(n173), .IN2(in_a[6]), .IN3(N88), .IN4(n178), .IN5(n168), 
        .Q(n171) );
  AO22X1 U208 ( .IN1(N96), .IN2(n182), .IN3(n221), .IN4(n192), .Q(n169) );
  AO221X1 U209 ( .IN1(n181), .IN2(in_a[5]), .IN3(N82), .IN4(n183), .IN5(n169), 
        .Q(n170) );
  OR2X1 U210 ( .IN1(n171), .IN2(n170), .Q(alu_out[5]) );
  AO22X1 U211 ( .IN1(n191), .IN2(in_a[5]), .IN3(N103), .IN4(n177), .Q(n172) );
  AO221X1 U212 ( .IN1(n173), .IN2(in_a[7]), .IN3(N87), .IN4(n178), .IN5(n172), 
        .Q(n176) );
  AO22X1 U213 ( .IN1(N95), .IN2(n182), .IN3(n220), .IN4(n192), .Q(n174) );
  AO221X1 U214 ( .IN1(n181), .IN2(in_a[6]), .IN3(N83), .IN4(n183), .IN5(n174), 
        .Q(n175) );
  OR2X1 U215 ( .IN1(n176), .IN2(n175), .Q(alu_out[6]) );
  NAND2X0 U216 ( .IN1(N102), .IN2(n177), .QN(n187) );
  NAND2X0 U217 ( .IN1(N86), .IN2(n178), .QN(n186) );
  OA22X1 U218 ( .IN1(n220), .IN2(n180), .IN3(n179), .IN4(in_a[7]), .Q(n185) );
  AOI222X1 U219 ( .IN1(N84), .IN2(n183), .IN3(N94), .IN4(n182), .IN5(n181), 
        .IN6(in_a[7]), .QN(n184) );
  NAND4X0 U220 ( .IN1(n187), .IN2(n186), .IN3(n185), .IN4(n184), .QN(
        alu_out[7]) );
  NOR2X0 U221 ( .IN1(n193), .IN2(n194), .QN(alu_zero) );
  OR4X1 U222 ( .IN1(alu_out[1]), .IN2(alu_out[0]), .IN3(alu_out[3]), .IN4(
        alu_out[2]), .Q(n194) );
  OR4X1 U223 ( .IN1(alu_out[5]), .IN2(alu_out[4]), .IN3(alu_out[7]), .IN4(
        alu_out[6]), .Q(n193) );
  NAND2X0 U224 ( .IN1(n195), .IN2(n196), .QN(alu_carry) );
  NAND4X0 U225 ( .IN1(opcode[3]), .IN2(opcode[0]), .IN3(n197), .IN4(in_a[7]), 
        .QN(n196) );
  NOR2X0 U226 ( .IN1(opcode[2]), .IN2(opcode[1]), .QN(n197) );
  NAND2X0 U227 ( .IN1(N85), .IN2(n198), .QN(n195) );
  OR2X1 U228 ( .IN1(n199), .IN2(n227), .Q(n198) );
  NOR2X0 U229 ( .IN1(n200), .IN2(n201), .QN(\U3/U2/Z_7 ) );
  NOR2X0 U230 ( .IN1(n200), .IN2(n202), .QN(\U3/U2/Z_6 ) );
  NOR2X0 U231 ( .IN1(n200), .IN2(n203), .QN(\U3/U2/Z_5 ) );
  NOR2X0 U232 ( .IN1(n200), .IN2(n204), .QN(\U3/U2/Z_4 ) );
  NOR2X0 U233 ( .IN1(n200), .IN2(n205), .QN(\U3/U2/Z_3 ) );
  NOR2X0 U234 ( .IN1(n200), .IN2(n206), .QN(\U3/U2/Z_2 ) );
  NOR2X0 U235 ( .IN1(n200), .IN2(n207), .QN(\U3/U2/Z_1 ) );
  NAND3X0 U236 ( .IN1(n208), .IN2(n209), .IN3(n210), .QN(\U3/U2/Z_0 ) );
  MUX21X1 U237 ( .IN1(n211), .IN2(n212), .S(opcode[1]), .Q(n210) );
  NAND2X0 U238 ( .IN1(n213), .IN2(opcode[0]), .QN(n212) );
  NAND3X0 U239 ( .IN1(n188), .IN2(n214), .IN3(opcode[2]), .QN(n211) );
  OR2X1 U240 ( .IN1(n215), .IN2(n200), .Q(n208) );
  NAND2X0 U241 ( .IN1(n213), .IN2(n216), .QN(n200) );
  XNOR2X1 U242 ( .IN1(opcode[1]), .IN2(n188), .Q(n216) );
  MUX21X1 U243 ( .IN1(n199), .IN2(n227), .S(n219), .Q(\U3/U1/Z_7 ) );
  MUX21X1 U244 ( .IN1(n199), .IN2(n227), .S(n220), .Q(\U3/U1/Z_6 ) );
  MUX21X1 U245 ( .IN1(n199), .IN2(n227), .S(n221), .Q(\U3/U1/Z_5 ) );
  MUX21X1 U246 ( .IN1(n199), .IN2(n227), .S(n222), .Q(\U3/U1/Z_4 ) );
  MUX21X1 U247 ( .IN1(n199), .IN2(n227), .S(n223), .Q(\U3/U1/Z_3 ) );
  MUX21X1 U248 ( .IN1(n199), .IN2(n227), .S(n224), .Q(\U3/U1/Z_2 ) );
  MUX21X1 U249 ( .IN1(n199), .IN2(n227), .S(n225), .Q(\U3/U1/Z_1 ) );
  MUX21X1 U250 ( .IN1(n199), .IN2(n227), .S(n226), .Q(\U3/U1/Z_0 ) );
  INVX0 U251 ( .IN(n209), .QN(n227) );
  NAND4X0 U252 ( .IN1(opcode[3]), .IN2(opcode[1]), .IN3(opcode[0]), .IN4(n217), 
        .QN(n209) );
  AO21X1 U253 ( .IN1(n213), .IN2(opcode[0]), .IN3(\U3/U3/Z_0 ), .Q(n199) );
  AND3X1 U254 ( .IN1(n188), .IN2(n214), .IN3(n218), .Q(\U3/U3/Z_0 ) );
  XNOR2X1 U255 ( .IN1(n217), .IN2(opcode[1]), .Q(n218) );
  INVX0 U256 ( .IN(opcode[2]), .QN(n217) );
  INVX0 U257 ( .IN(opcode[3]), .QN(n214) );
  NOR2X0 U258 ( .IN1(opcode[2]), .IN2(opcode[3]), .QN(n213) );
  NOR2X0 U259 ( .IN1(n224), .IN2(n206), .QN(N99) );
  NOR2X0 U260 ( .IN1(n223), .IN2(n205), .QN(N98) );
  NOR2X0 U261 ( .IN1(n222), .IN2(n204), .QN(N97) );
  NOR2X0 U262 ( .IN1(n221), .IN2(n203), .QN(N96) );
  NOR2X0 U263 ( .IN1(n220), .IN2(n202), .QN(N95) );
  NOR2X0 U264 ( .IN1(n219), .IN2(n201), .QN(N94) );
  NAND2X0 U265 ( .IN1(n215), .IN2(n226), .QN(N93) );
  NAND2X0 U266 ( .IN1(n207), .IN2(n225), .QN(N92) );
  NAND2X0 U267 ( .IN1(n206), .IN2(n224), .QN(N91) );
  INVX0 U268 ( .IN(in_a[2]), .QN(n224) );
  NAND2X0 U269 ( .IN1(n205), .IN2(n223), .QN(N90) );
  INVX0 U270 ( .IN(in_a[3]), .QN(n223) );
  NAND2X0 U271 ( .IN1(n204), .IN2(n222), .QN(N89) );
  INVX0 U272 ( .IN(in_a[4]), .QN(n222) );
  NAND2X0 U273 ( .IN1(n203), .IN2(n221), .QN(N88) );
  INVX0 U274 ( .IN(in_a[5]), .QN(n221) );
  NAND2X0 U275 ( .IN1(n202), .IN2(n220), .QN(N87) );
  INVX0 U276 ( .IN(in_a[6]), .QN(n220) );
  NAND2X0 U277 ( .IN1(n201), .IN2(n219), .QN(N86) );
  INVX0 U278 ( .IN(in_a[7]), .QN(n219) );
  XNOR2X1 U279 ( .IN1(n215), .IN2(in_a[0]), .Q(N109) );
  XNOR2X1 U280 ( .IN1(n207), .IN2(in_a[1]), .Q(N108) );
  XNOR2X1 U281 ( .IN1(n206), .IN2(in_a[2]), .Q(N107) );
  INVX0 U282 ( .IN(in_b[2]), .QN(n206) );
  XNOR2X1 U283 ( .IN1(n205), .IN2(in_a[3]), .Q(N106) );
  INVX0 U284 ( .IN(in_b[3]), .QN(n205) );
  XNOR2X1 U285 ( .IN1(n204), .IN2(in_a[4]), .Q(N105) );
  INVX0 U286 ( .IN(in_b[4]), .QN(n204) );
  XNOR2X1 U287 ( .IN1(n203), .IN2(in_a[5]), .Q(N104) );
  INVX0 U288 ( .IN(in_b[5]), .QN(n203) );
  XNOR2X1 U289 ( .IN1(n202), .IN2(in_a[6]), .Q(N103) );
  INVX0 U290 ( .IN(in_b[6]), .QN(n202) );
  XNOR2X1 U291 ( .IN1(n201), .IN2(in_a[7]), .Q(N102) );
  INVX0 U292 ( .IN(in_b[7]), .QN(n201) );
  NOR2X0 U293 ( .IN1(n226), .IN2(n215), .QN(N101) );
  INVX0 U294 ( .IN(in_b[0]), .QN(n215) );
  INVX0 U295 ( .IN(in_a[0]), .QN(n226) );
  NOR2X0 U296 ( .IN1(n225), .IN2(n207), .QN(N100) );
  INVX0 U297 ( .IN(in_b[1]), .QN(n207) );
  INVX0 U298 ( .IN(in_a[1]), .QN(n225) );
endmodule


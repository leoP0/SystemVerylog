//test.sv

module test (
  input [31:0]       a_in,b_in,  //32 bit comparison inputs
  output      logic  z_out   );  //one output selected

always_comb
  if (a_in <= b_in) z_out = 1'b1;
  else              z_out = 1'b0;
endmodule

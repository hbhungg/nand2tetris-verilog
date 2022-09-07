`ifndef half_adder
  `include "half_adder.sv"
`endif
`define inc_16 1

module inc_16(
  input [15:0] in, 
  output [15:0] out
);
  half_adder f0  (in[0],  1'b1,   c0,  out[0]);
  half_adder f2  (in[1],  c0,  c1,  out[1]);
  half_adder f3  (in[2],  c1,  c2,  out[2]);
  half_adder f4  (in[3],  c2,  c3,  out[3]);
  half_adder f5  (in[4],  c3,  c4,  out[4]);
  half_adder f6  (in[5],  c4,  c5,  out[5]);
  half_adder f7  (in[6],  c5,  c6,  out[6]);
  half_adder f8  (in[7],  c6,  c7,  out[7]);
  half_adder f9  (in[8],  c7,  c8,  out[8]);
  half_adder f10 (in[9],  c8,  c9,  out[9]);
  half_adder f11 (in[10], c9,  c10, out[10]);
  half_adder f12 (in[11], c10, c11, out[11]);
  half_adder f13 (in[12], c11, c12, out[12]);
  half_adder f14 (in[13], c12, c13, out[13]);
  half_adder f15 (in[14], c13, c14, out[14]);
  half_adder f16 (in[15], c14, c15, out[15]);
endmodule

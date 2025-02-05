`ifndef full_adder
   `include "full_adder.sv"
`endif
`define add_16 1

module add_16(
    input  [15:0] a,
    input  [15:0] b,
    output [15:0] out
);
  // Ripple adder
  // I know there should be a better way to do this.
  // But this look cooler i guess.
  half_adder f0  (a[0],  b[0],  c0, out[0]);
  full_adder f1  (a[1],  b[1],  c0,  c1, out[1]);
  full_adder f2  (a[2],  b[2],  c1,  c2, out[2]);
  full_adder f3  (a[3],  b[3],  c2,  c3, out[3]);
  full_adder f4  (a[4],  b[4],  c3,  c4, out[4]);
  full_adder f5  (a[5],  b[5],  c4,  c5, out[5]);
  full_adder f6  (a[6],  b[6],  c5,  c6, out[6]);
  full_adder f7  (a[7],  b[7],  c6,  c7, out[7]);
  full_adder f8  (a[8],  b[8],  c7,  c8, out[8]);
  full_adder f9  (a[9],  b[9],  c8,  c9, out[9]);
  full_adder f10 (a[10], b[10], c9,  c10, out[10]);
  full_adder f11 (a[11], b[11], c10, c11, out[11]);
  full_adder f12 (a[12], b[12], c11, c12, out[12]);
  full_adder f13 (a[13], b[13], c12, c13, out[13]);
  full_adder f14 (a[14], b[14], c13, c14, out[14]);
  full_adder f15 (a[15], b[15], c14, c15, out[15]);
endmodule

`ifndef and_n2t
  `include "and_n2t.sv"
`endif
`define xor_n2t 1

module xor_n2t(input a, input b, output out);
  wire ab_nand;
  wire a_nand;
  wire b_nand;
  nand(ab_nand, a, b);
  nand(a_nand, a, ab_nand);
  nand(b_nand, b, ab_nand);
  nand(out, a_nand, b_nand);
endmodule

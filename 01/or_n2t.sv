`ifndef not_n2t
   `include "not_n2t.sv"
`endif
`define or_n2t 1

module or_n2t(input a, input b, output out);
  wire a_nand, b_nand;
  nand(a_nand, a, a);
  nand(b_nand, b, b);
  nand(out, a_nand, b_nand);
endmodule

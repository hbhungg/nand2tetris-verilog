`ifndef and_n2t
  `include "and_n2t.sv"
`endif
`define and_16 1

module and_16(
   input [15:0] a,
   input [15:0] b,
   output [15:0] out
);
  and_n2t f0 [15:0] (a, b, out);
endmodule

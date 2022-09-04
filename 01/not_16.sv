`ifndef not_n2t
   `include "not_n2t.sv"
`endif
`define not_16 1

module not_16(
    input [15:0] in,
    output [15:0] out
);
  nand f0 [15:0] (out, in, in);
endmodule

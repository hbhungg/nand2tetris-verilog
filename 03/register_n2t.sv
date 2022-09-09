`ifndef bit_n2t
    `include "bit_n2t.sv"
`endif
`define register_n2t 1

module register_n2t(
    input  [15:0] in,
    input         load,
    input         clk,
    output [15:0] out
);
  // Basically just 16 1-bit reg
  bit_n2t f0 [15:0] (in, load, clk, out);
endmodule

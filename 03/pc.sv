`ifndef inc_16
    `include "../02/inc_16.sv"
`endif
`ifndef mux_16
    `include "../01/mux_16.sv"
`endif
`ifndef or_n2t
    `include "../01/or_n2t.sv"
`endif
`ifndef register_n2t
    `include "register_n2t.sv"
`endif
`define pc 1

module pc(
    input  [15:0] in,
    input         load,
    input         inc,
    input         reset,
    input         clk,
    output [15:0] out
);
  wire [15:0] pout, addinc, out1, out2, out3;
  inc_16 f0 (pout, addinc);
  mux_16 f1 (pout, addinc, inc, out1);
  mux_16 f2 (out1, in, load, out2);
  mux_16 f3 (out2, 16'b0000000000000000, reset, out3);

  or_n2t f4 (reset, load, or1);
  or_n2t f5 (or1, inc, or2);

  register_n2t f6 (out3, or2, clk, out);
  // Piped the output back
  assign pout = out;
endmodule

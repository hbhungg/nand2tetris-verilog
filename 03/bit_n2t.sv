`ifndef mux
    `include "../01/mux.sv"
`endif
`ifndef dff
    `include "dff.sv"
`endif
`define bit_n2t 1

module bit_n2t(
  input  in,
  input  load,
  input  clk,
  output out
);
  mux m (out, in, load, out1);
  dff df (out1, clk, out);
endmodule

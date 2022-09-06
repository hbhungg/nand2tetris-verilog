`ifndef mux_16
  `include "mux_16.sv"
`endif
`define mux_4_way_16 1

module mux_4_way_16(
    input  [15:0] a,
    input  [15:0] b,
    input  [15:0] c,
    input  [15:0] d,
    input  [1:0]  select,
    output [15:0] out
);
  wire [15:0] out1, out2;
  mux_16 f0 (a, b, select[0], out1);
  mux_16 f1 (c, d, select[0], out2);
  mux_16 f2 (out1, out2, select[1], out);
endmodule

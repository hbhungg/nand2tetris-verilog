`ifndef dmux_4_way
  `include "dmux_4_way.sv"
`endif
`define dmux_8_way 1

module dmux_8_way(
    input       in,
    input [2:0] select,
    output      a,
    output      b,
    output      c,
    output      d,
    output      e,
    output      f,
    output      g,
    output      h
);
  wire out1, out2;
  dmux f0 (in, select[2], out1, out2);
  dmux_4_way f1 (out1, select[1:0], a, b, c, d);
  dmux_4_way f2 (out2, select[1:0], e, f, g, h);
endmodule

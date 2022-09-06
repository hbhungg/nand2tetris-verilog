`ifndef dmux
  `include "dmux.sv"
`endif
`define dmux_4_way 1

module dmux_4_way(
    input       in,
    input [1:0] select,
    output      a,
    output      b,
    output      c,
    output      d
);
  wire out1, out2;
  dmux f0 (in, select[1], out1, out2);
  dmux f1 (out1, select[0], a, b);
  dmux f2 (out2, select[0], c, d);
endmodule

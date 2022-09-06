`ifndef or_n2t
  `include "or_n2t.sv"
`endif
`define or_8_way 1

module or_8_way(
    input [7:0] in,
    output      out
);
  wire a, b, c, d, e, f;
  or_n2t f0 (in[0], in[1], a);
  or_n2t f1 (a, in[2], b);
  or_n2t f2 (b, in[3], c);
  or_n2t f3 (c, in[4], d);
  or_n2t f4 (d, in[5], e);
  or_n2t f5 (e, in[6], f);
  or_n2t f6 (f, in[7], out);
endmodule

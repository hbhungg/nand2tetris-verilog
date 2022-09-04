`ifndef and_n2t
  `include "and_n2t.sv"
`endif
`define mux 1

module mux(
    input  a,
    input  b,
    input  select,
    output out
);
  wire a_s;
  wire b_s;
  wire n_s; // Not s
  not(n_s, s);
  and_n2t f0 (a,  n_s, a_n);
  and_n2t f1 (b,  s,   b_n);
  or_n2t  f3 (a_s, b_s,out);
endmodule

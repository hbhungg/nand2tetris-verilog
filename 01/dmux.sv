`ifndef and_n2t
  `include "and_n2t.sv"
`endif
`define dmux 1

module dmux(
    input  in,
    input  select,
    output a,
    output b
);
  wire not_s; // Not select
  not(not_s, select);
  and_n2t f1 (in, not_s, a);
  and_n2t f0 (in, select, b);
endmodule

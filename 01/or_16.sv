`ifndef or_n2t
  `include "or_n2t.sv"
`endif
`define or_16 1

module or_16(
    input[15:0] a,
    input[15:0] b,
    output[15:0] out
);
  or_n2t f0 [15:0] (a, b, out);
endmodule

`ifndef half_adder
  `include "half_adder.sv"
`endif
`define full_adder 1

module full_adder(
    input  a,
    input  b,
    input  c,
    output carry,
    output sum
);
  wire c1, s1, c2;
  // a + b
  half_adder f0 (a, b, c1, s1);
  // a + b + c
  half_adder f1 (s1, c, c2, sum);
  or_n2t f2 (c1, c2, carry);
endmodule

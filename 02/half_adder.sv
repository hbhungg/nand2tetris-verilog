`ifndef xor_n2t
  `include "../01/xor_n2t.sv"
`endif
`define half_adder 1

module half_adder(
    input  a,
    input  b,
    output carry,
    output sum
);
  xor_n2t f0 (a, b, sum);
  and_n2t f1 (a, b, carry);
endmodule

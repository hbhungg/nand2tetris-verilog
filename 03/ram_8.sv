`ifndef and_n2t
    `include "../01/and_n2t.sv"
`endif
`ifndef dmux_8_way
    `include "../01/dmux_8_way.sv"
`endif
`ifndef mux_8_way_16
    `include "../01/mux_8_way_16.sv"
`endif
`ifndef register_n2t
    `include "register_n2t.sv"
`endif
`define ram_8 1

module ram_8(
    input  [15:0] in,
    input  [2:0]  address,
    input         load,
    input         clock,
    output [15:0] out
);

  wire a0, a1, a2, a3, a4, a5, a6, a7;
  wire [15:0] out0, out1, out2, out3, out4, out5, out6, out7;

  // Choose which register to operate
  dmux_8_way choose (load, address, a0, a1, a2, a3, a4, a5, a6, a7);

  // Register operation, pair the clock signal with the choose wire
  register_n2t r0 (in, a0, clock, out0);
  register_n2t r1 (in, a1, clock, out1);
  register_n2t r2 (in, a2, clock, out2);
  register_n2t r3 (in, a3, clock, out3);
  register_n2t r4 (in, a4, clock, out4);
  register_n2t r5 (in, a5, clock, out5);
  register_n2t r6 (in, a6, clock, out6);
  register_n2t r7 (in, a7, clock, out7);

  // Output base on which address we just choose.
  mux_8_way_16 o1 (out0, out1, out2, out3, out4, out5, out6, out7, address, out);
endmodule

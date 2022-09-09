`ifndef ram_4K
    `include "ram_4K.sv"
`endif
`ifndef dmux_4_way
    `include "../01/dmux_4_way.sv"
`endif
`ifndef mux_4_way_16
    `include "../01/mux_4_way_16.sv"
`endif
`define ram_16K 1

module ram_16K(
    input  [15:0] in,
    input  [13:0] address,
    input         load,
    input         clock,
    output [15:0] out
);

  wire a0, a1, a2, a3;
  wire [15:0] out0, out1, out2, out3;

  // The first 2 bits will choose which 4k registers we want to use.
  dmux_4_way choose (load, address[13:12], a0, a1, a2, a3);

  // Use the last 12 bits
  ram_4K r0 (in, address[11:0], a0, clock, out0);
  ram_4K r1 (in, address[11:0], a1, clock, out1);
  ram_4K r2 (in, address[11:0], a2, clock, out2);
  ram_4K r3 (in, address[11:0], a3, clock, out3);

  // Output base on which first 2 bits of address
  mux_4_way_16 o1 (out0, out1, out2, out3, address[13:12], out);

endmodule

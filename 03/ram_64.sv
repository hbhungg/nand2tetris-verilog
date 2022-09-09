`ifndef ram_8
    `include "ram_8.sv"
`endif
`define ram_64 1

module ram_64(
    input  [15:0] in,
    input  [5:0]  address,
    input         load,
    input         clock,
    output [15:0] out
);

  wire a0, a1, a2, a3, a4, a5, a6, a7;
  wire [15:0] out0, out1, out2, out3, out4, out5, out6, out7;

  // The first 3 bits will choose which 8 registers (ram_8) we want to use.
  dmux_8_way choose (load, address[5:3], a0, a1, a2, a3, a4, a5, a6, a7);

  // Ram 8 operation, use the last 3 bits for each ram_8
  ram_8 r0 (in, address[2:0], a0, clock, out0);
  ram_8 r1 (in, address[2:0], a1, clock, out1);
  ram_8 r2 (in, address[2:0], a2, clock, out2);
  ram_8 r3 (in, address[2:0], a3, clock, out3);
  ram_8 r4 (in, address[2:0], a4, clock, out4);
  ram_8 r5 (in, address[2:0], a5, clock, out5);
  ram_8 r6 (in, address[2:0], a6, clock, out6);
  ram_8 r7 (in, address[2:0], a7, clock, out7);

  // Output base on which first 3 bits of address
  mux_8_way_16 o1 (out0, out1, out2, out3, out4, out5, out6, out7, address[5:3], out);
endmodule

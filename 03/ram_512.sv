`ifndef ram_64
    `include "ram_64.sv"
`endif
`define ram_512 1

module ram_512(
    input  [15:0] in,
    input  [8:0]  address,
    input         load,
    input         clock,
    output [15:0] out
);

  wire a0, a1, a2, a3, a4, a5, a6, a7;
  wire [15:0] out0, out1, out2, out3, out4, out5, out6, out7;

  // The first 3 bits will choose which 16 registers (ram_16) we want to use.
  dmux_8_way choose (load, address[8:6], a0, a1, a2, a3, a4, a5, a6, a7);

  // Ram 8 operation, use the last 6 bits for each ram_8
  ram_64 r0 (in, address[5:0], a0, clock, out0);
  ram_64 r1 (in, address[5:0], a1, clock, out1);
  ram_64 r2 (in, address[5:0], a2, clock, out2);
  ram_64 r3 (in, address[5:0], a3, clock, out3);
  ram_64 r4 (in, address[5:0], a4, clock, out4);
  ram_64 r5 (in, address[5:0], a5, clock, out5);
  ram_64 r6 (in, address[5:0], a6, clock, out6);
  ram_64 r7 (in, address[5:0], a7, clock, out7);

  // Output base on which first 3 bits of address
  mux_8_way_16 o1 (out0, out1, out2, out3, out4, out5, out6, out7, address[8:6], out);
endmodule

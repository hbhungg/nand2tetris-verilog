`ifndef ram_512_optimized
    `include "ram_512_optimized.sv"
`endif
`ifndef mux_8_way_16
    `include "../01/mux_8_way_16.sv"
`endif
`ifndef dmux_8_way
    `include "../01/dmux_8_way.sv"
`endif
`define ram_4K

module ram_4K(
    input  [15:0] in,
    input  [11:0]  address,
    input         load,
    input         clock,
    output [15:0] out
);

  wire a0, a1, a2, a3, a4, a5, a6, a7;
  wire [15:0] out0, out1, out2, out3, out4, out5, out6, out7;

  // The first 3 bits will choose which 512 registers we want to use.
  dmux_8_way choose (load, address[11:9], a0, a1, a2, a3, a4, a5, a6, a7);

  // Use the last 9 bits
  ram_512_optimized r0 (in, address[8:0], a0, clock, out0);
  ram_512_optimized r1 (in, address[8:0], a1, clock, out1);
  ram_512_optimized r2 (in, address[8:0], a2, clock, out2);
  ram_512_optimized r3 (in, address[8:0], a3, clock, out3);
  ram_512_optimized r4 (in, address[8:0], a4, clock, out4);
  ram_512_optimized r5 (in, address[8:0], a5, clock, out5);
  ram_512_optimized r6 (in, address[8:0], a6, clock, out6);
  ram_512_optimized r7 (in, address[8:0], a7, clock, out7);

  // Output base on which first 3 bits of address
  mux_8_way_16 o1 (out0, out1, out2, out3, out4, out5, out6, out7, address[11:9], out);
    
endmodule

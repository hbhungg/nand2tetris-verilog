`ifndef or_8_way
  `include "../01/or_8_way.sv"
`endif
`ifndef mux_16
  `include "../01/mux_16.sv"
`endif
`ifndef add_16
  `include "add_16.sv"
`endif
`ifndef and_16
  `include "../01/and_16.sv"
`endif
`ifndef not_16
  `include "../01/not_16.sv"
`endif
`define alu 1

module alu(
  // Input bits
  input  [15:0] x,
  input  [15:0] y,
  // Control bits
  input         zx, // Zero the x input
  input         nx, // Negate the x input
  input         zy, // Zero the y input
  input         ny, // Negate the y input
  input         f,  // if f==1: Add(x, y) else: And(x,y)
  input         no, // Negate the out output
  // Output bits
  output [15:0] out,
  output        zr, // True if out = 0
  output        ng  // True if out < 0
);
  wire [15:0] x1, y1, x2, y2, sum1, and1, f1;
  // Zero
  mux_16 z0 (x, 16'b0000000000000000, zx, x1);
  mux_16 z1 (y, 16'b0000000000000000, zy, y1);
  // Negate
  mux_16 n0 (x1, ~x1, nx, x2);
  mux_16 n1 (y1, ~y1, ny, y2);
  // Add or And
  add_16 a0 (x2, y2, sum1);
  and_16 a1 (x2, y2, and1);
  mux_16 a3 (and1, sum1, f, f1);
  // Negate output
  mux_16 a4 (f1, ~f1, no, out);
  // zr and ng
  or_8_way or1 (out[15:8], zr1); 
  or_8_way or2 (out[7:0], zr2); 
  and_n2t or3 (~zr1, ~zr2, zr);
  or_n2t or4 (out[15], 1'b0, ng);
endmodule

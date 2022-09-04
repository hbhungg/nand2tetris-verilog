`ifndef or_n2t
  `include "or_n2t.sv"
`endif
`define and_n2t 1

module and_n2t(input a, input b, output out);
  wire Yd;
  nand(Yd, a, b);
  not(out, Yd);
endmodule 

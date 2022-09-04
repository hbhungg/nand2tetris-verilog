`define not_n2t 1

module not_n2t(input in, output out);
  wire out;
  nand(out, in, in);
endmodule

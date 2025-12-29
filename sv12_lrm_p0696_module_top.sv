////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        696
// Description: defparam statement override
// Note:        
//
////////////////////////////////////////////////////////////////

module top;
  logic clk;
  logic [0:4] in1;
  logic [0:9] in2;
  wire [0:4] o1; 
  wire [0:9] o2;
  vdff m1 (o1, in1, clk);
  vdff m2 (o2, in2, clk);
endmodule

module vdff (out, in, clk);
  parameter size = 1, delay = 1;
  input [0:size-1] in;
  input clk;
  output [0:size-1] out;
  logic [0:size-1] out;
  always @(posedge clk)
    # delay out = in;
endmodule

module annotate;  // The modules top and annotate would both be considered top-level modules.
  defparam
    top.m1.size = 5,
    top.m1.delay = 10,
    top.m2.size = 10,
    top.m2.delay = 20;
endmodule

module sv12_lrm_p0696_module_top;
  top top();
endmodule : sv12_lrm_p0696_module_top

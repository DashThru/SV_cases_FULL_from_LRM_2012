////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        698
// Description: parameter value assignment by name
// Note:        
//
////////////////////////////////////////////////////////////////

module tb2;
  wire [9:0] out_a, out_d; 
  wire [4:0] out_b, out_c; 
  logic [9:0] in_a, in_d; 
  logic [4:0] in_b, in_c; 
  logic clk;
  vdff #(.size(10),.delay(15)) mod_a (.out(out_a),.in(in_a),.clk(clk));
  vdff                         mod_b (.out(out_b),.in(in_b),.clk(clk));
  vdff #(.delay(12))           mod_c (.out(out_c),.in(in_c),.clk(clk));
  vdff #(.delay( ),.size(10) ) mod_d (.out(out_d),.in(in_d),.clk(clk));
endmodule

module vdff (out, in, clk);
  parameter size=5, delay=1; 
  output [size-1:0] out; 
  input [size-1:0] in; 
  input clk; 
  logic [size-1:0] out;
  always @(posedge clk)
    #delay out = in;
endmodule

module tb3;
  vdff #(10, 15)     mod_a (.out(out_a), .in(in_a), .clk(clk));
  vdff               mod_b (.out(out_b), .in(in_b), .clk(clk));
  vdff #(.delay(12)) mod_c (.out(out_c), .in(in_c), .clk(clk));
endmodule

module sv12_lrm_p0698_module_my_mem_addr;
  tb2 tb2();
  tb3 tb3();
endmodule : sv12_lrm_p0698_module_my_mem_addr

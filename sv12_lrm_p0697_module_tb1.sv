////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        697
// Description: parameter value assignment by ordered list
// Note:        
//
////////////////////////////////////////////////////////////////

module tb1;
  wire [9:0] out_a, out_d; 
  wire [4:0] out_b, out_c; 
  logic [9:0] in_a, in_d; 
  logic [4:0] in_b, in_c; 
  logic clk;
  vdff #(10,15) mod_a (.out(out_a), .in(in_a), .clk(clk));
  vdff          mod_b (.out(out_b), .in(in_b), .clk(clk));
  vdff #( 5,12) mod_c (.out(out_c), .in(in_c), .clk(clk));
  vdff #(10)    mod_d (.out(out_d), .in(in_d), .clk(clk));
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

module my_mem (addr, data);
  parameter addr_width = 16;
  localparam mem_size = 1 << addr_width; 
  parameter data_width = 8;
  input [addr_width-1:0] addr;
  input [data_width-1:0] data;
endmodule

module top; 
  logic [11:0] addr;
  logic [15:0] data;
  my_mem #(12, 16) m(addr,data);
endmodule


module sv12_lrm_p0697_module_tb1;
  tb1 tb1();
  top top();
endmodule : sv12_lrm_p0697_module_tb1

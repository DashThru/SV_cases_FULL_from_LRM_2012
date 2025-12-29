////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        765
// Description: primitive instance connection list
// Note:        
//
////////////////////////////////////////////////////////////////

module DFF (q, d, clk);
  input d,clk;
  output q;
endmodule

module dffn (q, d, clk); 
  parameter bits = 1; 
  input [bits-1:0] d; 
  output [bits-1:0] q; 
  input clk ;
  DFF dff[bits-1:0] (q, d, clk); // create a row of D flip-flops
endmodule

module MxN_pipeline (in, out, clk);
  parameter M = 3, N = 4; // M=width,N=depth input [M-1:0] in;
  output [M-1:0] out;
  input [M-1:0] in;
  input clk;
  wire [M*(N-1):1] t;
  // #(M) redefines the bits parameter for dffn
  // create p[1:N] columns of dffn rows (pipeline)
  dffn #(M) p[1:N] ({out, t}, {t, in}, clk);
endmodule

module sv12_lrm_p0765_module_busdriver_busin;
  MxN_pipeline MxN_pipeline();
endmodule : sv12_lrm_p0765_module_busdriver_busin

////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        713
// Description: example without using interfaces
// Note:        
//
////////////////////////////////////////////////////////////////

module memMod( input logic req,
                     logic clk,
                     logic start, 
					 logic [1:0] mode, 
					 logic [7:0] addr, 
               inout wire [7:0] data, 
			   output bit gnt,
                      bit rdy );
  logic avail;
endmodule

module cpuMod(
  input logic clk,
        logic gnt,
        logic rdy,
  inout wire [7:0] data,
  output logic req,
         logic start,
         logic [7:0] addr, 
		 logic [1:0] mode );
endmodule

module sv12_lrm_p0713_module_memmod_input;
  logic req, gnt, start, rdy; 
  logic clk = 0;
  logic [1:0] mode;
  logic [7:0] addr;
  wire [7:0] data;
  memMod mem(req, clk, start, mode, addr, data, gnt, rdy);
  cpuMod cpu(clk, gnt, rdy, data, req, start, addr, mode);

endmodule  : sv12_lrm_p0713_module_memmod_input


////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        715
// Description: interface example using a generic bundle
// Note:        
//
////////////////////////////////////////////////////////////////

interface simple_bus; // Define the interface logic req, gnt;
  logic [7:0] addr, data;
  logic [1:0] mode;
  logic start, rdy; 
endinterface: simple_bus

module memMod (interface a, input logic clk);
endmodule

module cpuMod(interface b, input logic clk);
endmodule

module top; 
  logic clk = 0;
  simple_bus sb_intf(); // Instantiate the interface
  // Reference the sb_intf instance of the simple_bus
  // interface from the generic interfaces of the
  // memMod and cpuMod modules
  memMod mem (.a(sb_intf), .clk(clk));
  cpuMod cpu (.b(sb_intf), .clk(clk));
endmodule

module memMod1 (interface a, input logic clk); 
endmodule

module cpuMod1 (interface b, input logic clk); 
endmodule 

module top1;
  logic clk = 0;
  simple_bus sb_intf();
  memMod1 mem (.*, .a(sb_intf)); // partial implicit port connections
  cpuMod1 cpu (.*, .b(sb_intf)); // partial implicit port connections
endmodule


module sv12_lrm_p0715_module_memmod_simple_bus;
  top top();
  top1 top1();
endmodule : sv12_lrm_p0715_module_memmod_simple_bus

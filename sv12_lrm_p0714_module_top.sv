////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        714
// Description: interface example using a named bundle
// Note:        
//
////////////////////////////////////////////////////////////////

interface simple_bus; // Define the interface
  logic req, gnt;
  logic [7:0] addr, data;
  logic [1:0] mode;
  logic start, rdy; 
endinterface: simple_bus

module memMod(simple_bus a, // Access the simple_bus interface 
              input logic clk);
  logic avail;
  // When memMod is instantiated in module top, a.req is the req 
  // signal in the sb_intf instance of the 'simple_bus' interface 
  always @(posedge clk) a.gnt <= a.req & avail;
endmodule

module cpuMod(simple_bus b, input logic clk); 
endmodule 

module top;
  logic clk = 0;
  simple_bus sb_intf(); // Instantiate the interface
  memMod mem(sb_intf, clk); // Connect the interface to the module instance
  cpuMod cpu(.b(sb_intf), .clk(clk)); // Either by position or by name
endmodule

module memMod1 (simple_bus sb_intf, input logic clk); 
endmodule

module cpuMod1 (simple_bus sb_intf, input logic clk); 
endmodule 

module top1;
  logic clk = 0;
  simple_bus sb_intf();
  memMod1 mem (.*); // implicit port connections 
  cpuMod1 cpu (.*); // implicit port connections
endmodule

module sv12_lrm_p0714_module_top;
  top top();
  top1 top1();
endmodule : sv12_lrm_p0714_module_top



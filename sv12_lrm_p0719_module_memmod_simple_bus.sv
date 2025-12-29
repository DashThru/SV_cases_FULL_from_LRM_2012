////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        719
// Description: example of connecting port bundle
// Note:        
//
////////////////////////////////////////////////////////////////

interface simple_bus (input logic clk); // Define the interface 
  logic req, gnt;
  logic [7:0] addr, data;
  logic [1:0] mode;
  logic start, rdy;
  modport slave (input req, addr, mode, start, clk, 
                 output gnt, rdy,
                 ref data);
  modport master(input gnt, rdy, clk,
                 output req, addr, mode, start,
                 ref data); 
endinterface: simple_bus

module memMod(simple_bus a); // Uses just the interface name 
  logic avail;
  always @(posedge a.clk) // the clk signal from the interface
    a.gnt <= a.req & avail; // the gnt and req signal in the interface
endmodule

module cpuMod(simple_bus b); 
endmodule 

module top;
  logic clk = 0;
  simple_bus sb_intf(clk); // Instantiate the interface 
  initial repeat(10) #10 clk++;
  memMod mem(sb_intf.slave); // Connect the modport to the module instance
  cpuMod cpu(sb_intf.master);
endmodule


module sv12_lrm_p0719_module_memmod_simple_bus;
  top top();
endmodule : sv12_lrm_p0719_module_memmod_simple_bus

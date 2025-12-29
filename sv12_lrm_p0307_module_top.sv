////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        307
// Description: interfaces and clocking blocks
// Note:        
//
////////////////////////////////////////////////////////////////

module cpu(bus_A a);
  logic state;
endmodule

module mem(bus_B b);
  logic state;
endmodule

interface bus_A (input clk);
  logic [15:0] data;
  logic write;
  modport test (input data, output write, input clk);
  modport dut (output data, input write, input clk);
endinterface

interface bus_B (input clk);
  logic [8:1] cmd;
  logic enable;
  modport test (input enable, input clk, output cmd);
  modport dut (output enable, input clk, input cmd);
endinterface

program test( bus_A.test a, bus_B.test b );
  clocking cd1 @(posedge a.clk);
  input data = a.data;
  output write = a.write;
  inout state = sv12_lrm_p0307_module_top.cpu1.state;
  endclocking
  clocking cd2 @(posedge b.clk);
    input #2 output #4ps cmd = b.cmd;
	input en = b.enable;
  endclocking
  initial begin
    // program begins here
    // user can access cd1.data, cd1.write, cd1.state,
    // cd2.cmd, and cd2.en
  end
endprogram

module sv12_lrm_p0307_module_top;
  logic phi1, phi2;
  bus_A a (phi1);
  bus_B b (phi2);
  test main (a, b);
  cpu cpu1 (a);
  mem mem1 (b);
endmodule



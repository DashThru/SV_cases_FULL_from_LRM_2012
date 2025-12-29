////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        682
// Description: port connections with interconnect net types
// Note:        
//
////////////////////////////////////////////////////////////////

module netlist;
  interconnect iwire;
  dut1 child1(iwire);
  dut2 child2(iwire);
endmodule

module dut1(inout wire w);
  assign w = 1;
endmodule

module dut2(inout wand w);
  assign w = 0;
endmodule

module sv12_lrm_p0682_module_netlist;
  netlist netlist();
endmodule : sv12_lrm_p0682_module_netlist

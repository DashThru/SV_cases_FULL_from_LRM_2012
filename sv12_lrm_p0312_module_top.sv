////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        312
// Description: global clocking
// Note:        
//
////////////////////////////////////////////////////////////////

module top;
  logic clk1, clk2;
  global clocking sys @(clk1 or clk2); endclocking
endmodule

module subsystem1;
  logic subclk1;
  global clocking sub_sys1 @(subclk1); endclocking
  common_sub common();
endmodule

module subsystem2;
  logic subclk2;
  global clocking sub_sys2 @(subclk2); endclocking
  common_sub common();
endmodule

module common_sub;
  always @($global_clock) begin
  end
endmodule

module sv12_lrm_p0312_module_top;
  subsystem1 sub1();
  subsystem2 sub2();
endmodule : sv12_lrm_p0312_module_top

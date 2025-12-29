////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        342
// Description: assertion clock
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0342_global_clocking_clk;

  logic clk,rst,in1,in2,a;

  global clocking @clk; 
  endclocking

  default clocking cb @(posedge clk); endclocking

  assert property(@$global_clock a);

  // logically equivalent to:
  assert property(@clk a);

  function cont_prop(logic rst,in1,in2);
  endfunction

  base_rule1: assert property (cont_prop(rst,in1,in2)) $display("%m, passing");
               else $display("%m, failed");

endmodule : sv12_lrm_p0342_global_clocking_clk

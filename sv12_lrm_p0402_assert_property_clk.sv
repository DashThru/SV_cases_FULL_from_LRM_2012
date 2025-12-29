////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        402
// Description: assert abort property
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0402_assert_property_clk;

  logic clk,go,get,stop,put;

  assert property (@(clk) go ##1 get[*2] |-> reject_on(stop) put[->2]);
  
  assert property (@(clk) go ##1 get[*2] |-> sync_reject_on(stop) put[->2]);
  
  assert property (@(clk) go ##1 get[*2] |-> !stop throughout put[->2]);

endmodule : sv12_lrm_p0402_assert_property_clk

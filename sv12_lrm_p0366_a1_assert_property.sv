////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        366
// Description: global clocking sampled value functions
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0366_a1_assert_property;

  logic sig,clk,clock; 

  global clocking gclk @(clock); endclocking 

  a1: assert property (@$global_clock $changing_gclk(sig)
                                    |-> $falling_gclk(clk))
      else $error("sig is not stable");

endmodule : sv12_lrm_p0366_a1_assert_property

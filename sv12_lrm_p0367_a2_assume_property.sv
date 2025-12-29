////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        367
// Description: global clocking sampled value functions
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0367_a2_assume_property;

  logic sig,clk,clock,rst; 

  global clocking gc @(clock); endclocking 
  default clocking c @(posedge clock); 
    input sig;
  endclocking

  a2: assume property(@$global_clock
              $falling_gclk(clk) ##1 (!$falling_gclk(clk)[*1:$]) |->
                                                    $steady_gclk(sig));

  a3: assert property (@$global_clock disable iff (rst) $changing_gclk(sig)
                                      |-> $falling_gclk(clk))
      else $error("sig is not stable");

  // A ##1 is needed in a4 due to the corner case at cycle 0
  a4: assert property (##1 $stable_gclk(sig));

  // In a5, there is no issue at cycle 0
  a5: assert property ($steady_gclk(sig));

endmodule : sv12_lrm_p0367_a2_assume_property

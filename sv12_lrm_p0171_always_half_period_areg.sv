////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        171
// Description: always begin end procedures
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0171_always_half_period_areg;

  logic areg,a,b,c,d;
  int half_period = 100;

  always areg = ~areg;
  
  always #half_period areg = ~areg;
  
  always_comb
    a = b & c;
  
  always_comb
    d <= #1ns b & c;

  initial $finish;
endmodule : sv12_lrm_p0171_always_half_period_areg

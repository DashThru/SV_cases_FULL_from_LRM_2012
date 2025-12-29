////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        389
// Description: sequence property declaration
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0389_property_p3;

  logic clk,a,b,c;

  property p3;
    b ##1 c;
  endproperty

  c1: cover property (@(posedge clk) a #-# p3);
  a1: assert property (@(posedge clk) a |-> p3);  
  a2: assert property (@clk not a ##1 b);
  a3: assert property (@clk not strong(a ##1 b));

endmodule : sv12_lrm_p0389_property_p3

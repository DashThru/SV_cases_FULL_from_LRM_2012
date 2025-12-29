////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        426
// Description: property restrict statement
// Note:        
//
////////////////////////////////////////////////////////////////

  
module top(input logic clk);
  logic a,b,c;
  property rule3;
    @(posedge clk) a |-> b ##1 c;
  endproperty
  a1: assert property (rule3);
endmodule

module tp(input logic clk);
  logic a,b,c;
  sequence seq3;
    @(posedge clk) b ##1 c;
  endsequence
  c1: cover property (seq3);
endmodule

module sv12_lrm_p0426_restrict_property_posedge;
  
  logic clk,ctr;

  restrict property (@(posedge clk) ctr == '0);

  top u_top(clk);
  tp u_tp(clk);

endmodule : sv12_lrm_p0426_restrict_property_posedge

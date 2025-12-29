////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        411
// Description: multiclocked sequences
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0411_posedge_clk0_sig0;
  logic clk0,clk1,sig0,sig1;

  property p1;
    @(posedge clk0) sig0 ##1 @(posedge clk1) sig1;
  endproperty
  
  property p2;
    @(posedge clk0) sig0 ##1 sig1;
  endproperty
  
  property p3;
    @(posedge clk0) sig0 ##0 @(posedge clk1) sig1;
  endproperty
  
  property p4;
    @(posedge clk0) sig0 ##0 sig1;
  endproperty

endmodule : sv12_lrm_p0411_posedge_clk0_sig0

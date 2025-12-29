////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        412
// Description: multiclocked sequences and properties
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0412_posedge_clk0_sig0;
  logic clk0,clk1,clk2,sig0,sig1,s1,s2;

  property p1;
  @(posedge clk0) sig0 && sig1;
  endproperty
  
  property p2;
  @(posedge clk1) s1 ##1 @(posedge clk2) s2;
  endproperty
  
  property p3;
  @(posedge clk0) sig0 ##1 @(posedge clk1) sig1[*0:1];
  endproperty
  
  property p4;
  @(posedge clk1) s1 ##2 @(posedge clk2) s2;
  endproperty

  property p5;
  @(posedge clk1) s1 intersect @(posedge clk2) s2;
  endproperty
  
  property p6;
  @(posedge clk0) sig0 ##1 @(posedge clk1) sig1;
  endproperty
  
  property p7;
  (@(posedge clk0) sig0) and (@(posedge clk1) sig1);
  endproperty

endmodule : sv12_lrm_p0412_posedge_clk0_sig0

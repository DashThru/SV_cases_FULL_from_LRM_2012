////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        413
// Description: multiclocked sequences and properties
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0413_posedge_clk0_sig0;

  logic clk0,clk1,clk2,sig0,sig1,s0,s1,s2,a,b;

  property p1;
  @(posedge clk0) sig0;
  endproperty
  
  property p2;
  @(posedge clk1) sig1;
  endproperty
  
  property p3;
  @(posedge clk0) s0 |=> @(posedge clk1) s1;
  endproperty
  
  property p4;
  @(posedge clk0) s0 |=> (@(posedge clk1) s1) and (@(posedge clk2) s2);
  endproperty
  
  property p5;
  @(posedge clk0) s0 |-> @(posedge clk1) s1;
  endproperty
  
  property p6;
  @(posedge clk0) if (b) @(posedge clk1) s1 else @(posedge clk2) s2;
  endproperty

endmodule : sv12_lrm_p0413_posedge_clk0_sig0

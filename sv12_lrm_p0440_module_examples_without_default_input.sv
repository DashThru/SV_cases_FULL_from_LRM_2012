////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        440
// Description: clock resolution
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0440_module_examples_without_default_input;

  logic clk,a,b;

  sequence s2; @(posedge clk) a ##2 b; endsequence
  property p2; not s2; endproperty
  assert property (p2);
  
  property p3; @(posedge clk) not (a ##2 b); endproperty
  assert property (p3);
  
  always @(posedge clk) assert property (not (a ##2 b));

  clocking master_clk @(posedge clk);
    property p3; not (a ##2 b); endproperty
  endclocking
  assert property (master_clk.p3);
  
  default clocking master_clk ; // master clock as defined above
  property p4; (a ##2 b); endproperty
  assert property (p4);


endmodule : sv12_lrm_p0440_module_examples_without_default_input

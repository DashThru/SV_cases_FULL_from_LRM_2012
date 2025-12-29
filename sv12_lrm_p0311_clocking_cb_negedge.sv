////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        311
// Description: clocking input sampling
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0311_clocking_cb_negedge;

  logic clk,v;
  clocking cb @(negedge clk);
    input v;
  endclocking
  
  always @(cb) $display(cb.v);
  
  always @(negedge clk) $display(cb.v);

endmodule : sv12_lrm_p0311_clocking_cb_negedge

////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        319
// Description: same variable from multiple clocking
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0319_reg_j;

  reg j,clk;

  clocking pe @(posedge clk);
    output j;
  endclocking
  
  clocking ne @(negedge clk);
    output j;
  endclocking

  clocking e @(edge clk);
    output j;
  endclocking

endmodule : sv12_lrm_p0319_reg_j

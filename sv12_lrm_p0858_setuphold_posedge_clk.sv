////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        858
// Description: mapping of SDF timing check constructs
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0858_setuphold_posedge_clk(input clk,data,mode);

  logic ntfr;
  specify
    $setuphold (posedge clk &&& mode, data, 1, 1, ntfr); 
    $setuphold (negedge clk &&& !mode, data, 1, 1, ntfr); 
    $setuphold (edge clk, data, 1, 1, ntfr);
    
    $setuphold (posedge clk &&& mode, data, 1, 1, ntfr);   // Annotated
    $setuphold (negedge clk &&& !mode, data, 1, 1, ntfr);  // Not annotated
    $setuphold (edge clk, data, 1, 1, ntfr);               // Not annotated

    $setuphold (posedge clk &&& mode, data, 1, 1, ntfr);   // Not annotated
    $setuphold (negedge clk &&& !mode, data, 1, 1, ntfr);  // Not annotated
    $setuphold (edge clk, data, 1, 1, ntfr);               // Not annotated 
  endspecify


endmodule : sv12_lrm_p0858_setuphold_posedge_clk

////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        835
// Description: recrem posedge clear
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0835_recrem_posedge_clear(input clk,clear);

  specify
    specparam tREC=1,tREM=2;
    $recrem( posedge clear, posedge clk, tREC, tREM );
    // is equivalent in functionality to the following, if tREC and tREM are not negative:
    $removal( posedge clear, posedge clk, tREM ); 
    $recovery( posedge clear, posedge clk, tREC );
  endspecify

endmodule : sv12_lrm_p0835_recrem_posedge_clear

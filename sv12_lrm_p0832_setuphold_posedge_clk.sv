////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        832
// Description: setuphold posedge clock check
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0832_setuphold_posedge_clk(input clk,data);

  specify
    specparam tSU=1,tHLD=2;
    $setuphold( posedge clk, data, tSU, tHLD );
    // is equivalent in functionality to the following, if tSU and tHLD are not negative:
    $setup( data, posedge clk, tSU ); 
    $hold( posedge clk, data, tHLD );
  endspecify

endmodule : sv12_lrm_p0832_setuphold_posedge_clk

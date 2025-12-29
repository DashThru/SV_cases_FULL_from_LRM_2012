////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        843
// Description: width timing clock check
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0843_width_posedge_clk(input clk,data);

  logic notif,ntfr_reg;
  
  specify
    specparam lim=10,thresh=2;
    $width (posedge clk, 6, 0, ntfr_reg);
    // Legal Calls
    $width ( negedge clr, lim );
    $width ( negedge clr, lim, thresh, notif ); 
    $width ( negedge clr, lim, 0, notif );

    $nochange( posedge clk, data, 0, 0) ;
  endspecify

endmodule : sv12_lrm_p0843_width_posedge_clk

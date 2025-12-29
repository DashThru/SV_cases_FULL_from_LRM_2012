////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        846
// Description: edge-control specifiers
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0846_posedge_clr(input clk,data,clr);

  logic notif,notifier;

  specify
    specparam lim=10,thresh=2;

    $width (edge[01, 0x, x1] clr, lim );
    $width (edge[10, x0, 1x] clr, lim, thresh, notif ); 

    $setup( data, posedge clk, 10, notifier ) ;
    $width( posedge clk, 16, 0, notifier ) ;
  endspecify

endmodule : sv12_lrm_p0846_posedge_clr

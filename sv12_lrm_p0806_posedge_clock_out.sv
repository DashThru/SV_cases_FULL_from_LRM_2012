////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        806
// Description: specify edge-sensitive paths
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0806_posedge_clock_out(input clock,in, input [2:0] clk, output out);

  specify
    specparam tRise_clk_q = 150, tFall_clk_q = 200; 
    specparam tSetup = 70;

    ( posedge clock => ( out +: in ) ) = (10, 8);
  
    ( negedge clk[0] => ( out -: in ) ) = (10, 8);
  
    ( clock => ( out : in ) ) = (10, 8);

  endspecify

endmodule : sv12_lrm_p0806_posedge_clock_out

////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        531
// Description: wildcard specification of coverage point bins
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0531_wildcard_bins_g12_15;

  int v;
  bit clk;
  
  covergroup sg @(posedge clk);
    coverpoint v
    {
       wildcard bins g12_15 = { 4'b11?? };
       
       wildcard bins g12_15_array[] = { 4'b11?? };
       
       wildcard bins T0_3 = (2'b0x => 2'b1x);
       
       wildcard bins T0_3_array[] = (2'b0x => 2'b1x);
    }
  endgroup


endmodule : sv12_lrm_p0531_wildcard_bins_g12_15

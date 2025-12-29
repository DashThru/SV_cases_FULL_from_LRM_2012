////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        551
// Description: coverpoint coverage computation
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0551_bit_a_b;

  bit [2:0] a, b;
  covergroup ct;
    coverpoint b {
      option.auto_bin_max = 4;
  	  ignore_bins ig = { [0:1], [5:6] };
    }
  endgroup

endmodule : sv12_lrm_p0551_bit_a_b

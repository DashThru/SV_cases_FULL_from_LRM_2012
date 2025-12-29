////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        652
// Description: line and current input file
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0652_line_orig_v;

  `line 3 "orig.v" 2
  // This line is line 3 of orig.v after exiting include file

  initial $display("Internal error: null handle at %s, line %d.",`__FILE__, `__LINE__);

endmodule : sv12_lrm_p0652_line_orig_v

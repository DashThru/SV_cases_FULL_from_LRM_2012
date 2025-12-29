////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        67
// Description: tri1 scalared bus64
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0067_tri1_scalared_bus64;

  tri1 scalared [63:0] bus64;  //a bus that will be expanded
  tri vectored [31:0] data;    //a bus that may or may not be expanded

endmodule : sv12_lrm_p0067_tri1_scalared_bus64

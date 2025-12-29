////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        745
// Description: package search order rules
// Note:        
//
////////////////////////////////////////////////////////////////

package p;
  typedef enum { FALSE, TRUE } BOOL; 
  const BOOL c = FALSE;
endpackage

package q;
  const int c = 0;
endpackage

module m; 
  import q::*;
  wire a = c;   // This statement forces the import of q::c;
endmodule

module sv12_lrm_p0745_package_q;
  m um();
endmodule : sv12_lrm_p0745_package_q

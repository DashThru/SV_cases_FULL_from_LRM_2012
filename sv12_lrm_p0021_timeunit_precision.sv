////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        21
// Description: timeunit and timeprecision examples
// Note:        
//
////////////////////////////////////////////////////////////////

module D ();
  timeunit 100ps;
  timeprecision 10fs;
endmodule

module E ();
  timeunit 100ps / 10fs; // timeunit with optional second argument
endmodule

module sv12_lrm_p0021_timeunit_precision;
  timeunit 100ns / 10ps; // timeunit with optional second argument
  D d_inst();
  E e_inst();
endmodule : sv12_lrm_p0021_timeunit_precision


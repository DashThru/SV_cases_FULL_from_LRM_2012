////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        40
// Description: time literal and multi-line display examples
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0040_time_units_display;

  // dummy variables for literal evaluation
  time _t1, _t2;

  initial begin
    _t1 = 2.1ns;
    _t2 = 40ps;

    $display("Humpty Dumpty sat on a wall. \
  Humpty Dumpty had a great fall.");

    $display("Humpty Dumpty sat on a wall.\n\
  Humpty Dumpty had a great fall.");
  end

endmodule : sv12_lrm_p0040_time_units_display


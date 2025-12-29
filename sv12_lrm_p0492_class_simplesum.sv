////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        492
// Description: rand randomization methods
// Note:        
//
////////////////////////////////////////////////////////////////

class SimpleSum;
  rand bit [7:0] x, y, z;
  constraint c {z == x + y;}
endclass

module sv12_lrm_p0492_class_simplesum;

  SimpleSum p = new;
  int success = p.randomize();
  initial if (success == 1 ) $display("PASS");

endmodule : sv12_lrm_p0492_class_simplesum

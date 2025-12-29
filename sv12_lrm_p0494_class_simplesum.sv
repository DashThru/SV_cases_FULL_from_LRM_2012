////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        494
// Description: in-line constraints randomize() with
// Note:        
//
////////////////////////////////////////////////////////////////

class SimpleSum;
  rand bit [7:0] x, y, z;
  constraint c {z == x + y;}
endclass

task InlineConstraintDemo(SimpleSum p);
  int success;
  success = p.randomize() with {x < y;};
endtask

module sv12_lrm_p0494_class_simplesum;
  SimpleSum p =new;
  initial InlineConstraintDemo(p);
endmodule : sv12_lrm_p0494_class_simplesum

////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        478
// Description: rand implication
// Note:        
//
////////////////////////////////////////////////////////////////

class C;
  rand logic mode,little,big;
  rand int len;

  constraint c1 {mode == little -> len < 10;}
  constraint c2 {mode == big -> len > 100;}

  bit [3:0] a, b;
  constraint c { (a == 0) -> (b == 1); }

endclass


module sv12_lrm_p0478_mode_little_len;
  C c=new;
endmodule : sv12_lrm_p0478_mode_little_len

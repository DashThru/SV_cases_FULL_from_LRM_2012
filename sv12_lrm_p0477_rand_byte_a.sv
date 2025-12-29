////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        477
// Description: rand uniqueness constraints
// Note:        
//
////////////////////////////////////////////////////////////////

class C;

  rand byte a[5];
  rand byte b;
  rand byte excluded;
  constraint u { unique {b, a[2:3], excluded}; }
  constraint exclusion { excluded == 5; }

endclass

module sv12_lrm_p0477_rand_byte_a;
  C c=new;
endmodule : sv12_lrm_p0477_rand_byte_a

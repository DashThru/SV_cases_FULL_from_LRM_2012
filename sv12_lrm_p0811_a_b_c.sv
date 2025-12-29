////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        811
// Description: multiple module paths in a single statement
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0811_a_b_c(input a,b,c, output q1,q2);

  specify
    (a, b, c *> q1, q2) = 10;
    // is equivalent to the following six individual module path assignments:
    (a *> q1) = 10 ;
    (b *> q1) = 10 ;
    (c *> q1) = 10 ;
    (a *> q2) = 10 ;
    (b *> q2) = 10 ;
    (c *> q2) = 10 ;
  endspecify

endmodule : sv12_lrm_p0811_a_b_c

////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        343
// Description: boolean expressions
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0343_bit_a;

  bit a;
  integer b;
  byte q[$];
  
  property p1;
    $rose(a) |-> q[0];
  endproperty
  
  property p2;
    integer l_b;
    ($rose(a), l_b = b) |-> ##[3:10] q[l_b];
  endproperty

endmodule : sv12_lrm_p0343_bit_a

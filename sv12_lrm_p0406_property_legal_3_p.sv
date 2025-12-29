////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        406
// Description: recursive properties
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0406_property_legal_3_p;

  logic a,b;

  property prop_always(p);
    p and (1'b1 |=> prop_always(p));
  endproperty  

  property legal_3(p);
    disable iff (b) prop_always(p);
  endproperty
  
  property fibonacci1 (local input int a, b, n, int fib_sig);
    (n > 0)
    |->
	(
      (fib_sig == a)
      and
      (1'b1 |=> fibonacci1(b, a + b, n - 1, fib_sig))
    );
  endproperty

endmodule : sv12_lrm_p0406_property_legal_3_p

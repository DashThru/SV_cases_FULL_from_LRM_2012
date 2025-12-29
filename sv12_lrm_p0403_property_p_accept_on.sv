////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        403
// Description: property p accept on
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0403_property_p_accept_on;

  logic p1,p2,a,b;
  
  property pp1; (accept_on(a) p1) and (reject_on(b) p2); endproperty
  
  property pp2; (accept_on(a) p1) or (reject_on(b) p2); endproperty
  
  property pp3; not (accept_on(a) p1); endproperty

  property pp4; accept_on(a) reject_on(b) p1; endproperty

endmodule : sv12_lrm_p0403_property_p_accept_on

////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        405
// Description: recursive properties
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0405_property_prop_weak_until_p;

  logic s1,s2,phase1_prop,phase2_prop;

  property prop_weak_until(p,q);
    q or (p and (1'b1 |=> prop_weak_until(p,q)));
  endproperty
  
  property p2(s,p,q);
    s |=> prop_weak_until(p,q);
  endproperty

  property check_phase1;
    s1 |-> (phase1_prop and (1'b1 |=> check_phase2));
  endproperty
  property check_phase2;
    s2 |-> (phase2_prop and (1'b1 |=> check_phase1));
  endproperty

endmodule : sv12_lrm_p0405_property_prop_weak_until_p

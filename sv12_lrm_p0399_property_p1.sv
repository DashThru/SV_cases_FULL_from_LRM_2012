////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        399
// Description: until property
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0399_property_p1;

  logic a,b;

  property p1;
    a until b;
  endproperty
  
  property p2;
    a s_until b;
  endproperty
  
  property p3;
    a until_with b;
  endproperty

  property p4;
    a s_until_with b;
  endproperty

endmodule : sv12_lrm_p0399_property_p1

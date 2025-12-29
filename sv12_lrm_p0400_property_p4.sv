////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        400
// Description: eventually property
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0400_property_p4;

  logic a,b;

  property p1;
    s_eventually a;
  endproperty
  
  property p2;
    s_eventually always a;
  endproperty
  
  property p3;
    always s_eventually a;
  endproperty

  property p4;
    eventually [2:5] a;
  endproperty
  
  property p5;
    s_eventually [2:5] a;
  endproperty
  
  property p7;
    s_eventually [2:$] a;
  endproperty


endmodule : sv12_lrm_p0400_property_p4

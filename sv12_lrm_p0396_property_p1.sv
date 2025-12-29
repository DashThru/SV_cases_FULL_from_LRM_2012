////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        396
// Description: nexttime property
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0396_property_p1;

  logic a;

  property p1;
    nexttime a;
  endproperty
  
  property p2;
    s_nexttime a;
  endproperty

  property p3;
    nexttime always a;
  endproperty
  
  property p4;
    s_nexttime always a;
  endproperty
  
  property p5;
    nexttime s_eventually a;
  endproperty
  
  property p6;
    s_nexttime s_eventually a;
  endproperty
  
  property p7;
    nexttime[2] a;
  endproperty
  
  property p8;
    s_nexttime[2] a;
  endproperty

endmodule : sv12_lrm_p0396_property_p1

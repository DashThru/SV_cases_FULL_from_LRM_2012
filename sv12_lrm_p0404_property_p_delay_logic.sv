////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        404
// Description: case property
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0404_property_p_delay_logic;

  logic a,b;

  property p_delay(logic [1:0] delay);
    case (delay)
      2'd0 : a && b;
      2'd1 : a ##2 b;
      2'd2 : a ##4 b;
      2'd3 : a ##8 b;
      default: 0;  // cause a failure if delay has x or z values
   endcase
  endproperty

  property prop_always(p);
    p and (1'b1 |=> prop_always(p));
  endproperty
  
  property p1(s,p);
    s |=> prop_always(p);
  endproperty

endmodule : sv12_lrm_p0404_property_p_delay_logic

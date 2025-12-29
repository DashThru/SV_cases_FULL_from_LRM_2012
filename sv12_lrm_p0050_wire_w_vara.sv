////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        50
// Description: wire assignment
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0050_wire_w_vara;

  logic vara,varb,consta,constb;

  wire w = vara & varb;  // net with a continuous assignment
  
  logic v = consta & constb;  // variable with initialization
  
  logic vw;  // no initial assignment
  assign vw = vara & varb;  // continuous assignment to a variable
  
  real circ,PI,R;
  assign circ = 2.0 * PI * R;  // continuous assignment to a variable

endmodule : sv12_lrm_p0050_wire_w_vara

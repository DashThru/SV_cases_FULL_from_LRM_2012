////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        205
// Description: variable declaration assignment (variable initialization)
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0205_wire_w_vara;

  logic vara,varb,consta,constb;

  wire w = vara & varb;      // net with a continuous assignment
  logic v = consta & constb; // variable with initialization

endmodule : sv12_lrm_p0205_wire_w_vara

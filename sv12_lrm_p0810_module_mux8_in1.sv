////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        810
// Description: full connection and parallel connection paths
// Note:        
//
////////////////////////////////////////////////////////////////

module mux8 (in1, in2, s, q) ; 
  output [7:0] q;
  input [7:0] in1, in2;
  input s;
  // Functional description omitted ... 
  specify
    (in1 => q) = (3, 4) ;
    (in2 => q) = (2, 3) ;
    (s *> q) = 1;
  endspecify
endmodule

module sv12_lrm_p0810_module_mux8_in1;
  logic [7:0] in1, in2, q;
  logic s;
  mux8 mux8(.*);
endmodule : sv12_lrm_p0810_module_mux8_in1

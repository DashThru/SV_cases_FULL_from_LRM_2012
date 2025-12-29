////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        88
// Description: type parameters
// Note:        
//
////////////////////////////////////////////////////////////////

module ma #( parameter p1 = 1, parameter type p2 = shortint )
           (input logic [p1:0] i, output logic [p1:0] o);
  p2 j = 0; // type of j is set by a parameter, (shortint unless redefined)
  always @(i) begin
    o = i;
    j++;
  end
endmodule

module mb;
  logic [3:0] i,o;
  ma #(.p1(3), .p2(int)) u1(i,o); //redefines p2 to a type of int
endmodule

module sv12_lrm_p0088_module_ma_parameter;
   ma u_ma();
   mb u_mb();
endmodule : sv12_lrm_p0088_module_ma_parameter

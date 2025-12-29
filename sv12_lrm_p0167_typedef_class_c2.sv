////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        167
// Description: typedef class before declaration
// Note:        
//
////////////////////////////////////////////////////////////////

typedef class C2;  // C2 is declared to be of type class
class C1;
  C2 c;
endclass
class C2;
  C1 c;
endclass

typedef class C ;
module top ;
  C#(1, real) v2 ;          // positional parameter override
  C#(.p(2), .T(real)) v3 ;  // named parameter override
endmodule

class C #(parameter p = 2, type T = int);
endclass

module sv12_lrm_p0167_typedef_class_c2;
  C2 c2 = new;
  C c = new;
endmodule : sv12_lrm_p0167_typedef_class_c2

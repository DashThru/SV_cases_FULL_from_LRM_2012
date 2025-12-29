////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        474
// Description: external constraint blocks
// Note:        
//
////////////////////////////////////////////////////////////////

class C;
  rand int x;
  constraint proto1;        // implicit form
  extern constraint proto2; // explicit form
endclass

constraint C::proto1 { x inside {-4, 5, 7}; }
constraint C::proto2 { x >= 0; }

virtual class D;
  pure constraint Test;
endclass

module sv12_lrm_p0474_class_c;
  C c=new;
endmodule : sv12_lrm_p0474_class_c

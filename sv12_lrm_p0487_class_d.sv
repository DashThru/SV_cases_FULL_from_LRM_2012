////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        487
// Description: rand class example
// Note:        
//
////////////////////////////////////////////////////////////////

class D;
  int x;
endclass

class C;
  rand int x, y;
  D a, b;
  constraint c1 { (x < y || a.x > b.x || a.x == 5 ) -> x+y == 10; }
endclass

module sv12_lrm_p0487_class_d;
  D d=new;
  C c=new;
endmodule : sv12_lrm_p0487_class_d

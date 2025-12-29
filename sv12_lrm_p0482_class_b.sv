////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        482
// Description: rand variable ordering
// Note:        
//
////////////////////////////////////////////////////////////////

class B;
  rand bit s;
  rand bit [31:0] d;
  constraint c { s -> d == 0; }
endclass

class C;
  rand bit s;
  rand bit [31:0] d;
  rand int x,y;
  constraint c { s -> d == 0; }
  constraint order { solve s before d; }
  constraint cx { 
    x == 0;
    x < y;
    solve y before x;}
endclass

module sv12_lrm_p0482_class_b;
  B b=new;
  C c=new;
endmodule : sv12_lrm_p0482_class_b

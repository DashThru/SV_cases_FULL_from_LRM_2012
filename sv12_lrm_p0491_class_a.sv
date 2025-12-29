////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        491
// Description: rand discarding soft constraints
// Note:        
//
////////////////////////////////////////////////////////////////

class A;
  rand int x;
  constraint A1 { soft x == 3; }
  constraint A2 { disable soft x; } // discard soft constraints
  constraint A3 { soft x inside { 1, 2 }; }
endclass

class B;
  rand int x;
  constraint B1 { soft x == 5; }
  constraint B3 { soft x dist {5, 8}; }
endclass

class C;
 rand int x;
 constraint B1 { soft x == 5; }
 constraint B2 { disable soft x; soft x dist {5, 8};}
endclass 

module sv12_lrm_p0491_class_a;

  initial begin
    A a = new();
    a.randomize();
  end

  initial begin
    B b = new();
    b.randomize();
  end

  initial begin
    C c = new();
    c.randomize();
  end


endmodule : sv12_lrm_p0491_class_a

////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        495
// Description: rand in-line constraints
// Note:        
//
////////////////////////////////////////////////////////////////

class C1;
  rand integer x;
endclass

class C2;
  integer x;
  integer y;
  task doit(C1 f, integer x, integer z);
    int result;
    result = f.randomize() with {x < y + z;};
  endtask
endclass

class C;
  rand integer x;
endclass

function int F(C obj, integer y);
  F = obj.randomize() with (x) { x < y; };
endfunction

module sv12_lrm_p0495_class_c2;

  class C;
    rand integer x;
  endclass
  
  function int F(C obj, integer x);
    F = obj.randomize() with { x < local::x; };
  endfunction

endmodule : sv12_lrm_p0495_class_c2

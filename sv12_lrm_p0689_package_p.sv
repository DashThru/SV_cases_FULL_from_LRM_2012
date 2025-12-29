////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        689
// Description: member selects and hierarchical names
// Note:        
//
////////////////////////////////////////////////////////////////

package p;
  struct { int x; } s1;
  struct { int x; } s2;
  function void f();
    int x;
  endfunction
endpackage

class F;
 int x;
endclass 

module m;
  F f2=new();
  import p::*;
  if (1) begin : s1
    initial begin
      s1.x = 1;  // dotted name 1
      s2.x = 1;  // dotted name 2
      f.x = 1;   // dotted name 3
      f2.x = 1;  // dotted name 4
    end
    int x;
    some_module s2();
  end
endmodule

module some_module();
endmodule

module sv12_lrm_p0689_package_p;
  m um();
endmodule : sv12_lrm_p0689_package_p

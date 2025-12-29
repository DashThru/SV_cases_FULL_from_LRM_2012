////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        742
// Description: package referencing examples
// Note:        
//
////////////////////////////////////////////////////////////////

package p1; 
  int x;
endpackage 

module top1;
  import p1::*;
  if (1) begin : b 
    initial x =1;  // causes the potentially locally visible x from wildcard import p::* ( p::x ) to become locally visible in scope top, and line 2 initializes p::x
	int x;
    initial x =1;  // initializes top.b.x.
  end
endmodule

package p; 
  int x;
endpackage

package p2; 
  int x;
endpackage

module top2;
  import p::*;
  if (1) begin : b
    initial x = 1;  // causes the import of p::x in scope top because the wildcard import p::* is in the outer scope top and precedes the occurrence of x. The declaration x from package p becomes locally visible in scope top.
	import p2::*;
  end
endmodule

package p3;
  function int f();
    return 1; 
  endfunction
endpackage

module top3; 
  int x;
  if (1) begin : b
    initial x = f(); // binds to top.f and not to p::f since the import is after the function call reference.
	import p3::*; 
  end
  function int f(); 
    return 1;
  endfunction
endmodule

module sv12_lrm_p0742_package_p;
  top1 top1();
  top2 top2();
  top3 top3();
endmodule : sv12_lrm_p0742_package_p

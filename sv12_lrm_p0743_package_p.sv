////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        743
// Description: package referencing examples
// Note:        
//
////////////////////////////////////////////////////////////////

package p;
  function int f();
    return 1; 
  endfunction
endpackage

package p2; 
  function int f();
    return 1; 
  endfunction
endpackage

module top;
  import p::*; 
  int x;
  if (1) begin : b
    initial x = f(); // binds to p::f
  end
  import p2::*; 
endmodule

module sv12_lrm_p0743_package_p;
  top top();
endmodule : sv12_lrm_p0743_package_p

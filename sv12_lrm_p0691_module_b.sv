////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        691
// Description: task and function name resolution
// Note:        
//
////////////////////////////////////////////////////////////////

task t;
  int x;
  x = f(1); // valid reference to function f in $unit scope
endtask

function int f(int y);
  return y+1;
endfunction

package p;
  function void f();
    $display("p::f");
  endfunction
endpackage

module top;
  import p::*;
  if (1) begin : b  // generate block
    initial f();    // reference to "f"
	function void f();
	  $display("top.b.f");
    endfunction
  end
endmodule

module sv12_lrm_p0691_module_b;
  top top();
endmodule : sv12_lrm_p0691_module_b

////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        336
// Description: deferred assertion flush points
// Note:        
//
////////////////////////////////////////////////////////////////

class rpt;
  function success(int i); endfunction
  function error(int i, logic a,b); endfunction

endclass

module sv12_lrm_p0336_always_a_or;

  logic a,b,c,d;
  rpt rptobj = new();

  always @(a or b) begin : b1
    a3: assert #0 (a == b) rptobj.success(0); else rptobj.error(0, a, b);
	#1;
    a4: assert #0 (a == b) rptobj.success(1); else rptobj.error(1, a, b);
  end


  assign a = 1;
  assign b = 0;

  always_comb begin : b2
    c1: cover (b != a);
    c2: cover #0 (b != a);
  end

  function f(bit v);
    p: assert #0 (v);
  endfunction
  
  always_comb begin: myblk
    d = b || f(c);
  end

endmodule : sv12_lrm_p0336_always_a_or

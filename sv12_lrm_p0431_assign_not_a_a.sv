////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        431
// Description: procedural assertion flush points
// Note:        Typo fix in line 34, 36
//
////////////////////////////////////////////////////////////////

class R;

  function success(int i);   endfunction
  function error(int a,b,c);   endfunction

endclass

module sv12_lrm_p0431_assign_not_a_a;

  logic clk,not_a,a,b;
  logic [15:0] foo,bar;
  R r = new();

  assign not_a = !a;
  default clocking @(posedge clk); endclocking

  always_comb begin : b1
    // Probably better to not use consts in this example
    // ...but using them to illustrate effects of flushing method
	a1: assert property (const'(not_a) != const'(a));
  end


  always @(a or b) begin : b2
    a2: assert property (a == b) r.success(0); else r.error(0, a, b);
	#1;
    a3: assert property (a == b) r.success(1); else r.error(1, a, b);
  end
 
endmodule : sv12_lrm_p0431_assign_not_a_a

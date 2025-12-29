////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        339
// Description: deferred assertions and multiple processes
// Note:        
//
////////////////////////////////////////////////////////////////

module fsm();

  int x,y,z,w;
  bit some_stuff,other_stuff;

  function bit f (int a, int b);
    a1: assert #0 (a == b);
  endfunction
  always_comb begin : b1
    some_stuff = f(x,y);
  end
  always_comb begin : b2
    other_stuff = f(z,w);
  end

endmodule

module sv12_lrm_p0339_always_bad_val_or;

  logic bad_val,bad_val_ok,a,b,c,clear_b2;

  always @(bad_val or bad_val_ok) begin : b1
    a1: assert #0 (bad_val) else $fatal(1, "Sorry");
    if (bad_val_ok) begin
      disable a1;
    end
  end

  always @(a or b or c) begin : b2
    if (c == 8'hff) begin
      a2: assert #0 (a && b);
	end else begin
      a3: assert #0 (a || b);
	end
  end

  always @(clear_b2) begin : b3
    disable b2;
  end

  fsm u_fsm();

endmodule : sv12_lrm_p0339_always_bad_val_or

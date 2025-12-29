////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        263
// Description: sampled value functions in let
// Note:        
//
////////////////////////////////////////////////////////////////

module m(input clock);
  logic a;
  let p1(x) = $past(x);
  let p2(x) = $past(x,,,@(posedge clock));
  let s(x) = $sampled(x);
  always_comb begin
    //a1: assert(p1(a));
	a2: assert(p2(a));
	a3: assert(s(a));
  end
  a4: assert property(@(posedge clock) p1(a));
endmodule : m

// The effective code after expanding let expressions:
module n(input clock);
  logic a;
  // let p1(x) = $past(x);
  // let p2(x) = $past(x,,,@(posedge clock)); // let s(x) = $sampled(x);
  always_comb begin
	a2: assert(($past(a,,,@(posedge clock))));
    a3: assert(($sampled (a)));
  end
  a4: assert property(@(posedge clock)($past(a)));  // @(posedge clock)
                                                    // is inferred
endmodule : n

module sv12_lrm_p0263_module_m_input;
  m um();
  n un();
endmodule : sv12_lrm_p0263_module_m_input

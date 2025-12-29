////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        260
// Description: let with arguments and without arguments
// Note:        
//
////////////////////////////////////////////////////////////////

module m;
  logic clk, a, b;
  logic p, q, r;
  // let with formal arguments and default value on y
  let eq(x, y = b) = x == y;
  // without parameters, binds to a, b above let
  let tmp = a && b;
  a1: assert property (@(posedge clk) eq(p,q));
  always_comb begin
    a2: assert (eq(r)); // use default for y
    a3: assert (tmp);
  end
endmodule : m

// The effective code after expanding let expressions:
module n;
  bit clk, a, b;
  logic p, q, r;
  // let eq(x, y = b) = x == y;
  // let tmp = a && b;
  a1: assert property (@(posedge clk) (n.p == n.q));
  always_comb begin
    a2: assert ((n.r == n.b)); // use default for y
    a3: assert ((n.a && n.b));
  end
endmodule : n

module sv12_lrm_p0260_module_m;
  m um();
  n un();
endmodule : sv12_lrm_p0260_module_m

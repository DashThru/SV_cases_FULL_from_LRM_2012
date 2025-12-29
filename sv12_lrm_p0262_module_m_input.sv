////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        262
// Description: let declared in a generate block
// Note:        
//
////////////////////////////////////////////////////////////////

module m(input clock);
  logic [15:0] a, b;
  logic c, d;
  typedef bit [15:0] bits;
  let ones_match(bits x, y) = x == y;
  let same(logic x, y) = x === y;
  always_comb
    a1: assert(ones_match(a, b));
  property toggles(bit x, y);
    same(x, y) |=> !same(x, y);
  endproperty
  a2: assert property (@(posedge clock) toggles(c, d));
endmodule : m

module n(input clock);
  logic [15:0] a, b;
  logic c, d;
  typedef bit [15:0] bits;
  // let ones_match(bits x, y) = x == y;
  // let same(logic x, y) = x === y;
  always_comb
    a1:assert((bits'(a) == bits'(b)));
  property toggles(bit x, y);
    (logic'(x) === logic'(y)) |=> ! (logic'(x) === logic'(y));
  endproperty
  a2: assert property (@(posedge clock) toggles(c, d));
endmodule : n

module sv12_lrm_p0262_module_m_input;
  m um();
  n un();
endmodule : sv12_lrm_p0262_module_m_input

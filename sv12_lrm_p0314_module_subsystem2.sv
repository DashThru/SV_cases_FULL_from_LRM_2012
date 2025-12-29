////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        314
// Description: usage of $global_clock in checker arguments
// Note:        
//
////////////////////////////////////////////////////////////////

module sub_top1;
  subsystem1 sub1();
  subsystem2 sub2();
  another_module another_module();
endmodule

module subsystem1;
  logic subclk1, req, ack;
  global clocking sub_sys1 @(subclk1); endclocking
  always another_module.t(req, ack);
endmodule

module subsystem2;
  logic subclk2, req, ack;
  global clocking sub_sys2 @(subclk2); endclocking
  always another_module.t(req, ack);
endmodule

module another_module;
  logic another_clk;
  global clocking another_clocking @(another_clk); endclocking
  task t(input req, input ack);
    @($global_clock);
  endtask
endmodule

module sub_top2;
  logic a, b, c, clk;
  global clocking top_clocking @(clk); endclocking
  property p1(req, ack);
    @($global_clock) req |=> ack;
  endproperty
  property p2(req, ack, interrupt);
    @($global_clock) accept_on(interrupt) p1(req, ack);
  endproperty
  my_checker check(
    p2(a, b, c),
    @$global_clock a[*1:$] ##1 b);
endmodule

checker my_checker(property p, sequence s);
  logic checker_clk;
  global clocking checker_clocking @(checker_clk); endclocking
  assert property (p);
  cover property (s);
endchecker

module sv12_lrm_p0314_module_subsystem2;
  sub_top1 u_sub_top1();
  sub_top2 u_sub_top2();
endmodule : sv12_lrm_p0314_module_subsystem2

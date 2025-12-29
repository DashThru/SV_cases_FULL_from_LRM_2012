////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        434
// Description: inferred value functions
// Note:        
//
////////////////////////////////////////////////////////////////

module m(input logic a, b, c, d, rst1, clk1, clk2);
  logic rst;
  default clocking @(negedge clk1); endclocking
  default disable iff rst1;
  property p_triggers(start_event, end_event, form, clk = $inferred_clock,
                       rst = $inferred_disable);
    @clk disable iff (rst)
      (start_event ##0 end_event[->1]) |=> form;
  endproperty
  property p_multiclock(clkw, clkx = $inferred_clock, clky, w, x, y, z);
    @clkw w ##1 @clkx x |=> @clky y ##1 z;
  endproperty
  a1: assert property (p_triggers(a, b, c));
  a2: assert property (p_triggers(a, b, c, posedge clk1, 1'b0) );
  always @(posedge clk2 or posedge rst) begin
    if (rst) $display("haha") ; 
    else begin
      a3: assert property (p_triggers(a, b, c));
    end
  end
  a4: assert property(p_multiclock(negedge clk2, , posedge clk1,
                    a, b, c, d) );
endmodule

module n(input logic a, b, c, d, rst1, clk1, clk2);
  logic rst;
  a1: assert property (@(negedge clk1) disable iff (rst1)
                          a ##0 b[->1] |=> c);
  a2: assert property (@(posedge clk1) disable iff (1'b0)
                          a ##0 b[->1] |=> c);
  always @(posedge clk2 or posedge rst) begin
    if (rst) $display("haha") ; 
    else begin
        $display("hehe");
    end
  end
  a3: assert property
    (
      @(posedge clk2) disable iff (rst1)
      (a ##0 b[->1]) |=> c
    );
  a4: assert property (@(negedge clk2) a ##1 @(negedge clk1) b |=>
        @(posedge clk1) c ##1 d);
endmodule


module sv12_lrm_p0434_module_m_logic;
  logic a, b, c, d, rst1, clk1, clk2;

  m um(.*);
  n un(.*);
 
endmodule : sv12_lrm_p0434_module_m_logic

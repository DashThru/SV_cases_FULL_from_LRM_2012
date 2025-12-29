////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        441
// Description: clock resolution examples with default
// Note:        
//
////////////////////////////////////////////////////////////////

module examples_with_default (input logic a, b, c, clk);
  property q1;
    $rose(a) |-> ##[1:5] b;
  endproperty
  property q2;
    @(posedge clk) q1;
  endproperty
  default clocking posedge_clk @(posedge clk);
    property q3;
      $fell(c) |=> q1;
      // legal: q1 has no clocking event
    endproperty
    property q4;
     $fell(c) |=> q2;
     // legal: q2 has clocking event identical to that of // the clocking block
    endproperty
  endclocking
  property q5;
    @(negedge clk) b[*3] |=> !b;
  endproperty
  always @(negedge clk)
  begin
    a1: assert property ($fell(c) |=> q1);
    // legal: contextually inferred leading clocking event,
	// @(negedge clk)
    a2: assert property (posedge_clk.q4);
    // legal: will be queued (pending) on negedge clk, then
	// (if matured) checked at next posedge clk (see 16.14.6)
    a4: assert property (q5);
    // legal: contextually inferred leading clocking event,
	// @(negedge clk)
  end
  property q6;
    q1 and q5;
  endproperty
  a6: assert property ($fell(c) |=> q6);
    // legal: default leading clocking event, @(posedge clk),
	// is the unique semantic leading clock
  sequence s2;
    $rose(a) ##[1:5] b;
  endsequence
  c1: cover property (s2);
    // legal: default leading clocking event, @(posedge clk)
  c2: cover property (@(negedge clk) s2);
    // legal: explicit leading clocking event, @(negedge clk)
endmodule

module sv12_lrm_p0441_clocking_master_clk_posedge;
  logic a, b, c, clk;

  examples_with_default examples_with_default(.*);
endmodule : sv12_lrm_p0441_clocking_master_clk_posedge

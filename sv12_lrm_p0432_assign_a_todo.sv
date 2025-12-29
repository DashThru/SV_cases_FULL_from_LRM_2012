////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        432
// Description: procedural concurrent assertions and glitches
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0432_assign_a_todo;

  logic a,b,clk,en,foo,bar;

  assign a = 1;
  assign b = 0;
  default clocking @(posedge clk); endclocking
  always_comb begin : b1
    c1: cover property (const'(b) != const'(a));
  end

  always_comb begin : procedural_block_1
    if (en)
      foo = bar;
  end
  
  always_comb begin : procedural_block_2
    p1: assert property ( @(posedge clk) (const'(foo) == const'(bar)) );
  end

endmodule : sv12_lrm_p0432_assign_a_todo

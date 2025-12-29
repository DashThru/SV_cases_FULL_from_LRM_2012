////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        456
// Description: clock inference for checker procedures
// Note:        
//
////////////////////////////////////////////////////////////////

checker clocking_example (logic sig1, sig2, default_clk, rst,
                          event e1, e2, e3 );
  bit local_sig1,local_sig2;
  default clocking @(posedge default_clk); endclocking
  always_ff @(e1) begin: p1_block
    p1a: assert property (sig1 == sig2);
    p1b: assert property (@(e1) (sig1 == sig2));
  end
  always_ff @(e2 or e3) begin: p2_block
    local_sig1 <= rst;
    p2a: assert property (sig1 == sig2);
    p2b: assert property (@(e2) (sig1 == sig2));
  end
  always_ff @(rst or e3) begin: p3_block
    local_sig2 <= rst;
    p3a: assert property (sig1 == sig2);
    p3b: assert property (@(e3) (sig1 == sig2));
  end
endchecker

module sv12_lrm_p0456_checker_clocking_example_logic;
  logic s1, s2, default_clk, rst, clk1, clk2;

  clocking_example c1 (s1, s2, default_clk, rst,
                       posedge clk1 or posedge clk2,
                       posedge clk1,
                       negedge rst);

endmodule : sv12_lrm_p0456_checker_clocking_example_logic

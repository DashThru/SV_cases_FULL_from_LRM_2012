////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        454
// Description: context inference
// Note:        
//
////////////////////////////////////////////////////////////////

checker check_in_context (logic test_sig,
                          event clock = $inferred_clock,
      			  logic reset = $inferred_disable);
  property p(logic sig);
    sig == 0;
  endproperty
  a1: assert property (@clock disable iff (reset) p(test_sig));
  c1: cover property (@clock !reset throughout !test_sig ##1 test_sig);
endchecker : check_in_context

module m(input logic rst);
  wire clk;
  logic a, en;
  wire b = a && en;
  // No context inference
  check_in_context my_check1(.test_sig(b), .clock(clk), .reset(rst));
  always @(posedge clk) begin
    a <= 1'b1;
    if (en) begin
             // inferred from context:
             // .clock(posedge clk)
             // .reset(1'b0)
             check_in_context my_check2(a);
    end
    en <= 1'b1;
  end
endmodule : m

module sv12_lrm_p0454_checker_check_in_context_logic;
  logic rst;

  m um(rst);
endmodule : sv12_lrm_p0454_checker_check_in_context_logic

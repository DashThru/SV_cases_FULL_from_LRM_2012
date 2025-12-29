////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        451
// Description: checker declaration
// Note:        
//
////////////////////////////////////////////////////////////////

module m;
  logic clk,clk1,clk2,rst1,rst2;

  default clocking @clk1; endclocking
  default disable iff rst1;
  checker c1;
    // Inherits @clk1 and rst1
  endchecker : c1
  checker c2;
    // Explicitly redefines its default values
	default clocking @clk2; endclocking
	default disable iff rst2;
  endchecker : c2
endmodule : m

module sv12_lrm_p0451_checker_my_check4_input;

  checker my_check4 (input logic in,
                     en = 1'b1,
					 event clock,
					 output int ctr = 0);
    default clocking @clock; endclocking
	always_ff @clock
      if (en && in) ctr <= ctr + 1;
	a1: assert property (ctr < 5);
  endchecker : my_check4

  m um();

endmodule : sv12_lrm_p0451_checker_my_check4_input

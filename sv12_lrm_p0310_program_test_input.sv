////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        310
// Description: default clocking
// Note:        
//
////////////////////////////////////////////////////////////////

program test(input logic clk, inout logic [15:0] data);
  default clocking bus @(posedge clk);
    inout data;
  endclocking

  initial begin
    ## 5;
    if (bus.data == 10)
      ## 1;
    else
      ;
  end
endprogram

module processor;
  logic clk1,clk2;

  clocking busA @(posedge clk1); endclocking
  clocking busB @(negedge clk2); endclocking
  module cpu( interface y );
    default clocking busA ;
    initial begin
      ## 5; // use busA => (posedge clk1)
    end
  endmodule
endmodule

module sv12_lrm_p0310_program_test_input;
  test u_test();
  processor u_processor();
endmodule : sv12_lrm_p0310_program_test_input

////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        452
// Description: checker instantiation
// Note:        
//
////////////////////////////////////////////////////////////////

checker mutex (input logic sig, input event clock, output bit failure);
  assert property (@clock $onehot0(sig))
    failure = 1'b0; else failure = 1'b1;
endchecker : mutex

module m(input wire [31:0] bus, input logic clk);
  logic res, scan;
  mutex check_bus(bus, posedge clk, res);
  always @(posedge clk) scan <= res;
endmodule : m

module sv12_lrm_p0452_checker_mutex_logic;

  wire [31:0] bus;
  logic clk;
  m um (.*);

endmodule : sv12_lrm_p0452_checker_mutex_logic

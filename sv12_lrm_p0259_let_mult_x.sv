////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        259
// Description: let construct syntax
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0259_let_mult_x;


  let mult(x, y) = ($bits(x) + $bits(y))'(x * y);
  
  let at_least_two(sig, rst = 1'b0) = rst || ($countones(sig) >= 2);
  logic [15:0] sig1;
  logic [3:0] sig2;
  always_comb begin
    q1: assert (at_least_two(sig1));
    q2: assert (at_least_two(~sig2));
  end

  logic [31:0] base,displ;
  task write_value;
    input logic [31:0] addr;
    input logic [31:0] value;
  endtask
  let addr = sv12_lrm_p0259_let_mult_x.base + sv12_lrm_p0259_let_mult_x.displ;
  initial write_value(addr, 0);

endmodule : sv12_lrm_p0259_let_mult_x

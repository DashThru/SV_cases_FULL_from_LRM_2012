////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        445
// Description: semantic leading clocks for property
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0445_wire_clk1_clk2;


  wire clk1, clk2;
  logic a, b;
  assign clk2 = clk1;
  a2: assert property (@(clk1) a and @(clk1) b); // OK
  always @(posedge clk1) begin
    a4: assert property (a and @(posedge clk1) b); // OK
  end

endmodule : sv12_lrm_p0445_wire_clk1_clk2

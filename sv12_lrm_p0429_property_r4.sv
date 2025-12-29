////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        429
// Description: arguments to procedural concurrent assertions
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0429_property_r4;
  
  logic clk;
  logic [15:0] foo,bar;

  // Assume for this example that (posedge clk) will not occur at time 0
  always @(posedge clk) begin
    for (int i=0; i<10; i++) begin
      a1: assert property (foo[i] && bar[i]);
      a2: assert property (foo[const'(i)] && bar[i]);
      a3: assert property (foo[const'(i)] && bar[const'(i)]);
    end
  end

  default clocking @(posedge clk); endclocking
  generate for (genvar i=0; i<10; i++) begin
    a1: assert property (foo[10] && bar[10]);
	a2: assert property (foo[i] && bar[10]);
	a3: assert property (foo[i] && bar[i]);
  end
  endgenerate

  always @(posedge clk) begin
    // variable declared in for statement is automatic (see 12.7.1)
	for (int i=0; i<10; i++) begin
      a4: assert property (foo[i] && bar[i]);
      a5: assert property (foo[const'(i)] && bar[i]);
      a6: assert property (foo[const'(i)] && bar[const'(i)]);
	end
  end

endmodule : sv12_lrm_p0429_property_r4

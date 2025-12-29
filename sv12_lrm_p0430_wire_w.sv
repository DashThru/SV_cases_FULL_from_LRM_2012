////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        430
// Description: arguments to procedural concurrent assertions
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0430_wire_w;

  wire w,clk;
  logic en,a,b,c,my_activation_condition;
  logic [15:0] foo,bar;

  property p1(a, b, c);
    disable iff (c) @(posedge clk) a |=> b;
  endproperty

  always @(posedge clk) begin : procedural_block_1
    if (my_activation_condition == 1) begin
	  for (int i=0; i<2; i++) begin
        a7: assume property (foo[i] |=> bar[i] ##1 (w==1'b1));
	  end
    end
  end

  // Assume for this example that (posedge clk) will not occur at time 0
  always @(posedge clk) begin
    for (int i=0; i<10; i++) begin
      a8: assert property (foo[const'(i)] && bar[i]) else
	    $error("a8 failed for const i=%d and i=%d",
                 const'(i), $sampled(i));
    end
  end
  
  // Assume a, b, c, and en are not automatic
  always @(posedge clk) begin
    en = 1;
    if (en) begin
      a9: assert property (p1(a,b,c));
    end
    if ($sampled(en)) begin
      a10: assert property (p1(a,b,c));
    end
  end

endmodule : sv12_lrm_p0430_wire_w

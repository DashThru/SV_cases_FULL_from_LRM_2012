////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        427
// Description: embedding concurrent assertions
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0427_property_rule;

  logic a,b,c,clk;

  property rule;
    a ##1 b ##1 c;
  endproperty

  always @(posedge clk) begin
    assert property (rule);
  end

endmodule : sv12_lrm_p0427_property_rule

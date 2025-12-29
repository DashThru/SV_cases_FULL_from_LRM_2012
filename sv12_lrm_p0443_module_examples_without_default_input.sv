////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        443
// Description: clock resolution examples without default
// Note:        
//
////////////////////////////////////////////////////////////////

module examples_without_default (input logic a, b, c, clk);
  property q1;
    $rose(a) |-> ##[1:5] b;
  endproperty
  property q5;
    @(negedge clk) b[*3] |=> !b;
  endproperty
  property q6;
    q1 and q5;
  endproperty
  sequence s2;
    $rose(a) ##[1:5] b;
  endsequence
  c2: cover property (@(negedge clk) s2);
    // legal: explicit leading clocking event, @(negedge clk)
  sequence s3;
    @(negedge clk) s2;
  endsequence
  c3: cover property (s3);
    // legal: leading clocking event, @(negedge clk),
	// determined from declaration of s3
endmodule

module sv12_lrm_p0443_module_examples_without_default_input;
  logic a, b, c, clk;

  examples_without_default examples_without_default(.*);

endmodule : sv12_lrm_p0443_module_examples_without_default_input

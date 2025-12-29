////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        571
// Description: elaboration system tasks
// Note:        
//
////////////////////////////////////////////////////////////////

module test #(N = 1) (input [N-1:0] in, output [N-1:0] out);
  if ((N < 1) || (N > 8)) // conditional generate construct
    $error("Parameter N has an invalid value of %0d", N);
  assign out = in;
endmodule

module sv12_lrm_p0571_module_test_n;

  logic clk,trig;
  logic [31:0] vect;

  generate
    if ($bits(vect) == 1) begin : err $error("Only a 1-bit vector"); end
	for (genvar i = 0; i < $bits(vect); i++) begin : Loop
      if (i==0) begin : Cond
        sequence t; vect[0]; endsequence
		$info("i=0 branch generated");
      end : Cond
      else begin : Cond
        sequence t; vect[i] ##1 Loop[i-1].Cond.t; endsequence
        $info("i = %0d branch generated", i); end : Cond
      end : Loop
  endgenerate

  // instantiate the last generated sequence in a property
  property p;
    @(posedge clk) trig |-> Loop[$bits(vect)-1].Cond.t;
  endproperty

  test u_test(in,out);

endmodule : sv12_lrm_p0571_module_test_n

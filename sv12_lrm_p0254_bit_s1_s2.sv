////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        254
// Description: string literal value padding and potential problems
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0254_bit_s1_s2;

  bit [8*10:1] s1, s2;
  initial begin
    s1 = "Hello";
    s2 = " world!";
    if ({s1,s2} == "Hello world!")  // should fail
      $display("strings are equal");
  end
  // s1 = 000000000048656c6c6f
  // s2 = 00000020776f726c6421

endmodule : sv12_lrm_p0254_bit_s1_s2

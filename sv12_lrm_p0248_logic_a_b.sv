////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        248
// Description: example of expression bit-length problem
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0248_logic_a_b;
  logic [15:0] a, b, answer;  // 16-bit variables
  initial begin
    answer = (a + b) >> 1;  // will not work properly
    answer = (a + b + 0) >> 1;  // will work correctly
  end
endmodule : sv12_lrm_p0248_logic_a_b

////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        565
// Description: array querying system functions
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0565_logic_n;


  //     Dimension numbers
  //      3    4       1    2
  logic [3:0][2:1] n [1:5][2:8];
  typedef logic [3:0][2:1] packed_reg;
  packed_reg n1[1:5][2:8]; // same dimensions as in the lines above
 
  initial $display($dimensions(n));
  initial $display($unpacked_dimensions(n));
  initial $display($left(n));
  initial $display($right(n));
  initial $display($low(n));
  initial $display($high(n));
  initial $display($increment(n));
  initial $display($size(n));

endmodule : sv12_lrm_p0565_logic_n

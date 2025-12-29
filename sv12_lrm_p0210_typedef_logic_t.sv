////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        210
// Description: assignment pattern syntax
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0210_typedef_logic_t;


  typedef logic [1:0] [3:0] T;
  logic [15:0] M;
  initial M = shortint'({T'{1,2}, T'{3,4}});  // yields 16'sh1234
  
  typedef byte U[3];
  var U A = '{1, 2, 3};
  var byte a, b, c;
  initial U'{a, b, c} = A;
  initial U'{c, a, b} = '{a+1, b+1, c+1};

endmodule : sv12_lrm_p0210_typedef_logic_t

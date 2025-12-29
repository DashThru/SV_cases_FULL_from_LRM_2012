////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        43
// Description: array literal examples
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0043_array_literals;

  int n1[1:2][1:3] = '{'{0,1,2},'{3{4}}};
  
  int n2[1:2][1:6] = '{2{'{3{4, 5}}}}; // same as '{'{4,5,4,5,4,5},'{4,5,4,5,4,5}}

  typedef int triple [1:3];
  initial $display(triple'{0,1,2});
  
  triple b = '{1:1, default:0}; // indices 2 and 3 assigned 0

endmodule : sv12_lrm_p0043_array_literals


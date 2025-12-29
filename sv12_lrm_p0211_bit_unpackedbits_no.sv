////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        211
// Description: array assignment patterns
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0211_bit_unpackedbits_no;


  bit unpackedbits [1:0] = '{1,1};  // no size warning required as
                                    // bit can be set to 1
  int unpackedints [1:0] = '{1'b1, 1'b1};  // no size warning required as
                                           // int can be set to 1'b1
  int y=10;
  initial unpackedbits = '{2 {y}} ;         // same as '{y, y}

  initial unpackedints = '{default:2};  // sets elements to 2

  int n[1:2][1:3] = '{2{'{3{y}}}};  // same as '{'{y,y,y},'{y,y,y}}
  
  struct {int a; time b;} abkey[1:0];
  initial abkey = '{'{a:1, b:2ns}, '{int:5, time:$time}};

endmodule : sv12_lrm_p0211_bit_unpackedbits_no

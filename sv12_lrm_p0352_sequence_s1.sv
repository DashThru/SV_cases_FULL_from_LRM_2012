////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        352
// Description: formal argument within a sequence_match_item
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0352_sequence_s1;

  logic sysclk,a,b,c;

  default clocking pe @(posedge sysclk);
  endclocking
  
  sequence s1(w, x, y);
    w ##1 x ##[2:10] y;
  endsequence
  sequence s2(w, y, bit x);
    w ##1 x ##[2:10] y;
  endsequence


  cover property (s1(.w(a), .x(bit'(b)), .y(c)));
  cover property (s2(.w(a), .x(b), .y(c)));
  

endmodule : sv12_lrm_p0352_sequence_s1

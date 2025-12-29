////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        816
// Description: specify delay selection
// Note:        Typo fix in line 18-22
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0816_a_y(input A,B, output Y);

  int MODE = 3;
  
  specify
    (A => Y) = (6, 9);
    (B => Y) = (5, 11);
    
    if (MODE & 5) (A => Y) = (5, 9); 
    if (MODE & 4) (A => Y) = (4, 8); 
    if (MODE & 3) (A => Y) = (6, 5); 
    if (MODE & 2) (A => Y) = (3, 2); 
    if (MODE & 1) (A => Y) = (7, 7);
  endspecify

endmodule : sv12_lrm_p0816_a_y

////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        81
// Description: enumerated types in numerical expressions
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0081_colors_c;

  typedef enum { red, green, blue, yellow, white, black } Colors;
  Colors c;
  
  initial begin
    c = green;
    if ( 1 == c ) ;  // OK. c is auto-cast to integer
  end
  
  Colors col;
  integer a, b;
  
  initial begin
    a = blue * 3;
    col = yellow;
    b = col + green;
  end

  typedef enum {Red, Green, Blue} Color3;
  typedef enum {Mo,Tu,We,Th,Fr,Sa,Su} Week;
  Color3 C;
  Week W;
  int I;
  
  initial begin
    C = Color3'(C+1);  // C is converted to an integer, then added to one, then converted back to a Colors type
    C = Color3'(Su);   // Legal; puts an out of range value into C
    I = C + W;         // Legal; C and W are automatically cast to int
  end

endmodule : sv12_lrm_p0081_colors_c

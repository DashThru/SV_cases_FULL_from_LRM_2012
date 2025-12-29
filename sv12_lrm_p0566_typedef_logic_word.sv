////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        566
// Description: queries over multiple variable dimensions
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0566_typedef_logic_word;

  typedef logic [16:1] Word;  //  $size(Word) -> 16
  Word Ram[0:9];              //  $size(Ram,2) -> 16

  int a[3][][5]; // array dimension 2 has variable size

  initial begin
    $display( $unpacked_dimensions(a) ); // displays 3
    a[2] = new[4];
    a[2][2][0] = 220;            // OK, a[2][2] is a 5-element array
    $display( $size(a, 1) );     // OK, displays 3
    $display( $size(a[2], 1) );  // OK, displays 4 (a[2] is
                                 // a 4-element dynamic array)
    $display( $size(a[1], 1) );  // OK, displays 0 (a[1] is
                                 // an empty dynamic array)
    $display( $size(a, 3) );     // OK, displays 5 (fixed-size dimension)
  end
endmodule : sv12_lrm_p0566_typedef_logic_word

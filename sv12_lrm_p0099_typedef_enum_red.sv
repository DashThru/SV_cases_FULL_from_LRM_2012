////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        99
// Description: dynamic casting
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0099_typedef_enum_red;

  typedef enum { red, green, blue, yellow, white, black } Colors;
  typedef bit [3:0] dest_t;
  bit [4:0] A;
  dest_t B;

  Colors col;

  initial begin
    $cast( col, 2 + 3 );

    if(!$cast(col,2+8)) //10: invalid cast
      $display( "Error in cast" );
          
    col = Colors'(2 + 3);
    
    B = dest_t'(A);  // Assuming A is of bit-stream type source_t and B is of bit-stream type dest_t
  end
endmodule : sv12_lrm_p0099_typedef_enum_red

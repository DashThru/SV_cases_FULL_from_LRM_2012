////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        115
// Description: dynamic array size() and delete()
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0115_int_idest_isrc;

  integer address[]; // Declare the dynamic array.
  int j = address.size;
  initial address = new[ address.size() * 4 ] (address); // quadruple addr array
  
  parameter N=32;
  int ab [] = new[ N ]; // create a temporary array of size N
  initial begin
    // use ab
    ab.delete; // delete the array contents
    $display( "%d", ab.size ); // prints 0
  end

endmodule : sv12_lrm_p0115_int_idest_isrc

////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        119
// Description: integer array associative
// Note:        
//
////////////////////////////////////////////////////////////////

class myClass;

endclass

module sv12_lrm_p0119_integer_i_array_associative;


  integer i_array[*];  // associative array of integer (unspecified index)
  bit [20:0] array_b[string];  // associative array of 21-bit vector, indexed by string
  event ev_array[myClass];  // associative array of event indexed by class myClass

  int array_c [*];
  int array_d [ string ];

endmodule : sv12_lrm_p0119_integer_i_array_associative

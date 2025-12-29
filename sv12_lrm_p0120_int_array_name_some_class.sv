////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        120
// Description: class index and integral index
// Note:        
//
////////////////////////////////////////////////////////////////

class some_Class;
endclass

module sv12_lrm_p0120_int_array_name_some_class;

  int array_name [ some_Class ];
  
  int array_name1 [ integer ];
  typedef bit signed [4:1] SNibble;
  int array_name2 [ SNibble ];
  typedef bit [4:1] UNibble;
  int array_name3 [ UNibble ];

  typedef struct {byte B; int I[*];} Unpkt;
  int array_name4 [ Unpkt ];

endmodule : sv12_lrm_p0120_int_array_name_some_class

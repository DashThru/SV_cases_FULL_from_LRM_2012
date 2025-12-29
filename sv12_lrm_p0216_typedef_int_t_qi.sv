////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        216
// Description: nesting of unpacked array concatenations
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0216_typedef_int_t_qi;
  typedef int T_QI[$];
  T_QI jagged_array[$] = '{ {1}, T_QI'{2,3,4}, {5,6} };
    // jagged_array[0][0] = 1 -- jagged_array[0] is a queue of 1 int
    // jagged_array[1][0] = 2 -- jagged_array[1] is a queue of 3 ints
    // jagged_array[1][1] = 3
    // jagged_array[1][2] = 4
    // jagged_array[2][0] = 5 -- jagged_array[2] is a queue of 2 ints
    // jagged_array[2][1] = 6


endmodule : sv12_lrm_p0216_typedef_int_t_qi

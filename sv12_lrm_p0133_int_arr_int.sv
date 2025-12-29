////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        133
// Description: iterator index querying
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0133_int_arr_int;

  int arr[]; 
  int q[$];

  initial begin
    // find all items equal to their position (index)
    q = arr.find with ( item == item.index );
  end

endmodule : sv12_lrm_p0133_int_arr_int

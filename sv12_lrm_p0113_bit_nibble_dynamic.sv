////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        113
// Description: dynamic arrays
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0113_bit_nibble_dynamic;

  bit [3:0] nibble[];  // Dynamic array of 4-bit vectors
  integer mem[2][];    // Fixed-size unpacked array composed of 2 dynamic subarrays of integers

  int arr1 [][2][3] = new [4];  // arr1 sized to length 4; elements are fixed-size arrays and so do not require initializing
  int arr2 [][] = new [4];      // arr2 sized to length 4; dynamic subarrays remain unsized and uninitialized
  
  int arr[2][][]; 
  initial begin
    arr[0] = new [4];     // dynamic subarray arr[0] sized to length 4
    arr[0][0] = new [2];  // legal, arr[0][n] created above for n = 0..3
  end

  int idest[], isrc[3] = '{5, 6, 7};
  initial idest = new [3] (isrc); // set size and array element data values (5, 6, 7)

  int src[3], dest1[], dest2[];
  initial begin
    src = '{2, 3, 4};
    dest1 = new[2] (src); // dest1's elements are {2, 3}.
    dest2 = new[4] (src); // dest2's elements are {2, 3, 4, 0}.
  end

  integer addr[]; // Declare the dynamic array.
  initial begin
    addr = new[100]; // Create a 100-element array. Double the array size, preserving previous values. Preexisting references to elements of addr are outdated.
    addr = new[200](addr);
  end


endmodule : sv12_lrm_p0113_bit_nibble_dynamic

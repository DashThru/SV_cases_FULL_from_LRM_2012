////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        111
// Description: multidimensional arrays 
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0111_bit_joe_elements;


  bit [3:0] [7:0] joe [1:10];  // 10 elements of 4 8-bit bytes
                               // (each element packed into 32 bits)
							   
  initial begin
    joe[9] = joe[8] + 1; // 4 byte add
    joe[7][3:2] = joe[6][1:0]; // 2 byte copy
  end

  bit [1:10] v1 [1:5];   // 1 to 10 varies most rapidly; compatible with memory arrays
  bit v2 [1:5] [1:10];   // 1 to 10 varies most rapidly, compatible with C
  bit [1:5] [1:10] v3 ;  // 1 to 10 varies most rapidly
  bit [1:5] [1:6] v4 [1:7] [1:8];  // 1 to 6 varies most rapidly, followed by
                                   // 1 to 5, then 1 to 8 and then 1 to 7

  typedef bit [1:5] bsix;
  bsix [1:10] v5; // 1 to 5 varies most rapidly

  typedef bsix mem_type [0:3]; // array of four 'bsix' elements
  mem_type ba [0:7]; // array of eight 'mem_type' elements

  int A[2][3][4], B[2][3][4], C[5][4];
  
  initial begin
    A[0][2] = B[1][1];  // assign a subarray composed of four ints
    A[1] = B[0];        // assign a subarray composed of three arrays of four ints each
    A = B;              // assign an entire array
    A[0][1] = C[4];     // assign compatible subarray of four ints
  end

  bit [7:0] [31:0] v7 [1:5] [1:10], v8 [0:255];  // two arrays declared

endmodule : sv12_lrm_p0111_bit_joe_elements

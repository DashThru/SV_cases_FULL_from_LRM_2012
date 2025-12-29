////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        116
// Description: array assignments
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0116_int_a_fixed;

  int A[10:1];  // fixed-size array of 10 elements
  int B[0:9];   // fixed-size array of 10 elements
  initial A = B;        // ok. Compatible type and same size

  logic [7:0] V1[10:1];
  logic [7:0] V2[10];
  wire [7:0] W[9:0]; // data type is logic [7:0] W[9:0]
  assign W = V1;
  initial #10 V2 = W;

  int C[2][100:1];
  int D[] = new[100]; // dynamic array of 100 elements

endmodule : sv12_lrm_p0116_int_a_fixed

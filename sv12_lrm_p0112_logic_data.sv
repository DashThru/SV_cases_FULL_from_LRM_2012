////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        112
// Description: logic data
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0112_logic_data;


  logic [63:0] data;
  logic [7:0] byte2;
  initial byte2 = data[23:16]; // an 8-bit part-select from data

  bit [3:0] [7:0] j; // j is a packed array
  byte k;
  initial k = j[2]; // select a single 8-bit element from j

  bit signed [31:0] busA [7:0] ;  // unpacked array of 8 32-bit vectors
  int busB [1:0];                 // unpacked array of 2 integers
  initial busB = busA[7:6];       // select a 2-vector slice from busA

  logic [255:0] bitvec;
  int m = 16;
  parameter n=32;
  int i = bitvec[m +: n];         // k must be constant.

  int a[7:5], b[4:0], e;
  int c= 3;
  initial a = {b[c -: 2], e};     // d must be constant

endmodule : sv12_lrm_p0112_logic_data

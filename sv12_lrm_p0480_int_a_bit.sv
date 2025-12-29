////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        480
// Description: rand foreach iterative constraints
// Note:        
//
////////////////////////////////////////////////////////////////

class C;
  //     1  2  3         3    4       1   2  -> Dimension numbers
  int A [2][3][4]; 
  bit [3:0][2:1] B [5:1][4];
  constraint d1 { foreach( A [ i, j, k ] ) A[i][j][k] == i+j+k;}
  constraint d2 { foreach( B [ q, r, , s ] ) B[q][r][s] == q+r+s;}

  rand int C[] ;
  constraint c1 { C.size inside {[1:10]}; }
  constraint c2 { foreach ( C[ k ] ) (k < C.size - 1) -> C[k + 1] > C[k]; }
endclass

module sv12_lrm_p0480_int_a_bit;
  C c=new;
endmodule : sv12_lrm_p0480_int_a_bit

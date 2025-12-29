////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        209
// Description: assignment patterns
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0209_var_int_a;

  parameter N = 5;
  var int A[N] = '{default:1};
  var integer i = '{31:1, 23:1, 15:1, 8:1, default:0};
  
  parameter PI = 3.14;
  typedef struct {real r, th;} C;
  var C x = '{th:PI/2.0, r:1.0};
  var real y [0:1] = '{0.0, 1.1}, z [0:9] = '{default: 3.1416};

  var int a,b,c,d;
  var int B[4] = '{a, b, c, d};
  var C k = '{1.0, PI/2.0};

  initial '{a, b, c, d} = B;

endmodule : sv12_lrm_p0209_var_int_a

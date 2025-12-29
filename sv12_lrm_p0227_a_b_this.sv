////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        227
// Description: relational operators
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0227_a_b_this;

  int a=1,b=2;
  int z;
  initial begin
    z = a < b - 1   ; // this expression is the same as
    z = a < (b - 1) ; // this expression, but . . .
    z = b - (1 < a) ; // this one is not the same as
    z = b - 1 < a   ; // this expression
  end
endmodule : sv12_lrm_p0227_a_b_this

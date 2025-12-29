////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        96
// Description: cast operator
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0096_int;

  int a;
  shortint b;

  initial begin
    a = int'(2.0 * 3.0);
    b = shortint'({8'hFA,8'hCE});
  end
  
  typedef real cast_t1;
  typedef int  cast_t2;
  cast_t2 A;

  initial begin
    A = cast_t1'(1+2) + cast_t2'(1.0+2.0);
  end
  
  // is the same as 
  initial begin
    cast_t1 temp1;
    cast_t2 temp2;
    temp1 = 1+2;
    temp2 = 1.0+2.0;
    A = temp1 + temp2;
  end
endmodule : sv12_lrm_p0096_int

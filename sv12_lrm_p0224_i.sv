////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        224
// Description: increment and decrement operators
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0224_i;
  int i=1,j=2;
  initial begin
  i = 10;
  j = i++ + (i = i - 1);
  end
endmodule : sv12_lrm_p0224_i

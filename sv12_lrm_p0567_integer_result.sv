////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        567
// Description: integer math system functions
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0567_integer_result;
  
  integer result,n=10;
  initial begin
    result = $clog2(n);
  end

endmodule : sv12_lrm_p0567_integer_result

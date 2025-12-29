////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        568
// Description: bit vector system functions
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0568_countbits_expression_returns;
   
  bit [3:0] expression=4'b01xz;

  initial begin
    $countbits (expression, '1)    ;  // returns the number of bits in expression having value 1.
    $countbits (expression, '1, '0);  // returns the number of bits in expression having values 1 or 0.
    $countbits (expression, 'x, 'z);  // returns the number of bits in expression having values X or Z.
    $countones (expression)    ;  
    $onehot    (expression)    ;  
    $onehot0   (expression)    ;  
    $isunknown (expression)    ;  
  end
endmodule : sv12_lrm_p0568_countbits_expression_returns

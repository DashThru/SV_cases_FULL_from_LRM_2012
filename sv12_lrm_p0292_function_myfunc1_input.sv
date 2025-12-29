////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        292
// Description: return values and void functions
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0292_function_myfunc1_input;

  function [15:0] myfunc1 (input [7:0] x,y);
    myfunc1 = x * y - 1; // return value assigned to function name
  endfunction
  
  function [15:0] myfunc2 (input [7:0] x,y);
    return x * y - 1; //return value is specified using return statement
  endfunction
  
  initial begin
    logic [15:0] a,b,c,d;
    a = b + myfunc1(c, d); // call myfunc1 (defined above) as an expression
    myprint(a); // call myprint (defined below) as a statement
  end
    
  function void myprint (int a);
  endfunction

  logic [7:0] x,y;
  initial void'(myfunc2(x,y));

endmodule : sv12_lrm_p0292_function_myfunc1_input

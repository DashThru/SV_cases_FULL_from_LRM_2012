////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        293
// Description: static and automatic functions
// Note:        
//
////////////////////////////////////////////////////////////////

module tryfact;
  // define the function
  function automatic integer factorial (input [31:0] operand);
    if (operand >= 2)
      factorial = factorial (operand - 1) * operand;
    else
      factorial = 1;
	endfunction: factorial
  // test the function
  integer result;
  initial begin
    for (int n = 0; n <= 7; n++) begin
      result = factorial(n);
      $display("%0d factorial=%0d", n, result);
    end
  end
endmodule: tryfact

module sv12_lrm_p0293_module_tryfact;
  tryfact u_tryfact();
endmodule : sv12_lrm_p0293_module_tryfact

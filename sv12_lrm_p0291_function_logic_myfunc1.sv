////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        291
// Description: function declaration
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0291_function_logic_myfunc1;


function logic [15:0] myfunc1(int x, int y);
endfunction

function logic [15:0] myfunc2;
  input int x;
  input int y;
endfunction

function logic [15:0] myfunc3(int a, int b, output logic [15:0] u, v);
endfunction

function [3:0][7:0] myfunc4(input [3:0][7:0] a, b[3:0]);
endfunction

endmodule : sv12_lrm_p0291_function_logic_myfunc1

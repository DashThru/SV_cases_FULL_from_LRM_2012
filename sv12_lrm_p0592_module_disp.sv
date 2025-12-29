////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        592
// Description: works with the $timeformat system task
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0592_module_disp;
  logic [31:0] rval;
  pulldown (pd);
  initial begin
    rval = 101;
    $display("rval = %h hex %d decimal",rval,rval);
    $display("rval = %o octal\nrval = %b bin",rval,rval);
    $display("rval has %c ascii character value",rval);
    $display("pd strength value is %v",pd);
    $display("current scope is %m");
    $display("%s is ascii value for 101",101);
    $display("simulation time is %t", $time);
  end
endmodule : sv12_lrm_p0592_module_disp

// shall display the following:
// rval = 00000065 hex        101 decimal
// rval = 00000000145 octal
// rval = 00000000000000000000000001100101 bin
// rval has e ascii character value
// pd strength value is StX
// current scope is disp
// e is ascii value for 101
// simulation time is                    0


////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        253
// Description: string literal expressions
// Note:        
//
////////////////////////////////////////////////////////////////

module string_test;
  bit [8*14:1] stringvar;
  initial begin
    stringvar = "Hello world";
    $display("%s is stored as %h", stringvar, stringvar);
    stringvar = {stringvar,"!!!"};
    $display("%s is stored as %h", stringvar, stringvar);
  end
endmodule
// Hello world is stored as 00000048656c6c6f20776f726c64
// Hello world!!! is stored as 48656c6c6f20776f726c64212121

module sv12_lrm_p0253_x_i1_add;
  string_test u_string_test();
endmodule : sv12_lrm_p0253_x_i1_add

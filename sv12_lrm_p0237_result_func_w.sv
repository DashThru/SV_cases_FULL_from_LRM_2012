////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        237
// Description: string concatenation
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0237_result_func_w;

    string hello = "hello";
    string s;
    int n = 3;
    string s1 = {n { "boo " }};
    
    int result,w,y;

    function func(int w);
    endfunction

  initial begin
    // When a replication expression is evaluated, the operands shall be evaluated exactly once, even if the replication constant is zero.
    result = {4{func(w)}} ;
    // would be computed as
    y = func(w) ;
    result = {y, y, y, y} ;

    s = { hello, " ", "world" };
    $display( "%s\n", s );  // displays 'hello world'
    s = { s, " and goodbye" };
    $display( "%s\n", s );  // displays 'hello world and goodbye'

    $display( "%s\n", s1 );  // displays 'boo boo boo '

  end

endmodule : sv12_lrm_p0237_result_func_w

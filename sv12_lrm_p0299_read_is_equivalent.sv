////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        299
// Description: function argument binding by name
// Note:        Typo fix in line 15
//
////////////////////////////////////////////////////////////////

module m;
  logic a, w;
  task t1 (output o = a) ;  // default binds to m.a
  endtask :t1
  task t3 (inout io = w) ;  // default binds to m.w
  endtask :t3
endmodule :m

module n;
  logic a;
  initial begin
  m.t1();  // same as m.t1(m.a), not m.t1(n.a);
           // at end of task, value of t1.o is copied to m.a
  m.t3();  // same as m.t3(m.w)
           // value of m.w is copied to t3.io at start of task and
		   // value of t3.io is copied to m.w at end of task
  end
endmodule :n

module sv12_lrm_p0299_read_is_equivalent;

  m um();
  n un();

  function int fun( int j = 1, string s = "no" );
  endfunction

  initial begin
    fun( .j(2), .s("yes") );  // fun( 2, "yes" );
    fun( .s("yes") );         // fun( 1, "yes" );
    fun( , "yes" );           // fun( 1, "yes" );
    fun( .j(2) );             // fun( 2, "no" );
    fun( .s("yes"), .j(2) );  // fun( 2, "yes" );
    fun( .s(), .j() );        // fun( 1, "no" );
    fun( 2 );                 // fun( 2, "no" );
    fun( );                   // fun( 1, "no" );
    fun( 2, .s("yes") );      // OK
  end


endmodule : sv12_lrm_p0299_read_is_equivalent

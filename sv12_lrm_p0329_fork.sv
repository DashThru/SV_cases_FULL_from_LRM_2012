////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        329
// Description: fork
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0329_fork;


  event E1, E2;
  initial fork
    T1:  @ E2;
    T2:  @ E1;
    T3: begin
          E2 = E1;
          -> E2;
	end
  join

  event E3 = null;
  initial begin
    @ E3;                  // undefined: might block forever or not at all
    wait( E3.triggered );  // undefined
    -> E3;                 // no effect
  end

  initial begin
    if(E1) // same as if ( E1 != null )
      E1 = E2;
    if ( E1 == E2 )
      $display( "E1 and E2 are the same event" );
  end
endmodule : sv12_lrm_p0329_fork

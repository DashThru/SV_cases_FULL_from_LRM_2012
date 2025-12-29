////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        295
// Description: background processes spawned by function calls
// Note:        
//
////////////////////////////////////////////////////////////////

class IntClass;
  int a;
endclass

module sv12_lrm_p0295_class_intclass;

  IntClass address=new(), stack=new();

  function automatic bit watch_for_zero( IntClass p );
    fork
      forever @p.a begin
        if ( p.a == 0 ) $display ("Unexpected zero");
      end
	join_none
	return ( p.a == 0 );
  endfunction

  function bit start_check();
    return ( watch_for_zero( address ) | watch_for_zero( stack ) );
  endfunction

  initial if ( start_check() ) $display ( "OK");
  
  initial fork
    if (start_check() ) $display( "OK too");
  join_none


endmodule : sv12_lrm_p0295_class_intclass

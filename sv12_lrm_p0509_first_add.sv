////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        509
// Description: Random production weights
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0509_first_add;

  int x=0;
  initial randsequence (main)
      main  : first ;

      first : add := 3
            | dec := (1 + 1)  // weight = 2
            ;

      add   : { x += 3; $display("ADD  -> x=%0d", x); };
      dec   : { x -= 1; $display("DEC  -> x=%0d", x); };
  endsequence

  int depth = 1;
  function do_push(); endfunction
  function do_pop(); endfunction

  initial randsequence()
    PP_PO : if ( depth < 2 ) PUSH else POP ;
    PUSH  : { ++depth; do_push(); };
    POP   : { --depth; do_pop(); };
  endsequence

endmodule : sv12_lrm_p0509_first_add

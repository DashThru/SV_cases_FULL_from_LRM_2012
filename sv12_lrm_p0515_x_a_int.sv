////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        515
// Description: randsequence block to produce random traffic
// Note:        GenQueue example is broken; Typo fix in line 44
//
////////////////////////////////////////////////////////////////
  
class DSL; 
   int crc=1;
endclass // class that creates valid DSL packets

module sv12_lrm_p0515_x_a_int;

  function int[$] GenQueue(int low, int high);
    int[$] q;
    randsequence()
      TOP      : BOUND(low) LIST BOUND(high) ;
      LIST     : LIST ITEM := 8 { q = { q, ITEM }; }
                    | ITEM := 2 { q = { q, ITEM }; }
                 ;
      int ITEM : { return $urandom_range( low, high ); } ;
	  
      BOUND(int b) : { q = { q, b }; } ;
    endsequence
    GenQueue = q;
  endfunction
  
  function void transmit(DSL PACKET); endfunction
  logic clock;
  default clocking @clock; endclocking


  initial randsequence (STREAM)
    STREAM : GAP DATA := 80
           | DATA := 20;
    DATA   : PACKET(0) := 94 { transmit( PACKET ); }
           | PACKET(1) := 6  { transmit( PACKET ); } ;
    DSL PACKET (bit bad) : { DSL d = new;
                              if( bad ) d.crc ^= 23;  // mangle crc
                              return d;
                           };
    GAP: { ## ($urandom_range( 1, 20 )); };
  endsequence


endmodule : sv12_lrm_p0515_x_a_int

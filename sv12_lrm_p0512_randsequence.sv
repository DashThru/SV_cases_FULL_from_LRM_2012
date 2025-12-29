////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        512
// Description: aborting productions break and return
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0512_randsequence;

  int fifo_length=5,max_length=3,flag=2;

  initial begin
    randsequence()
      WRITE : SETUP DATA ;
      SETUP : { if( fifo_length >= max_length ) break; } COMMAND ;
      DATA  : { $display("C"); };
      COMMAND: { $display("COMMAND"); };
    endsequence
    next_statement : $display("next_statement");
  end

  initial randsequence()
    TOP : P1 P2 ;
    P1  : A B C;
    P2  : A { if( flag == 1) return; } B C;
    A   : { $display("A"); };
    B   : { if( flag == 2 ) return; $display("B"); };
    C   : { $display("C"); };
  endsequence

endmodule : sv12_lrm_p0512_randsequence

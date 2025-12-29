////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        511
// Description: interleaving productions rand join
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0511_randsequence;


  initial randsequence()
    PUSH_OPER : repeat( $urandom_range( 2, 6 ) ) PUSH ;
    PUSH      : {$display("haha");};
  endsequence

  initial randsequence( TOP )
    TOP : rand join S1 S2 ;
    S1  : A B ;
    S2  : C D ;
    A   : {$display("A");};
    B   : {$display("B");};
    C   : {$display("C");};
    D   : {$display("D");};
  endsequence

  initial randsequence( TOP )
    TOP : rand join (0.0) S1 S2 ;
    S1  : A B ;
    S2  : C D ;
    A   : {$display("A");};
    B   : {$display("B");};
    C   : {$display("C");};
    D   : {$display("D");};
  endsequence

  initial randsequence( TOP )
    TOP : rand join (1.0) S1 S2 ;
    S1  : A B ;
    S2  : C D ;
    A   : {$display("A");};
    B   : {$display("B");};
    C   : {$display("C");};
    D   : {$display("D");};
  endsequence

endmodule : sv12_lrm_p0511_randsequence

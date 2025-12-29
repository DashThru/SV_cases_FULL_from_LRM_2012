////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        510
// Description: random case production statements
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0510_randsequence;

  int device=3;
  initial randsequence()
    SELECT : case ( device & 7 )
      0       : NETWORK ; 
      1,2     : DISK;
      default : MEMORY ;
    endcase ;
    NETWORK : {$display("haha");};
    DISK : {$display("haha");};
    MEMORY : {$display("haha");};
  endsequence

endmodule : sv12_lrm_p0510_randsequence

////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        374
// Description: match of the preceding four sequences
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0374_sequence_t2;

  logic a,b,c,d;

  sequence t2;
    (a ##[2:3] b) or (c ##[1:2] d);
  endsequence
  sequence ts2;
    first_match(t2);
  endsequence
  sequence ts3(local int x,e);
    first_match(t2,x=e);
  endsequence
  sequence ts4(local int x,e);
    first_match((t2,x=e));
  endsequence

endmodule : sv12_lrm_p0374_sequence_t2

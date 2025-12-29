////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        358
// Description: repetition in sequences
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0358_repetition_in_sequences;

  logic a,b,c;

  sequence s1;
    a ##1 b ##1 b ##1 b ##1 c;
  endsequence

  sequence s2;
    a ##1 b [*3] ##1 c;
  endsequence

  sequence s3;
    b ##1 ( a[*0] ##0 c);
  endsequence

  sequence s4;
    b ##1 a[*0:1] ##2 c ;
  endsequence

  sequence s5;
    (a ##2 b) [*5];
  endsequence

  sequence s6;
    (a ##2 b)[*1:5];
  endsequence

  sequence s7;
    (a[*0:3] ##1 b ##1 c);
  endsequence

  sequence s8;
    a ##1 b [*1:$] ##1 c;
  endsequence

  sequence s9;
    a ##1 b [->2:10] ##1 c;
  endsequence

  sequence s10;
    a ##1 ((!b[*0:$] ##1 b) [*2:10]) ##1 c;
  endsequence

  sequence s11;
    a ##1 b [=2:10] ##1 c;
  endsequence

  sequence s12;
    a ##1 ((!b [*0:$] ##1 b) [*2:10]) ##1 !b[*0:$] ##1 c;
  endsequence

  sequence s13(local int v,e);
    (b[->1], v = e)[*2];
  endsequence

endmodule : sv12_lrm_p0358_repetition_in_sequences

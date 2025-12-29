////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        375
// Description: conditions over sequences
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0375_sequence_burst_rule1;

  logic mclk,burst_mode,trdy,irdy;
  logic seq1,seq2;

  sequence burst_rule1;
    @(posedge mclk)
      $fell(burst_mode) ##0
      ((!burst_mode) throughout (##2 ((trdy==0)&&(irdy==0)) [*7]));
  endsequence

  sequence burst_rule2;
    (1[*0:$] ##1 seq1 ##1 1[*0:$]) intersect seq2;
  endsequence

  sequence burst_rule3;
    !trdy[*7] within ($fell(irdy) ##1 !irdy[*8]);
  endsequence

endmodule : sv12_lrm_p0375_sequence_burst_rule1

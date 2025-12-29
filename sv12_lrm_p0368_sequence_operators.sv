////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        368
// Description: sequence operators and/or
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0368_sequence_operators;

  logic clk,clock,te1,te2,te3,te4,te5; 

  global clocking gc @(clock); endclocking 
  
  sequence s1;
    te1 and te2;
  endsequence
  sequence s2;
    (te1 ##2 te2) and (te3 ##2 te4 ##2 te5);
  endsequence
  sequence s3;
    (te1 ##[1:5] te2) and (te3 ##2 te4 ##2 te5);
  endsequence
  sequence s4;
    te1 or te2;
  endsequence
  sequence s5;
    (te1 ##2 te2) or (te3 ##2 te4 ##2 te5);
  endsequence
  sequence s6;
    (te1 ##[1:5] te2) or (te3 ##2 te4 ##2 te5);
  endsequence


endmodule : sv12_lrm_p0368_sequence_operators

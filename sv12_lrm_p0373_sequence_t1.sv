////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        373
// Description: sequence first_match operation
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0373_sequence_t1;

  logic te1,te2;

  sequence t1;
    te1 ## [2:5] te2;
  endsequence
  sequence ts1;
    first_match(te1 ## [2:5] te2);
  endsequence

endmodule : sv12_lrm_p0373_sequence_t1

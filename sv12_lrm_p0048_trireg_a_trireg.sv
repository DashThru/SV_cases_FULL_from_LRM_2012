////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        48
// Description: trireg definition
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0048_trireg_a_trireg;

  trireg a;  // trireg net of charge strength medium
  trireg (large) #(0,0,50) cap1;     // trireg net of charge strength large
                                     // with charge decay time 50 time units
  trireg (small) signed [3:0] cap2;  // signed 4-bit trireg vector of

endmodule : sv12_lrm_p0048_trireg_a_trireg

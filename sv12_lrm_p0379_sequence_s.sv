////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        379
// Description: local variables in sequence
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0379_sequence_s;

  logic a,b,c,d,e,f;

  sequence s;
    logic u, v = a, w = v || b;
    a ##1 b[->1] ##1 c[*2];
  endsequence

endmodule : sv12_lrm_p0379_sequence_s

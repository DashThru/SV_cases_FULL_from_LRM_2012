////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        63
// Description: interconnect w1 legal
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0063_interconnect_w1_legal;

  interconnect wi1;  // legal
  interconnect [3:0] wi2;  // legal
  interconnect [3:0] wi3 [1:0];  // legal

  typedef struct {
  real field1;
  bit field2;
  } T;

  // user-defined resolution function Tsum
  function automatic T Tsum (input T driver[]);
  Tsum.field1 = 0.0;
  foreach (driver[i])
  Tsum.field1 += driver[i].field1;
  endfunction

  nettype T wT;

  nettype T wTsum with Tsum;

  wT w1;
  
  wT w2[8];
  
  wTsum w3;
  
  wTsum w4[8];
  
  typedef real TR[5];
  
  nettype TR wTR;
  
  wTR w5;
  
  wTR w6[8];

endmodule : sv12_lrm_p0063_interconnect_w1_legal

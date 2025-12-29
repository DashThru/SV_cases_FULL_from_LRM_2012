////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        57
// Description: typedef struct
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0057_typedef_struct;

  logic [3:0] driver;

  typedef struct {
    real field1;
    bit field2;
  } T;

  function automatic T Tsum (input T driver[]);
    Tsum.field1 = 0.0;
    foreach (driver[i]) Tsum.field1 += driver[i].field1;
  endfunction

  nettype T wT; // an unresolved nettype wT whose data type is T
  
  nettype T wTsum with Tsum;
  
  typedef real TR[5];
  
  nettype TR wTR;
  
  nettype wTsum nettypeid2;
endmodule : sv12_lrm_p0057_typedef_struct

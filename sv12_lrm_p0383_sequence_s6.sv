////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        383
// Description: operand sequence continues as a separate thread
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0383_sequence_s6;

  `define true 1
  logic a,b,c,d,e,data,data1,data2;

  sequence s6;
    int x,y;
      ((a ##1 (b, x = data, y = data1) ##1 c)
         or (d ##1 (`true, x = data) ##0 (e==x))) ##1 (x==data2);
    // legal because x is in the intersection
  endsequence

endmodule : sv12_lrm_p0383_sequence_s6

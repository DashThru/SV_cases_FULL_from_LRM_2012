////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        384
// Description: calling subroutines on match of a sequence
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0384_sequence_s8;
  
  `define true 1
  logic a,b,c,d,e,f,data,data1,data2;

  sequence s8;
    int x,y;
      ((a ##1 (b, x = data, y = data1) ##1 c)
         and (d ##1 (`true, x = data) ##0 (e==x))) ##1 (y==data2);
    // legal because y is in the difference
  endsequence

  sequence s1;
    logic v, w;
    (a, v = e) ##1
    (b[->1], w = f, $display("b after a with v = %h, w = %h\n", v, w));
  endsequence

endmodule : sv12_lrm_p0384_sequence_s8

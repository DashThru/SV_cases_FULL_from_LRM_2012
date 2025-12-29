////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        380
// Description: local variables in sequence
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0380_property_e;

  logic a,b,c,d,e,f,g;

  sequence s1;
    logic x,y;
    a ##1 (b[->1], x = e, y = x && f) ##1 c[*2];
  endsequence

  sequence s2;
    logic x,y;
    a ##1 (b[->1], x = e, y = x && f) ##1 (c[*2], x &= g);
  endsequence

  sequence s3;
    logic x,y;
    (a ##1 b[*0:1], x = e) ##1 c[*2];
  endsequence

  logic valid_in,pipe_in,pipe_out1,data_in,data_out;

  property ss;
    int x;
    (valid_in, x = pipe_in) |-> ##5 (pipe_out1 == (x+1));
  endproperty
  
  sequence data_check;
    int x;
    a ##1 (!a, x = data_in) ##1 !b[*0:$] ##1 b && (data_out == x);
  endsequence

endmodule : sv12_lrm_p0380_property_e

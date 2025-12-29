////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        356
// Description: local variable formal argument in sequence
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0356_sequence_seq2;

  logic a,b,c,data,data_in,data_out,do1;

  sequence sub_seq2(local inout int lv);
    (a ##1 !a, lv += data_in)
    ##1 !b[*0:$] ##1 b && (data_out == lv);
  endsequence
 
  sequence seq2;
    int v1;
    (c, v1 = data)
    ##1 sub_seq2(v1) // lv is initialized by assigning it the value of v1;
    ##1 (do1 == v1);
  endsequence

  sequence seq2_inlined;
    int v1, lv;
    (c, v1 = data) ##1
    (
      (1, lv = v1) ##0
      (a ##1 !a, lv += data_in)
      ##1 (!b[*0:$] ##1 b && (data_out == lv), v1 = lv)
    )
    ##1 (do1 == v1);
  endsequence

endmodule : sv12_lrm_p0356_sequence_seq2

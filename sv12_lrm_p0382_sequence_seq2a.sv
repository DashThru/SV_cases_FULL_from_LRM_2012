////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        382
// Description: named sequence to which triggered is applied
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0382_sequence_seq2a;
  
  logic a,b,c,do1,data_in,data_out;

  sequence sub_seq2(lv);
    (a ##1 !a, lv = data_in) ##1 !b[*0:$] ##1 b && (data_out == lv);
  endsequence

  sequence seq2a;
    int v1; 
    c ##1 sub_seq2(v1).triggered ##1 (do1 == v1);  // v1 is now bound to lv
  endsequence
  
  sequence seq2b;
    int v1; 
    c ##1 !sub_seq2(v1).triggered ##1 (do1 == v1); // v1 unassigned
  endsequence

endmodule : sv12_lrm_p0382_sequence_seq2a

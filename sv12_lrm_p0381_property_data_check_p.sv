////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        381
// Description: local variable assignments in sequence
// Note:        Typo fix in line 16
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0381_property_data_check_p;

  logic a,b,c,do1;
  logic data_in,data_out,data;
  parameter MAX=10;

  property data_check_p;
    int x;
    a ##1 (!a, x = data_in) |=> !b[*0:$] ##1 b && (data_out == x);
  endproperty
  
  sequence rep_v;
    int x = 0;
    (a[->1], x += data)[*4] ##1 b ##1 c && (data_out == x);
  endsequence
  
  sequence count_a_cycles;
    int x;
    ($rose(a), x = 1)
    ##1 (a, x++)[*0:$]
    ##1 !a && (x <= MAX);
  endsequence
  
  sequence sub_seq2(lv);
    (a ##1 !a, lv = data_in) ##1 !b[*0:$] ##1 b && (data_out == lv);
  endsequence
  sequence seq2;
    int v1;
    c ##1 sub_seq2(v1)  // v1 is bound to lv
    ##1 (do1 == v1); // v1 holds the value that was assigned to lv
  endsequence

endmodule : sv12_lrm_p0381_property_data_check_p

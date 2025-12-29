////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        417
// Description: end point of a sequence in multiclock
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0417_sequence_e2;

  logic a,b,c,d,e,f,clk,clk1,clk2,branch_back,sysclk,reset,inst,ready,proc1,proc2;

  sequence e1(a,b,c);
    @(posedge clk) $rose(a) ##1 b ##1 c ;
  endsequence
  
  sequence e2;
    @(posedge sysclk) reset ##1 inst ##1 e1(ready,proc1,proc2).matched [->1]
	   ##1 branch_back;
  endsequence

endmodule : sv12_lrm_p0417_sequence_e2

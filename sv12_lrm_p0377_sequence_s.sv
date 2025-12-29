////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        377
// Description: composing sequences from simpler subsequences
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0377_sequence_s;

  logic a,b,c,sysclk,trans,start_trans,end_trans,ready,proc1,proc2,reset,inst,branch_back;

  sequence s;
    a ##1 b ##1 c;
  endsequence
  sequence rule;
    @(posedge sysclk)
      trans ##1 start_trans ##1 s ##1 end_trans;
  endsequence

  sequence e1;
    @(posedge sysclk) $rose(ready) ##1 proc1 ##1 proc2 ;
  endsequence
  sequence rule1;
    @(posedge sysclk) reset ##1 inst ##1 e1.triggered ##1 branch_back;
  endsequence
  
  sequence e2(a,b,c);
    @(posedge sysclk) $rose(a) ##1 b ##1 c;
  endsequence
  sequence rule2;
    @(posedge sysclk) reset ##1 inst ##1 e2(ready,proc1,proc2).triggered
	  ##1 branch_back;
  endsequence

  sequence e2_instantiated;
    e2(ready,proc1,proc2);
  endsequence
  sequence rule2a;
    @(posedge sysclk) reset ##1 inst ##1 e2_instantiated.triggered ##1 branch_back;
  endsequence

  sequence e3(sequence a, untyped b);
    @(posedge sysclk) a.triggered ##1 b;
  endsequence
  sequence rule3;
    @(posedge sysclk) reset ##1 e3(ready ##1 proc1, proc2) ##1 branch_back;
  endsequence


endmodule : sv12_lrm_p0377_sequence_s

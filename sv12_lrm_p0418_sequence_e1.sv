////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        418
// Description: sequence methods
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0418_sequence_e1;

  program check;
    initial begin
      wait (e1.triggered || e2.triggered);
        if (e1.triggered)
          $display("e1 passed");
        if (e2.triggered)
          $display("e2 passed");
        //L2: ...
    end
  endprogram

  logic sysclk,clk,a,b,c,d,e,f,reset,reset1,inst,branch_back,branch_back1;

  sequence e1;
    @(posedge sysclk) $rose(a) ##1 b ##1 c;
  endsequence
  sequence e2;
    @(posedge sysclk) reset ##1 inst ##1 e1.triggered ##1 branch_back;
  endsequence
  sequence e3;
    @(posedge clk) reset1 ##1 e1.matched ##1 branch_back1;
  endsequence
  sequence e2_with_arg(sequence subseq);
    @(posedge sysclk) reset ##1 inst ##1 subseq.triggered ##1 branch_back;
  endsequence
  sequence e4;
    e2_with_arg(@(posedge sysclk) $rose(a) ##1 b ##1 c);
  endsequence


endmodule : sv12_lrm_p0418_sequence_e1

////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        596
// Description: signal strength format display
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0596_always;

  logic s1,s2,s3;

  initial begin
    #15 $display($time,,"group=%b signals=%v %v %v",{s1,s2,s3},s1,s2,s3);

    // 0 group=111 signals=St1 Pu1 St1
    // 15 group=011 signals=Pu0 Pu1 St1
    // 30 group=0xz signals=520 PuH HiZ
    // 45 group=0xx signals=Pu0 65X StX
    // 60 group=000 signals=Me0 St0 St0
  end
endmodule : sv12_lrm_p0596_always

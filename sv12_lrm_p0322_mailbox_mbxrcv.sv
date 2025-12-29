////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        322
// Description: mailbox mbxrcv
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0322_mailbox_mbxrcv;

  mailbox mbxRcv;
  string s;

  initial begin
    mbxRcv = new(32);  // bounded mailbox

    $display("Initial num = %0d", mbxRcv.num());

    mbxRcv.put("haha");
    mbxRcv.try_put("haha");

    $display("After put, num = %0d", mbxRcv.num());

    mbxRcv.get(s);
    $display("get  : %s", s);

    if (mbxRcv.try_get(s))
      $display("try_get : %s", s);
    else
      $display("try_get : mailbox empty");

    mbxRcv.peek(s);
    $display("peek : %s", s);

    if (mbxRcv.try_peek(s))
      $display("try_peek : %s", s);
    else
      $display("try_peek : mailbox empty");
  end

endmodule


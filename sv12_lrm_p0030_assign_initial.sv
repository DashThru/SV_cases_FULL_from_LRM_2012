////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        30
// Description: assignment and initial block example
// Note:        
//
////////////////////////////////////////////////////////////////

module test;
  logic a;
  initial begin
    a <= 0;
    a <= 1;
  end
endmodule

module sv12_lrm_p0030_assign_initial;
  bit p,q;
  test u_test();

  assign p = q;
  initial begin
    q = 1;
    #1 q = 0;
    $display(p);
  end

endmodule : sv12_lrm_p0030_assign_initial


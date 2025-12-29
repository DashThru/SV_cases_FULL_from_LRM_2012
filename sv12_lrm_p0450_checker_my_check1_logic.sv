////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        450
// Description: checker declaration
// Note:        Typo fix in line 22
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0450_checker_my_check1_logic;

  checker my_check1 (logic test_sig, event clock);
    default clocking @clock; endclocking
    property p(logic sig);
       sig == 0;
    endproperty
    a1: assert property (p (test_sig));
    c1: cover property (!test_sig ##1 test_sig);
  endchecker : my_check1

  checker my_check2 (logic a, b);
    a1: assert #0 ($onehot0({a, b}));
    c1: cover #0 (a == 0 && b == 0);
    c2: cover #0 (a == 1);
    c3: cover #0 (b == 1);
  endchecker : my_check2

  checker my_check3 (logic a, b, event clock, output bit failure, undef);
    default clocking @clock; endclocking
    a1: assert property ($onehot0({a, b})) failure = 1'b0; else failure = 1'b1;
    a2: assert property ($isunknown({a, b})) undef = 1'b0; else undef = 1'b1;
  endchecker: my_check3

endmodule : sv12_lrm_p0450_checker_my_check1_logic

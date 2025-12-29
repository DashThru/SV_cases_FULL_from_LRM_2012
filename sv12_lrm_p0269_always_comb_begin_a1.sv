////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        269
// Description:  If statement violation reports and multiple processes
// Note:        
//
////////////////////////////////////////////////////////////////

module fsm();
  function bit f1(bit a, bit not_a);
    a1: unique if (a) ;
    else if (not_a) ;
  endfunction

  bit some_stuff,other_stuff,c,d,e,f;

  always_comb begin : b1
    some_stuff = f1(c, d);
  end
  always_comb begin : b2
    other_stuff = f1(e, f);
  end
endmodule

module sv12_lrm_p0269_always_comb_begin_a1;

  logic [3:0] not_a,a,b,c,z;

  always_comb begin : a1
    for (int j = 0; j < 3; j++)
      unique if (a[j])
        z[j] = a[j] | b[j];
      else if (not_a[j])
	    z[j] = a[j] | c[j];
  end

  fsm u_fsm();

endmodule : sv12_lrm_p0269_always_comb_begin_a1

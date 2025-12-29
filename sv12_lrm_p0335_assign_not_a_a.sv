////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        335
// Description: deferred assertion flush points
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0335_assign_not_a_a;

  bit not_a,a;

  assign not_a = !a;
  always_comb begin : b1
    a1: assert (not_a != a);
    a2: assert #0 (not_a != a); // Should pass once values have settled
  end

endmodule : sv12_lrm_p0335_assign_not_a_a

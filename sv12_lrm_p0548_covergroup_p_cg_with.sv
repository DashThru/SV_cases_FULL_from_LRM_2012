////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        548
// Description: overriding the built-in cover method
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0548_covergroup_p_cg_with;

  bit a,b,c,clk;

  covergroup p_cg with function sample(bit a, int x);
    coverpoint x;
    cross x, a;
  endgroup : p_cg
  
  p_cg cg1 = new;
  
  property p1;
    int x;
    @(posedge clk)(a, x = b) ##1 (c, cg1.sample(a, x));
  endproperty : p1
  
  c1: cover property (p1);
  
  function automatic void F(int j);
    bit d;
    cg1.sample( d, j );
  endfunction

endmodule : sv12_lrm_p0548_covergroup_p_cg_with

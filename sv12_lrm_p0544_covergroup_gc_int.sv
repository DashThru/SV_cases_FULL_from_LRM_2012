////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        544
// Description: specifying coverage options
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0544_covergroup_gc_int;

  bit clk,a_var,b_var;
  covergroup gc (int maxA, int maxB) @(posedge clk) ;
    a : coverpoint a_var;
    b : coverpoint b_var;
  endgroup

  initial begin
    gc g1 = new (10,20);
    g1.option.comment = "Here is a comment set for the instance g1";
    g1.a.option.weight = 3;
  end
endmodule : sv12_lrm_p0544_covergroup_gc_int

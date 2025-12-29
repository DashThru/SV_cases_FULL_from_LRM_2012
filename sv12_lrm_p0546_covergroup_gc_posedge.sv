////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        546
// Description: covergroup type option
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0546_covergroup_gc_posedge;

  bit clk,a_var,b_var;

  covergroup gc @(posedge clk) ;
    a : coverpoint a_var;
    b : coverpoint b_var;
  endgroup
  
  gc g1;
  initial begin
    gc::type_option.comment = "Here is a comment for covergroup g1";
    gc::a::type_option.weight = 3;
    g1=new;
  end
endmodule : sv12_lrm_p0546_covergroup_gc_posedge

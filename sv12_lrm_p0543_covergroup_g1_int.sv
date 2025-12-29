////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        543
// Description: specifying coverage options
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0543_covergroup_g1_int;

  bit clk,a_var,b_var;  

  covergroup g1 (int w, string instComment) @(posedge clk) ;
    option.per_instance = 1;
    option.comment = instComment;
	a : coverpoint a_var
	{
	  option.auto_bin_max = 128;
	}
	b : coverpoint b_var
	{
	  option.weight = w;
	}
    c1 : cross a_var, b_var ;
  endgroup

endmodule : sv12_lrm_p0543_covergroup_g1_int

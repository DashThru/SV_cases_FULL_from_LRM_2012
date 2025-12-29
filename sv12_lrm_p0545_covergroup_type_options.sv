////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        545
// Description: covergroup type options
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0545_covergroup_type_options;
  
  bit clk,a_var,b_var;

  covergroup g1 (int w, string instComment) @(posedge clk) ;
    option.per_instance = 1;
    type_option.comment = "Coverage model for features x and y";
	type_option.strobe = 1;
	type_option.merge_instances = 1;
	option.comment = instComment;
	a : coverpoint a_var
	{
	  option.weight = 2;
	  type_option.weight = 3;
	}
	b : coverpoint b_var
	{
	  option.weight = w;
	  type_option.weight = 5;
	}
  endgroup

  initial begin
     g1 gc = new (10,"OK");
     gc.a.type_option.weight = 4;
  end
endmodule : sv12_lrm_p0545_covergroup_type_options

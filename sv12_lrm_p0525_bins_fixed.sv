////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        525
// Description: specifying bins for values
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0525_bins_fixed;

  
  bit [9:0] v_a;
  bit clk;
  
  covergroup cg @(posedge clk);
    coverpoint v_a
	{
      bins a = { [0:63],65 };
      bins b[] = { [127:150],[148:191] };  // note overlapping values
      bins c[] = { 200,201,202 };
      bins d = { [1000:$] };
      bins fixed [4] = { [1:10], 1, 4, 7 };
      bins others[] = default;
    }
  endgroup
endmodule : sv12_lrm_p0525_bins_fixed

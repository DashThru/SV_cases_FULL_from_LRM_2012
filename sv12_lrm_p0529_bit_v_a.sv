////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        529
// Description: specifying bins for transitions
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0529_bit_v_a;


  bit [4:1] v_a;
  bit clk;
  int v;

  covergroup cg @(posedge clk);
    coverpoint v_a
	{
      bins sa = (4 => 5 => 6), ([7:9],10=>11,12);
	  bins sb[] = (4=> 5 => 6), ([7:9],10=>11,12);
	  bins sc = (12 => 3 [-> 1]);
	  bins allother = default sequence ;
    }
  endgroup

  covergroup sg @(posedge clk);
    coverpoint v
    {
      bins b2 = ( 2 [-> 3:5] );           // 3 to 5 nonconsecutive 2's
	  bins b3 = ( 3 [-> 3:5] );           // 3 to 5 nonconsecutive 3's
	  bins b5 = ( 5 [* 3] );              // 3 consecutive 5's
	  bins b6 = ( 1 => 3 [-> 4:6] => 1);  // 1 followed by
	                                      // 4 to 6 goto nonconsecutive 3's
										  // followed immediately by a 1
      bins b7 = ( 1 => 2 [=  3:6] => 5);  // 1 followed by
	                                      // 3 to 6 non consecutive 2's
										  // followed sometime later by a 5
	}
  endgroup

endmodule : sv12_lrm_p0529_bit_v_a

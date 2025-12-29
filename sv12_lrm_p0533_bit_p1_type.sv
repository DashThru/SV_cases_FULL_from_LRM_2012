////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        533
// Description: covergroup bin value resolution
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0533_bit_p1_type;

  bit [2:0] p1;         // type expresses values in the range 0 to 7
  bit signed [2:0] p2;  // type expresses values in the range -4 to 3
  bit clk;

  covergroup g1 @(posedge clk);
    coverpoint p1 {
      bins b1 = { 1, [2:5], [6:10] };
	  bins b2 = { -1, [1:10], 15 };
    }
    coverpoint p2 {
      bins b3 = {1, [2:5], [6:10] };
      bins b4 = { -1, [1:10], 15 };
    }
  endgroup

endmodule : sv12_lrm_p0533_bit_p1_type

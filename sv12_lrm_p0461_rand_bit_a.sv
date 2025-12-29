////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        461
// Description: checker variable assignments
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0461_rand_bit_a;
  
  checker check1(bit a, b, event clk);
    rand bit m = 1'b0, n;
    rand bit x, y, z;
    bit v;
    bit w = 1'b0; // OK  
    rand bit k;

    always_ff @clk k <= !k;
    always_ff @clk
	  z <= a & b;
  endchecker : check1

endmodule : sv12_lrm_p0461_rand_bit_a

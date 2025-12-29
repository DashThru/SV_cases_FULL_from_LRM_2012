////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        538
// Description: cross bin with covergroup expressions
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0538_logic_a_b;

  logic [0:7] a, b;
  parameter [0:7] mask = 32;
  covergroup cg;
    coverpoint a
    {
      bins low[] = {[0:127]};
	  bins high = {[128:255]};
    }
	coverpoint b
	{
      bins two[] = b with (item % 2 == 0);
      bins three[] = b with (item % 3 == 0);
	}
    X: cross a,b
	{
      bins apple = X with (a+b < 257) matches 127;
	  bins cherry = ( binsof(b) intersect {[0:50]}
                    && binsof(a.low) intersect {[0:50]}) with (a==b);
      bins plum = binsof(b.two) with (b > 12)
	              || binsof(a.low) with (a & b & mask);
    }
  endgroup

endmodule : sv12_lrm_p0538_logic_a_b

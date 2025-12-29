////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        361
// Description: sampled value functions
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0361_logic_a_b;

  logic a, b, clk;

  a1_bad: assert property (@clk a == b)
     else $error("Different values: a = %b, b = %b", a, b);
  a2_ok: assert property (@clk a == b)
     else $error("Different values: a = %b, b = %b",
	    $sampled(a), $sampled(b));

endmodule : sv12_lrm_p0361_logic_a_b

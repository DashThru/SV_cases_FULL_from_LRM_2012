////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        207
// Description: force and release procedural statements
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0207_module_test;
  logic a, b, c, d;
  wire e;
  and and1 (e, a, b, c);
  initial begin
    $monitor("%d d=%b,e=%b", $stime, d, e);
	assign d = a & b & c;
	a = 1;
	b = 0;
	c = 1;
	#10;
	force d = (a | b | c);
	force e = (a | b | c); #10;
	release d;
	release e;
	#10 $finish;
  end
endmodule
//    Results:
//        0 d=0,e=0
//       10 d=1,e=1
//       20 d=0,e=0


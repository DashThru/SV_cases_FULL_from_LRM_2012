////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        683
// Description: nested module instance
// Note:        
//
////////////////////////////////////////////////////////////////

module dff_flat(input d, ck, pr, clr, output q, nq);
  wire q1, nq1, q2, nq2;
  nand g1b (nq1, d, clr, q1);
  nand g1a (q1, ck, nq2, nq1);
  nand g2b (nq2, ck, clr, q2);
  nand g2a (q2, nq1, pr, nq2);
  nand g3a (q, nq2, clr, nq);
  nand g3b (nq, q1, pr, q);
endmodule

module dff_nested(input d, ck, pr, clr, output q, nq);
  wire q1, nq1, nq2;
  module ff1;
    nand g1b (nq1, d, clr, q1);
	nand g1a (q1, ck, nq2, nq1);
  endmodule
  ff1 i1();
  module ff2;
    wire q2; // This wire can be encapsulated in ff2
    nand g2b (nq2, ck, clr, q2);
    nand g2a (q2, nq1, pr, nq2);
  endmodule
  ff2 i2();
  module ff3;
    nand g3a (q, nq2, clr, nq);
	nand g3b (nq, q1, pr, q);
  endmodule
  ff3 i3();
endmodule

module part1();
  module and2(input a, b, output z); 
  endmodule
  module or2(input a, b, output z); 
  endmodule
  and2 u1(), u2(), u3(); 
endmodule

module sv12_lrm_p0683_module_dut2_inout;
  dff_flat dff_flat();
  dff_nested dff_nested();
  part1 part1();
endmodule : sv12_lrm_p0683_module_dut2_inout

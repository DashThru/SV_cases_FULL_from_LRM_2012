////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        535
// Description: defining cross coverage
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0535_bit_a_b;

  bit clk;
  bit [3:0] x, y;
  covergroup cov @(posedge clk);
    xXy : cross x, y;
  endgroup

  bit [3:0] a, b, c;
  covergroup cov2 @(posedge clk);
    BC: coverpoint b+c;
    aXb : cross a, BC;
  endgroup

  bit [31:0] a_var;
  bit [3:0] b_var;
  covergroup cov3 @(posedge clk);
    A: coverpoint a_var { bins yy[] = { [0:9] }; }
	CC: cross b_var, A;
  endgroup

endmodule : sv12_lrm_p0535_bit_a_b

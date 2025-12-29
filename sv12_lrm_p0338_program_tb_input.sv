////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        338
// Description: deferred assertions outside procedural code
// Note:        
//
////////////////////////////////////////////////////////////////

module dut(input logic clk, input logic a, input logic b);
  logic c;
  always_ff @(posedge clk)
    c <= b;
  a1: assert #0 (!(a & c)) $display("Pass"); else $display("Fail");
  a2: assert final (!(a & c)) $display("Pass"); else $display("Fail");
endmodule

program tb(input logic clk, output logic a, output logic b);
  default clocking m @(posedge clk);
    default input #0;
	default output #0;
	output a;
	output b;
  endclocking
  initial begin
	a = 1;
	b = 0;
	##10;
	b = 1;
	##1;
	a = 0;
  end
endprogram

module m (input a, b);
  a1: assert #0 (a == b);
endmodule

module n (input a, b);
  always_comb begin
    a1: assert #0 (a == b);
  end
endmodule

module sv12_lrm_p0338_program_tb_input;
  logic clk;
  logic a, b;
  dut dut (.*);
  tb tb (.*);

  m um(a,b);
  n un(a,b);
endmodule



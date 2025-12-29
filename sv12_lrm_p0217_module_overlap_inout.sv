////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        217
// Description: net aliasing syntax
// Note:        
//
////////////////////////////////////////////////////////////////

module byte_swap (inout wire [31:0] A, inout wire [31:0] B);
  alias {A[7:0],A[15:8],A[23:16],A[31:24]} = B;
endmodule

module byte_rip (inout wire [31:0] W, inout wire [7:0] LSB, MSB);
  alias W[7:0] = LSB;
  alias W[31:24] = MSB;
endmodule

module overlap_A(inout wire [15:0] bus16, inout wire [11:0] low12, high12);
  alias bus16[11:0] = low12;
  alias bus16[15:4] = high12;
endmodule

module overlap_B(inout wire [15:0] bus16, inout wire [11:0] low12, high12);
  alias bus16 = {high12, low12[3:0]};
  alias high12[7:0] = low12[11:4];
endmodule

  
module lib1_dff(Reset, Clk, Data, Q, Q_Bar);
  input Reset,Clk,Data;
  output Q,Q_Bar;
endmodule

module lib2_dff(reset, clock, data, q, qbar);
  input reset,clock,data;
  output q,qbar;
endmodule

module lib3_dff(RST, CLK, D, Q, Q_);
  input RST,CLK,D;
  output Q,Q_;
endmodule

module my_dff(rst, clk, d, q, q_bar); // wrapper cell
  input rst, clk, d;
  output q, q_bar;
  alias rst = Reset = reset = RST;
  alias clk = Clk = clock = CLK;
  alias d = Data = data = D;
  alias q = Q;
  alias Q_ = q_bar = Q_Bar = qbar;
  lib1_dff my_dff1 (.*); // LIB_DFF is any of lib1_dff, lib2_dff or lib3_dff
  lib2_dff my_dff2 (.*); // LIB_DFF is any of lib1_dff, lib2_dff or lib3_dff
  lib3_dff my_dff3 (.*); // LIB_DFF is any of lib1_dff, lib2_dff or lib3_dff
endmodule

module sv12_lrm_p0217_module_overlap_inout;
  byte_swap byte_swap();
  byte_rip byte_rip();
  overlap_A overlap_A();
  overlap_B overlap_B();
  my_dff my_dff();
endmodule : sv12_lrm_p0217_module_overlap_inout

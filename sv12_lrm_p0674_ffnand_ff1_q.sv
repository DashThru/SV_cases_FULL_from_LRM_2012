////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        674
// Description: module instantiation syntax
// Note:        Typo fix in line 42
//
////////////////////////////////////////////////////////////////

parameter logic [7:0] My_DataIn = 8'hFF;

module alu (
  output reg [7:0] alu_out,
  output reg zero,
  input [7:0] ain, bin,
  input [2:0] opcode);
// RTL code for the alu module
endmodule

module accum (
  output reg [7:0] dataout,
  input [7:0] datain = My_DataIn,
  input clk, rst_n = 1'b1);
// RTL code for the accumulator module
endmodule

module xtend (
  output reg [7:0] dout,
  input din,
  input clk, rst = 1'b0 );
// RTL code for the sign-extension module
endmodule

module ffnand(output q,qbar, input clear,preset);
endmodule

module sv12_lrm_p0674_ffnand_ff1_q;

 bit in1,in2,out1,out2,out3;

 ffnand ff1 (.q(), .qbar(out1), .clear(in1), .preset(in2)),
        ff2 (.q(), .qbar(out2), .clear(in2), .preset(in1)),
        ff3 (.q(out3), .qbar(), .clear(in1), .preset(in2));


endmodule : sv12_lrm_p0674_ffnand_ff1_q

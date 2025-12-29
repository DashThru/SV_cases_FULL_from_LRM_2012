////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        675
// Description: Connecting module instance ports
// Note:        
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

module alu_accum1 (
  output [15:0] dataout,
  input [7:0] ain, bin,
  input [2:0] opcode,
  input clk, rst_n, rst
);
  wire [7:0] alu_out;
  alu alu (alu_out, , ain, bin, opcode); // zero output is unconnected
  accum accum (dataout[7:0], alu_out, clk, rst_n);
  xtend xtend (dataout[15:8], alu_out[7], clk);  // rst gets default
                                                 // value 1'b0
endmodule

module alu_accum2 (
  output [15:0] dataout,
  input [7:0] ain, bin,
  input [2:0] opcode,
  input clk, rst_n, rst
);
  wire [7:0] alu_out;
  alu alu (.alu_out(alu_out), .zero(),
           .ain(ain), .bin(bin), .opcode(opcode));
    // zero output is unconnected
  accum accum (.dataout(dataout[7:0]), .datain(alu_out), .clk(clk));
    // rst_n is not in the port list and so gets default value 1'b1
  xtend xtend (.dout(dataout[15:8]), .din(alu_out[7]), .clk(clk), .rst() );
    // rst has a default value, but has an empty port connection,
    // therefore it is left unconnected
endmodule

module alu_accum3 (
  output [15:0] dataout,
  input [7:0] ain, bin,
  input [2:0] opcode,
  input clk, rst_n
);
  wire [7:0] alu_out;
  alu alu (.alu_out, .zero(), .ain, .bin, .opcode);
  accum accum (.dataout(dataout[7:0]), .datain(alu_out), .clk, .rst_n());
  xtend xtend (.dout(dataout[15:8]), .din(alu_out[7]), .clk, .rst(!rst_n));
endmodule

module alu_accum4 (
  output [15:0] dataout,
  input [7:0] ain, bin,
  input [2:0] opcode,
  input clk
);
  wire [7:0] alu_out;
  alu alu (.*, .zero());
  accum accum (.*, .dataout(dataout[7:0]), .datain(alu_out));
  xtend xtend (.*, .dout(dataout[15:8]), .din(alu_out[7]));
endmodule

module alu_accum5 (
  output [15:0] dataout,
  input [7:0] ain, bin,
  input [2:0] opcode,
  input clk, rst_n);
  wire [7:0] alu_out;
  // mixture of named port connections and
  // implicit .name port connections
  alu  alu  (.ain(ain), .bin(bin), .alu_out, .zero(), .opcode);
  // positional port connections
  accum  accum  (dataout[7:0], alu_out, clk, rst_n);
  // mixture of named port connections and implicit .* port connections
  xtend  xtend  (.dout(dataout[15:8]), .*, .din(alu_out[7]));
endmodule

module sv12_lrm_p0675_module_alu_accum1;
  alu_accum1 alu_accum1();
  alu_accum2 alu_accum2();
  alu_accum3 alu_accum3();
  alu_accum4 alu_accum4();
  alu_accum5 alu_accum5();
endmodule : sv12_lrm_p0675_module_alu_accum1

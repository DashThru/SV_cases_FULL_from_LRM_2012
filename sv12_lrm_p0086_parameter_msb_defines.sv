////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        86
// Description: parameter values
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0086_parameter_msb_defines;

  parameter msb = 7;       // defines msb as a constant value 7
  parameter e = 25, f = 9; // defines two constant numbers
  parameter r = 5.7;       // declares r as a real parameter
  parameter byte_size = 8,
            byte_mask = byte_size - 1;
  parameter average_delay = (r + f) / 2;

  parameter signed [3:0] mux_selector = 0;
  parameter real r1 = 3.5e17;
  parameter p1 = 13'h7e;
  parameter [31:0] dec_const = 1'b1;  // value converted to 32 bits
  parameter newconst1 = 3'h4;          // implied range of [2:0]
  parameter newconst2 = 4;             // implied range of at least [31:0]

  parameter logic [31:0] P1 [3:0] = '{ 1, 2, 3, 4 } ; // unpacked array
  initial begin if ( P1[2][7:0] ) ; end // use part-select of individual element of the array

  wire clk,a,b,c,d;
  parameter r2 = $;
  property inq1(r1,r2);
    @(posedge clk) a ##[r1:r2] b ##1 c |=> d;
  endproperty
  assert property (inq1(3,4));

endmodule : sv12_lrm_p0086_parameter_msb_defines

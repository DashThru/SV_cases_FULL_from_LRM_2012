////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        247
// Description: longest static prefix
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0247_localparam_p;
  localparam p = 4;
  reg [7:0] m [5:1][5:1];
  reg [7:0] o;
  integer i;
  logic [15:0] a, b;  // 16-bit variables
  logic [15:0] sumA;  // 16-bit variable
  logic [16:0] sumB;  // 17-bit variable

  initial begin

    o = m[1][i]  ;// longest static prefix is m[1]
    o = m[p][1]  ;// longest static prefix is m[p][1]
    o = m[i][1]  ;// longest static prefix is m

    sumA = a + b;  // expression evaluates using 16 bits
    sumB = a + b;  // expression evaluates using 17 bits
  end
endmodule : sv12_lrm_p0247_localparam_p

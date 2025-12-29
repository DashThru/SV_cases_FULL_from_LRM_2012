////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        208
// Description: assignment extension and truncation
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0208_logic_a;

  logic [5:0] a;
  logic signed [4:0] b;
  initial begin
    a = 8'hff;  // After the assignment, a = 6'h3f
    b = 8'hff;  // After the assignment, b = 5'h1f
  end

  logic [0:5] a1;
  logic signed [0:4] b1, c1;
  initial begin
    a1 = 8'sh8f;  // After the assignment, a = 6'h0f
    b1 = 8'sh8f;  // After the assignment, b = 5'h0f
    c1 = -113;    // After the assignment, c = 15
  end            // 1000_1111 = (-'h71 = -113) truncates to ('h0F = 15)

  logic [7:0] a2;
  logic signed [7:0] b2;
  logic signed [5:0] c2, d2;
  initial begin
    a2 = 8'hff;
    c2 = a;     // After the assignment, c = 6'h3f
    b2 = -113;
    d2 = b;     // After the assignment, d = 6'h0f
  end

endmodule : sv12_lrm_p0208_logic_a

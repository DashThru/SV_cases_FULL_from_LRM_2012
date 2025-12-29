////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        97
// Description: cast operator
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0097_x;
  logic [6:0] x=7'd10;
  int v;
  parameter P = 16;

  logic [7:0] regA;
  logic signed [7:0] regS;
  

  initial begin
    v = 17'(x - 2);
    v = (P+1)'(x - 2);
    v = signed'(x);
  
    regA = unsigned'(-4);     // regA = 8'b11111100
    regS = signed'(4'b1100);  // regS = -4

    v = const'(x);
  end
endmodule : sv12_lrm_p0097_x

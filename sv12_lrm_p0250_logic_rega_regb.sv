////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        250
// Description: signed expressions
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0250_logic_rega_regb;
  logic [7:0] regA, regB;
  logic signed [7:0] regS;
  
  logic [15:0] a;
  logic signed [7:0] b;

  initial begin

    regA = $unsigned(-4);       // regA = 8'b11111100
    regB = $unsigned(-4'sd4);   // regB = 8'b00001100
    regS = $signed  (4'b1100);  // regS = -4
    
    regA = unsigned'(-4);       // regA = 8'b11111100
    regS = signed'(4'b1100);    // regS = -4
    
    regS = regA + regB;                    // will do unsigned addition
    regS = byte'(regA) + byte'(regB);      // will do signed addition
    regS = signed'(regA) + signed'(regB);  // will do signed addition
    regS = $signed(regA) + $signed(regB);  // will do signed addition

    a = b[7:0]; // b[7:0] is unsigned and therefore zero-extended
  end
endmodule : sv12_lrm_p0250_logic_rega_regb

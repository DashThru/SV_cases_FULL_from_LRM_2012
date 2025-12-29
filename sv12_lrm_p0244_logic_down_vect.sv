////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        244
// Description: vector bit-select and part-select addressing
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0244_logic_down_vect;

  logic [15:0] down_vect;
  logic [0:15] up_vect;

  logic [31: 0] a_vect;
  logic [0 :31] b_vect;
  logic [63: 0] dword;
  integer sel;
  logic [7:0] out;

  parameter lsb_base_expr = 10;
  parameter msb_base_expr = 10;
  parameter width_expr = 6;
 
  
  initial begin
    sel = 1'b1 - 2'b00 + (1'b1 + 1'b1);
  
    out = down_vect[lsb_base_expr +: width_expr];
    out = up_vect[msb_base_expr +: width_expr];
    
    out = down_vect[msb_base_expr -: width_expr];
    out = up_vect[lsb_base_expr -: width_expr];

    out = a_vect[ 0 +: 8]    ;// == a_vect[ 7 : 0]
    out = a_vect[15 -: 8]    ;// == a_vect[15 : 8]
    out = b_vect[ 0 +: 8]    ;// == b_vect[0 : 7]
    out = b_vect[15 -: 8]    ;// == b_vect[8 :15]
    out = dword[8*sel +: 8]  ;// variable part-select with fixed width
  end
endmodule : sv12_lrm_p0244_logic_down_vect

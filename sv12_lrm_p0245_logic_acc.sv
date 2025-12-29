////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        245
// Description: array and memory addressing
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0245_logic_acc;
  logic [15:0] acc1;
  logic [2:17] acc2;
  logic [7:0] vect;
  
  logic [7:0] mem_name[0:1023];
  logic [7:0] twod_array[0:255][0:255];
  wire threed_array[0:255][0:255][0:7];
  int sel=7;
  logic [7:0] o;

  initial begin
    vect = 4;  // fills vect with the pattern 00000100
               // msb is bit 7, lsb is bit 0

    o = twod_array[14][1][3:0]  ;  // access lower 4 bits of word
    o = twod_array[1][3][6]     ;  // access bit 6 of word
    o = twod_array[1][3][sel]   ;  // use variable bit-select

  end

endmodule : sv12_lrm_p0245_logic_acc

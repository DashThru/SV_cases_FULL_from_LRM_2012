////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        110
// Description: int array array
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0110_int_array_array;

  int Array1 [0:7][0:31];  // array declaration using ranges
  int Array2 [8][32];      // array declaration using sizes

  logic [7:0] mema [0:255];  // declares a memory array of 256 8-bit elements. The array indices are 0 to 255
  logic [7:0] data;
  parameter addr = 32;

  initial begin
    mema[5] = 0; // Write to word at address 5
    data = mema[addr]; // Read word at address indexed by addr
  end
endmodule : sv12_lrm_p0110_int_array_array

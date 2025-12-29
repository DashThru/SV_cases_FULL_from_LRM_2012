////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        132
// Description: array reduction methods
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0132_byte_b;

  int y;
  byte b[] = { 1, 2, 3, 4 };
  logic [7:0] m [2][2] = '{ '{5, 10}, '{15, 20} };
  logic bit_arr [1024];

  initial begin
  y = b.sum ;            // y becomes 10 => 1 + 2 + 3 + 4
  y = b.product ;        // y becomes 24 => 1 * 2 * 3 * 4
  y = b.xor with (item+4); // y becomes 12 => 5 ^ 6 ^ 7 ^ 8
  y = m.sum with (item.sum with (item)); // y becomes 50 => 5+10+15+20
  y = bit_arr.sum with ( int'(item) );   // forces result to be 32-bit
  end

endmodule : sv12_lrm_p0132_byte_b

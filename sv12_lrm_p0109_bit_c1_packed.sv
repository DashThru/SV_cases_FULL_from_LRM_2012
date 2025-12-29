////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        109
// Description: packed and unpacked arrays 
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0109_bit_c1_packed;

  bit [7:0] c1;  // packed array of scalar bit types
  real u [7:0];  // unpacked array of real types

  byte c2;     // same as bit signed [7:0] c2;
  integer i1;  // same as logic signed [31:0] i1;

endmodule : sv12_lrm_p0109_bit_c1_packed

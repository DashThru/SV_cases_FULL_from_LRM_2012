////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        240
// Description: re-ordering of the generic stream 
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0240_int_j_a;
  int j = { "A", "B", "C", "D" };
  initial begin
    j = { >> {j}}                     ; // generates stream "A" "B" "C" "D"
    j = { << byte {j}}                ; // generates stream "D" "C" "B" "A" (little endian)
    j = { << 16 {j}}                  ; // generates stream "C" "D" "A" "B"
    j = { << { 8'b0011_0101 }}        ; // generates stream 'b1010_1100 (bit reverse)
    j = { << 4 { 6'b11_0101 }}        ; // generates stream 'b0101_11
    j = { >> 4 { 6'b11_0101 }}        ; // generates stream 'b1101_01 (same)
    j = { << 2 { { << { 4'b1101 }} }} ; // generates stream 'b1110
  end
endmodule : sv12_lrm_p0240_int_j_a

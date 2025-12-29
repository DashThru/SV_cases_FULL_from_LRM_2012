////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        236
// Description: replication operator
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0236_byte_a_b;
  byte a, b,w;
  bit [1:0] c ;

  logic [63:0] x,y,z;

  parameter P = 32;
  // The following is legal for all P from 1 to 32
  assign z[31:0] = { {32-P{1'b1}}, x[P-1:0] } ;

  initial begin
    c = {a + b}[1:0]; // 2 lsb's of sum of a and b
    c = {4{w}} ; // yields the same value as {w, w, w, w}
    c = {b, {3{a, b}}};

  end
endmodule : sv12_lrm_p0236_byte_a_b

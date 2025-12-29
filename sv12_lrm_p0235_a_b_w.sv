////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        235
// Description: concatenation operators
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0235_a_b_w;

  logic [7:0] a,b,w;
  logic [31:0] z;
  logic log1, log2, log3;

  initial begin
    z = {a, b[3:0], w, 3'b101} ; // equivalent to the following 
    z = {a, b[3], b[2], b[1], b[0], w, 1'b1, 1'b0, 1'b1};
  
    {log1, log2, log3} = 3'b111;
    {log1, log2, log3} = {1'b1, 1'b1, 1'b1}; // same effect as 3'b111
  end
endmodule : sv12_lrm_p0235_a_b_w

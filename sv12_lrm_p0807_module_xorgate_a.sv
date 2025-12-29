////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        807
// Description: simple state-dependent paths
// Note:        
//
////////////////////////////////////////////////////////////////

module XORgate (a, b, out); 
  input a, b;
  output out;
  xor x1 (out, a, b);
  specify
    specparam noninvrise = 1, noninvfall = 2; 
    specparam invertrise = 3, invertfall = 4;
    if (a) (b => out) = (invertrise, invertfall); 
    if (b) (a => out) = (invertrise, invertfall); 
    if (~a)(b => out) = (noninvrise, noninvfall); 
    if (~b)(a => out) = (noninvrise, noninvfall);
  endspecify
endmodule

module sv12_lrm_p0807_module_xorgate_a;
  logic a, b, out;
  XORgate XORgate(.*);
endmodule : sv12_lrm_p0807_module_xorgate_a

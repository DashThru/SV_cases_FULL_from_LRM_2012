////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        798
// Description: instantiates a sequential UDP
// Note:        
//
////////////////////////////////////////////////////////////////

primitive dff1 (q, clk, d); 
  input clk, d;
  output q; reg q;
  initial q = 1'b1;
  table
  // clk d   q   q+ 
      r  0 : ? : 0 ; 
      r  1 : ? : 1 ; 
      f  ? : ? : - ; 
      ?  * : ? : - ;
  endtable
endprimitive

module dff (q, qb, clk, d); 
  input clk, d;
  output q, qb;
  dff1 g1 (qi, clk, d); 
  buf #3 g2 (q, qi);
  not #5 g3 (qb, qi); 
endmodule

module sv12_lrm_p0798_primitive_dff1_q;
  wire q, qb, clk, d;
  dff dff(.*);
endmodule : sv12_lrm_p0798_primitive_dff1_q

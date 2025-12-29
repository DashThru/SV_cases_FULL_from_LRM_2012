////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        797
// Description: sequential UDP initialization
// Note:        
//
////////////////////////////////////////////////////////////////

primitive srff (q, s, r); 
  output q; reg q;
  input s, r;
  initial q = 1'b1; 
  table
  // s r   q   q+ 
     1 0 : ? : 1 ; 
	 f 0 : 1 : - ; 
	 0 r : ? : 0 ; 
	 0 f : 0 : - ;
	 1 1 : ? : 0 ;
  endtable
endprimitive

module sv12_lrm_p0797_primitive_srff_q;

  logic q, s, r;
  srff srff(q, s, r);

endmodule : sv12_lrm_p0797_primitive_srff_q

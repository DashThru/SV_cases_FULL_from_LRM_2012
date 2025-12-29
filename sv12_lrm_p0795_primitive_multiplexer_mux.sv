////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        795
// Description: combinational user define primitive
// Note:        
//
////////////////////////////////////////////////////////////////

primitive multiplexer1 (mux, control, dataA, dataB); 
  output mux;
  input control, dataA, dataB; 
  table
  // control dataA dataB mux
        0 1 0 : 1 ; 
		0 1 1 : 1 ; 
		0 1 x : 1 ; 
		0 0 0 : 0 ; 
		0 0 1 : 0 ; 
		0 0 x : 0 ; 
		1 0 1 : 1 ; 
		1 1 1 : 1 ; 
		1 x 1 : 1 ; 
		1 0 0 : 0 ; 
		1 1 0 : 0 ; 
		1 x 0 : 0 ; 
		x 0 0 : 0 ; 
		x 1 1 : 1 ;
  endtable
endprimitive

primitive multiplexer2 (mux, control, dataA, dataB); 
  output mux;
  input control, dataA, dataB; 
  table
  // control dataA dataB mux
        0 1 ? : 1 ; // ? = 0 1 x 
		0 0 ? : 0 ; 
		1 ? 1 : 1 ; 
		1 ? 0 : 0 ;
		x 0 0 : 0 ;
		x 1 1 : 1 ;
  endtable
endprimitive

module sv12_lrm_p0795_primitive_multiplexer_mux;
  wire mux, control, dataA, dataB;

  multiplexer1 multiplexer1(mux, control, dataA, dataB);
  multiplexer2 multiplexer2(mux, control, dataA, dataB);  
endmodule : sv12_lrm_p0795_primitive_multiplexer_mux

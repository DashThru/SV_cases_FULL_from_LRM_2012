////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        41
// Description: string literal and array initialization examples
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0041_string_literals;

  byte c1 = "A" ;
  bit [7:0] d = "\n" ;

  bit [8*12:1] stringvar = "Hello world\n";
  
  bit [0:11] [7:0] stringvar2 = "Hello world\n" ;
  
  byte c3 [0:12] = "hello world\n" ;

endmodule : sv12_lrm_p0041_string_literals


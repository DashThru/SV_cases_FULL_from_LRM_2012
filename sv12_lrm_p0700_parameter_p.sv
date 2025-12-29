////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        700
// Description: parameter dependence
// Note:        
//
////////////////////////////////////////////////////////////////

parameter
  word_size = 32,
  memory_size = word_size * 4096;


parameter p = 1; 
parameter [p:0] p2 = 4; 
parameter type T = int; 
parameter T p3 = 7;

class C ;
endclass

module M #( type T = C, T p = 4, 
            type T2, T2 p2 = 4
) () ;
endmodule

module sv12_lrm_p0700_parameter_p;
  M #(.T(int),.T2(int)) M();
endmodule : sv12_lrm_p0700_parameter_p

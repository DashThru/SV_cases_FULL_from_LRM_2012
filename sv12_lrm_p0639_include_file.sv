////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        639
// Description: include file compiler directive
// Note:        
//
////////////////////////////////////////////////////////////////

`include "sv12_lrm_p0012_mux2to1.sv"
`include <sv12_lrm_p0012_program_test.sv>

module sv12_lrm_p0639_include_file;
   
   sv12_lrm_p0012_mux2to1 sv12_lrm_p0012_mux2to1();
   sv12_lrm_p0012_program_test_p p_inst();

endmodule : sv12_lrm_p0639_include_file

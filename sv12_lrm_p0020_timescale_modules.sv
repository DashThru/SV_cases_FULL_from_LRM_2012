////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        20
// Description: timescale and module declarations
// Note:        
//
////////////////////////////////////////////////////////////////

`timescale 1ns / 10ps
module A ();
endmodule
module B (); 
endmodule
`timescale 1ps/1ps
module C ();
endmodule

module sv12_lrm_p0020_timescale_modules;
  A a_inst();
  B b_inst();
  C c_inst();
endmodule : sv12_lrm_p0020_timescale_modules


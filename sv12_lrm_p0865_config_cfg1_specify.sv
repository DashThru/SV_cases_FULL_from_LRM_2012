////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        865
// Description: configuring the contents of a design
// Note:        
//
////////////////////////////////////////////////////////////////

config cfg1; // specify rtl adder for top.a1, gate-level adder for top.a2 
  design rtlLib.top;
  default liblist rtlLib;
  instance top.a2 liblist gateLib;
endconfig

module sv12_lrm_p0865_config_cfg1_specify;
endmodule : sv12_lrm_p0865_config_cfg1_specify

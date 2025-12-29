////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        877
// Description: using hierarchical config
// Note:        
//
////////////////////////////////////////////////////////////////

config cfg5;
  design aLib.adder;
  default liblist gateLib aLib; 
  instance adder.f1 liblist rtlLib;
endconfig

config cfg6;
  design rtlLib.top;
  default liblist aLib rtlLib; 
  instance top.a2 use work.cfg5:config ;
endconfig

module sv12_lrm_p0877_config_cfg5;
endmodule : sv12_lrm_p0877_config_cfg5

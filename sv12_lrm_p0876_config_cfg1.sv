////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        876
// Description: default configuration from library map file
// Note:        Typo fix in line 26
//
////////////////////////////////////////////////////////////////

config cfg1;
  design rtlLib.top ;
  default liblist aLib rtlLib;
endconfig

config cfg2;
  design rtlLib.top ;
  default liblist gateLib aLib rtlLib;
endconfig

config cfg3;
  design rtlLib.top ;
  default liblist aLib rtlLib;
  cell m use gateLib.m ; 
endconfig

config cfg4;
  design rtlLib.top ;
  default liblist gateLib rtlLib; 
  instance top.a2 liblist aLib;
endconfig

module sv12_lrm_p0876_config_cfg1;
endmodule : sv12_lrm_p0876_config_cfg1

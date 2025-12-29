////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        871
// Description: hierarchical configurations
// Note:        
//
////////////////////////////////////////////////////////////////

config bot;
  design lib1.bot;
  default liblist lib1 lib2; 
  instance bot.a1 liblist lib3;
endconfig

config top;
  design lib1.top;
  default liblist lib2 lib1;
  instance top.bot use lib1.bot:config;
endconfig

module sv12_lrm_p0871_config_bot;
endmodule : sv12_lrm_p0871_config_bot

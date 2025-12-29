////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        818
// Description: specify block control of pulse limit values
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0818_specify(input clk,clr,pre,data, output q);

  specify
    (clk => q) = 12;
    (data => q) = 10;
    (clr, pre *> q) = 4;
    specparam
          PATHPULSE$clk$q = (2,9), 
	  PATHPULSE$clr$q = (0,4), 
	  PATHPULSE$ = 3;
  endspecify

endmodule : sv12_lrm_p0818_specify

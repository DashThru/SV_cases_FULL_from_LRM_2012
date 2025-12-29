////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        649
// Description: timescale ns ps directive
// Note:        
//
////////////////////////////////////////////////////////////////

`timescale 1 ns / 1 ps

`timescale 10 us / 100 ns

`timescale 10 ns / 1 ns

module sv12_lrm_p0649_timescale_ns_ps;
  logic set;
  parameter d = 1.55;
  initial begin
    #d set = 0;
    #d set = 1;
  end
endmodule : sv12_lrm_p0649_timescale_ns_ps



////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        558
// Description: timescale system tasks
// Note:        
//
////////////////////////////////////////////////////////////////

`timescale 1 ms / 1 us
module a_dat;
  initial $printtimescale(u_b_dat.c1);
endmodule
	
`timescale 10 fs / 1 fs
module b_dat;
  c_dat c1 ();
endmodule

`timescale 1 ns / 1 ns
module c_dat;
endmodule

module sv12_lrm_p0558_timescale_ms_us;
  a_dat u_a_dat();
  b_dat u_b_dat();
  c_dat u_c_dat();
endmodule : sv12_lrm_p0558_timescale_ms_us

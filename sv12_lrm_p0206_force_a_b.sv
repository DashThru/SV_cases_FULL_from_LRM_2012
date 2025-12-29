////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        206
// Description: assign and deassign procedural statements
// Note:        
//
////////////////////////////////////////////////////////////////

module dff (q, d, clear, preset, clock);
  output q;
  input d, clear, preset, clock;
  logic q;
  always @(clear or preset)
    if (!clear)
      assign q = 0;
	else if (!preset)
      assign q = 1;
	else
      deassign q;
  always @(posedge clock)
    q = d;
endmodule

module sv12_lrm_p0206_force_a_b;
  logic q, d, clear, preset, clock;

  dff u_dff (q, d, clear, preset, clock);
  initial force d = 1'b0 ;
  
endmodule : sv12_lrm_p0206_force_a_b

////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        45
// Description: optimize power attribute
// Note:        
//
////////////////////////////////////////////////////////////////

(* optimize_power *)
module mod1 ();
endmodule
 
(* optimize_power=1 *)
module mod2 ();
endmodule
  
module sv12_lrm_p0045_optimize_power;
   mod1 u_mod1();
   mod2 u_mod2();
   (* optimize_power=0 *) mod1 synth1();

  (* fsm_state *) logic [7:0] state1;
  (* fsm_state=1 *) logic [3:0] state2, state3;
  logic [3:0] reg1; // reg1 does NOT have fsm_state set
  (* fsm_state=0 *) logic [3:0] reg2; // nor does reg2
  logic o[3:0],b,c,d;

  function add(a,b);
  endfunction

  assign o[0] = b + (* mode = "cla" *) c;  // sets the value for the attribute mode to be the string cla.
								 
  assign o[1] = add (* mode = "cla" *) (b, c);
  
  assign o[2] = b ? (* no_glitch *) c : d;

endmodule : sv12_lrm_p0045_optimize_power

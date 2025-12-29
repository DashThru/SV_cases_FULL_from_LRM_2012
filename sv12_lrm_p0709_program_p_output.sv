////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        709
// Description: blocking tasks in cycle/event mode
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0709_program_p_output;
  logic a,b;
  task T;
    S1: a = b; // executes in reactive region set if called from a program 
	#5;
    S2: b <= 1'b1; // executes in reactive region set if called from a program
  endtask
endmodule


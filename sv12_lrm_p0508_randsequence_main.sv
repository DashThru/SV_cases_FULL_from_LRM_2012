////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        508
// Description: random sequence generation randsequence
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0508_randsequence_main;

  initial 
  randsequence( main )
        main : first second done ;
	first : add | dec ;
	second : pop | push ;
	done : { $display("done"); };
	add : { $display("add"); };
	dec : { $display("dec"); };
	pop : { $display("pop"); };
	push : { $display("push"); };
  endsequence

endmodule : sv12_lrm_p0508_randsequence_main

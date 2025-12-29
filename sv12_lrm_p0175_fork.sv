////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        175
// Description: parallel block statement syntax
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0175_fork;

  parameter d = 50; // d declared as a parameter and
  logic [7:0] r;    // r declared as an 8-bit variable

  initial fork
    #50 r = 'h35;
    #100 r = 'hE2;
    #150 r = 'h00;
    #200 r = 'hF7;
  join

  initial fork
    begin
	#50 r = 'h35; // one process with 2 statements
	#50 r = 'h56; 
    end
  join

endmodule : sv12_lrm_p0175_fork

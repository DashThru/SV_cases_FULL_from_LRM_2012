////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        504
// Description: random thread stability
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0504_integer_x_y;

  integer x, y, z;

  initial fork       //set a seed at the start of a thread
    begin process::self.srandom(100); x = $urandom; end
	         //set a seed during a thread
    begin y = $urandom; process::self.srandom(200); end
	         // draw 2 values from the thread RNG
    begin z = $urandom + $urandom ; end
  join

endmodule : sv12_lrm_p0504_integer_x_y

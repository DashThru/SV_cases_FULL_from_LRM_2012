////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        197
// Description: assignment statement
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0197_ns_r_a;

  logic sum,a,b,r;

  initial begin
    #1ns r = a;
    r = #1ns a;
    r <= #1ns a;
  end

  assign #2.5ns sum = a + b;
  
  wire enable;
  wire (strong1, pull0) mynet = enable;

endmodule : sv12_lrm_p0197_ns_r_a

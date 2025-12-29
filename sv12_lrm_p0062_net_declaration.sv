////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        62
// Description: net declaration
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0062_net_declaration;

  trireg (large) logic #(0,0,0) cap1;
  typedef logic [31:0] addressT;
  wire addressT w1;
  wire struct packed { logic ecc; logic [7:0] data; } memsig;

  wire w; // equivalent to "wire logic w;"
  wire [15:0] ww; // equivalent to "wire logic [15:0] ww;"

endmodule : sv12_lrm_p0062_net_declaration

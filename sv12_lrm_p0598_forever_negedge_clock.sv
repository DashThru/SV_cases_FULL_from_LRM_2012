////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        598
// Description: strobed monitoring display
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0598_forever_negedge_clock;

  logic data;

  initial begin
    $strobe ("At time %d, data is %h",$time,data);
  end

endmodule : sv12_lrm_p0598_forever_negedge_clock

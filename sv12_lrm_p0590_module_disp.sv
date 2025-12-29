////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        590
// Description: escape sequences for special characters
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0590_module_disp;
  initial begin
    $display("\\\t\\\n\"\123");
  end
endmodule : sv12_lrm_p0590_module_disp



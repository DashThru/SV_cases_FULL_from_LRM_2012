////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        587
// Description: system call function $system
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0587_module_top;

  initial begin 
    $system("touch haha");
    $system("ls haha");
  end

endmodule : sv12_lrm_p0587_module_top



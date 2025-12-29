////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        173
// Description: final procedures
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0173_final;

int period=10,PC=5;

final
  begin
    $display("Number of cycles executed %d",$time/period);
    $display("Final PC = %h",PC);
  end

endmodule : sv12_lrm_p0173_final

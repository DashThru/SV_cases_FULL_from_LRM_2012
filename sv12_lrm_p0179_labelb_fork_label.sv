////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        179
// Description: labelb statement labels
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0179_labelb_fork_label;
  initial   
  labelB: fork // label before the begin or fork ...
  join_none : labelB

  initial   
  labelC: begin 
  end : labelC
endmodule : sv12_lrm_p0179_labelb_fork_label

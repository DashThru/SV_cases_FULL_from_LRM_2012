////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        838
// Description: timeskew posedge clock check
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0838_timeskew_posedge_cp(input CP,MODE,CPN);

  specify
    specparam event_based_flag=1,remain_active_flag=0;
    $timeskew (posedge CP &&& MODE, negedge CPN, 50, , event_based_flag,
               remain_active_flag);
    $fullskew (posedge CP &&& MODE, negedge CPN, 50, 70,, event_based_flag,
               remain_active_flag);
  endspecify
endmodule : sv12_lrm_p0838_timeskew_posedge_cp

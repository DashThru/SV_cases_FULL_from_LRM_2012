////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        18
// Description: task and $unit scope reference
// Note:        
//
////////////////////////////////////////////////////////////////


bit b;
task t;
  int b;
  b = 5 + $unit::b;  // $unit::b is the one outside
endtask

module sv12_lrm_p0018_task_unit_ref;
  int i = $unit::b;
endmodule : sv12_lrm_p0018_task_unit_ref


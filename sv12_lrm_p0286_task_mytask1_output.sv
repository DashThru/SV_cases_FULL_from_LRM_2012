////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        286
// Description: task statement syntax
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0286_task_mytask1_output;


task mytask1 (output int x, input logic y);
endtask

task mytask2;
  output x;
  input y;
  int x;
  logic y;
endtask

endmodule : sv12_lrm_p0286_task_mytask1_output

////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        748
// Description: the std built-in package
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0748_std_sys_task_unambiguously;

  std::semaphore sm=new(1);
  std::mailbox #(int) mb=new(1);
  std::process pr;

  initial begin
    std::randomize(); // unambiguously call the system provided sys_task
  end

endmodule : sv12_lrm_p0748_std_sys_task_unambiguously

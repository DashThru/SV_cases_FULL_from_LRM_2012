////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        190
// Description: wait fork statement
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0190_task_do_test;

  task exec1(); endtask
  task exec2(); endtask
  task exec3(); endtask
  task exec4(); endtask

  task do_test;
    fork
      exec1();
      exec2();
    join_any
    fork
      exec3();
      exec4();
    join_none
    wait fork;  // block until exec1 ... exec4 complete
  endtask

  logic rega,regb,regc;

  initial begin : block_name
    rega = regb;
    disable block_name;
    regc = rega; // this assignment will never execute
  end

endmodule : sv12_lrm_p0190_task_do_test

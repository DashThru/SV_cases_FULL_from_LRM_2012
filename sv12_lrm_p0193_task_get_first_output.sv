////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        193
// Description: disable fork statement
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0193_task_get_first_output;

  task wait_device(input int i, input int adr);
  endtask

  task get_first( output int adr );
    fork
      wait_device( 1, adr );
      wait_device( 7, adr );
      wait_device( 13, adr );
    join_any
    disable fork;
  endtask

  int adr;
  initial get_first(adr);

endmodule : sv12_lrm_p0193_task_get_first_output

////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        327
// Description: persistent trigger: triggered property
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0327_event_done_blast;


  event done, blast;      // declare two new events
  event done_too = done;  // declare done_too as alias to done
  
  task trigger( event ev );
    -> ev;
  endtask

  initial fork
    @ done_too;          // wait for done through done_too
    #1 trigger( done );  // trigger done through task trigger
  join
  
  initial fork
    -> blast;
    wait ( blast.triggered );
  join

endmodule : sv12_lrm_p0327_event_done_blast

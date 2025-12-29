////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        501
// Description: Adding constraints to scope variables
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0501_task_stimulus_int;


  task stimulus( int length );
    int a, b, c, success;
    success = std::randomize( a, b, c ) with { a < b ; a + b < length ; };
    success = std::randomize( a, b ) with { b - a > length ; };
  endtask

  initial stimulus(10);

endmodule : sv12_lrm_p0501_task_stimulus_int

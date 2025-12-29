////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        194
// Description: fine-grain process control
// Note:        
//
////////////////////////////////////////////////////////////////

//class process;
//  typedef enum { FINISHED, RUNNING, WAITING, SUSPENDED, KILLED } state;
//  static function process self();
//  function state status();
//  function void kill();
//  task await();
//  function void suspend();
//  function void resume();
//  function void srandom( int seed );
//  function string get_randstate();
//  function void set_randstate( string state );
//endclass

module sv12_lrm_p0194_task_automatic_do_n_way;


task automatic do_n_way( int N );
  process job[] = new [N];
  foreach (job[j])
    fork
      automatic int k = j;
      begin job[k] = process::self(); end 
    join_none

  foreach (job[j])  // wait for all processes to start
    wait( job[j] != null );

  job[1].await();  // wait for first process to finish
  foreach (job[j]) begin
    if ( job[j].status != process::FINISHED )
	  job[j].kill();
  end
endtask

endmodule : sv12_lrm_p0194_task_automatic_do_n_way

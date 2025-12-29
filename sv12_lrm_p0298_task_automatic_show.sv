////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        298
// Description: task default argument values
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0298_task_automatic_show;

  task automatic show ( const ref byte data [] );
    for ( int j = 0; j < data.size ; j++ )
      $display( data[j] ); // data can be read but not written
  endtask
  
  task read(int j = 0, int k, int data = 1 );
  endtask
  
  initial begin
    read( , 5 );     // is equivalent to  read( 0, 5, 1 );
    read( 2, 5 );    // is equivalent to  read( 2, 5, 1 );
    read( , 5, );    // is equivalent to  read( 0, 5, 1 );
    read( , 5, 7 );  // is equivalent to  read( 0, 5, 7 );
    read( 1, 5, 2);  // is equivalent to  read( 1, 5, 2 );
  end

endmodule : sv12_lrm_p0298_task_automatic_show

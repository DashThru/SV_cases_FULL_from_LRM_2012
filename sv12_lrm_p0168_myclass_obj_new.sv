////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        168
// Description: class memory management 
// Note:        
//
////////////////////////////////////////////////////////////////

class C #(parameter p = 2, type T = int);
endclass


module sv12_lrm_p0168_myclass_obj_new;
  task task1(C obj);
  endtask
  task task2(C obj);
  endtask

  C obj = new;
  initial fork
    task1( obj );
    task2( obj );
  join_none

endmodule : sv12_lrm_p0168_myclass_obj_new

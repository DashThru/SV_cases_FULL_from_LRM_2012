////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        76
// Description: event done declare
// Note:        
//
////////////////////////////////////////////////////////////////

interface intf_i;
  typedef int data_t;
endinterface

module sub(intf_i p);
  typedef p.data_t my_data_t;
  my_data_t data;
    // type of 'data' will be int when connected to interface above
endmodule

module sv12_lrm_p0076_event_done_declare;
  event done;             // declare a new event called done
  event done_too = done;  // declare done_too as alias to done
  event empty = null;     // event variable with no synchronization object

  typedef int intP;

  intP a, b;

  intf_i u_intf();
  sub u_sub(u_intf);

endmodule : sv12_lrm_p0076_event_done_declare

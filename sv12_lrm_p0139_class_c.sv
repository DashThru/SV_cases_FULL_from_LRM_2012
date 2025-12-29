////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        139
// Description: class constructors
// Note:        
//
////////////////////////////////////////////////////////////////

class C;
  int c1 = 1;
  int c2 = 1;
  int c3 = 1;
  function new(int a);
    c2 = 2;
    c3 = a;
  endfunction
endclass

class D extends C;
  int d1 = 4;
  int d2 = c2;
  int d3 = 6;
  function new;
    super.new(d3);
  endfunction
endclass

class Packet ;
  //data or class properties
  bit [3:0] command;
  bit [40:0] address;
  bit [4:0] master_id;
  integer time_requested;
  integer time_issued;
  integer status;
  typedef enum { ERR_OVERFLOW= 10, ERR_UNDERFLOW = 1123} PCKT_TYPE;
  const integer buffer_size = 100;
  const integer header_size;
  // initialization
  function new(int cmd = 0, bit[12:0] adrs = 0, int cmd_time );
    command = cmd;
    address = adrs;
    time_requested = cmd_time;
  endfunction
  // methods
  // public access entry points
  task clean();
    command = 0; address = 0; master_id = 5'bx;
  endtask
  task issue_request( int delay );
    // send request to bus
  endtask
  function integer current_status();
    current_status = status;
  endfunction
endclass

module sv12_lrm_p0139_class_c;

  Packet p = new(1, $random, $time);
  D d = new;

endmodule : sv12_lrm_p0139_class_c

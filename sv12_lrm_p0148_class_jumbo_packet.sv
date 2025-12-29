////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        148
// Description: constant class properties
// Note:        
//
////////////////////////////////////////////////////////////////

class Jumbo_Packet;
  const int max_size = 9 * 1024; // global constant
  byte payload [];
  function new( int size );
    payload = new[ size > max_size ? max_size : size ];
  endfunction
endclass

class Big_Packet;
  const int size; // instance constant
  byte payload [];
  function new();
    size = $urandom % 4096; //one assignment in new -> ok
    payload = new[ size ];
  endfunction
endclass

module sv12_lrm_p0148_class_jumbo_packet;
  Jumbo_Packet jp =new(256);
  Big_Packet bp =new;

endmodule : sv12_lrm_p0148_class_jumbo_packet

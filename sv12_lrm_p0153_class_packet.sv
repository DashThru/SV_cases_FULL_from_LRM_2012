////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        153
// Description: class out-of-block declarations
// Note:        
//
////////////////////////////////////////////////////////////////

class Packet;
  Packet next;
  function Packet get_next();// single line
    get_next = next;
  endfunction
  // out-of-body (extern) declaration
  extern protected virtual function int send(int value);
endclass

function int Packet::send(int value);
  // dropped protected virtual, added Packet:: body of method
endfunction

module sv12_lrm_p0153_class_packet;
  Packet p =new;
endmodule : sv12_lrm_p0153_class_packet

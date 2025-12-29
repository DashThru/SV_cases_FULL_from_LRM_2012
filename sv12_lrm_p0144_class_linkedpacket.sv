////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        144
// Description: inheritance and subclasses
// Note:        
//
////////////////////////////////////////////////////////////////

class Packet;
  integer i = 1;
  function integer get();
    get = i;
  endfunction
endclass

class BadLinkedPacket;
  Packet packet_c;
  BadLinkedPacket next;
  function BadLinkedPacket get_next();
    get_next = next;
  endfunction
endclass

class LinkedPacket extends Packet;
  LinkedPacket next;
  function LinkedPacket get_next();
    get_next = next;
  endfunction
endclass

module sv12_lrm_p0144_class_linkedpacket;

  LinkedPacket lp = new;
  Packet p = lp;

endmodule : sv12_lrm_p0144_class_linkedpacket

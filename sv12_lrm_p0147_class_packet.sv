////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        147
// Description: data hiding and encapsulation
// Note:        
//
////////////////////////////////////////////////////////////////

class Packet;
  local integer i;
  function integer compare (Packet other);
    compare = (this.i == other.i);
  endfunction
endclass

module sv12_lrm_p0147_class_packet;
  Packet p = new;
endmodule : sv12_lrm_p0147_class_packet

////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        146
// Description: class chaining constructors
// Note:        
//
////////////////////////////////////////////////////////////////

class Packet;
  integer i = 1;
  function integer get();
    get = i;
  endfunction
  function new(integer i);
    this.i = i;
  endfunction
endclass

class EtherPacket1 extends Packet(5);
endclass

class EtherPacket2 extends Packet;
  function new();
    super.new(5);
  endfunction
endclass

module sv12_lrm_p0146_class_etherpacket_extends;

   EtherPacket1 ep1 = new;
   EtherPacket2 ep2 = new;

endmodule : sv12_lrm_p0146_class_etherpacket_extends

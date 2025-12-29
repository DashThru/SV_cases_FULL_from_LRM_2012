////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        145
// Description: overridden class members
// Note:        
//
////////////////////////////////////////////////////////////////

class Packet;
  integer i = 1;
  function integer get();
    get = i;
  endfunction
endclass

class LinkedPacket extends Packet;
  integer i = 2;
  function integer get();
    get = -i;
  endfunction
endclass  

class Packet1;  // base class
  integer value;
  function integer delay();
    delay = value * value;
  endfunction
endclass

class LinkedPacket1 extends Packet1;  // derived class
  integer value;
  function integer delay();
    delay = super.delay()+ value * super.value;
  endfunction
endclass

module sv12_lrm_p0145_class_packet;

  LinkedPacket lp = new;
  Packet p = lp;
  int j;
  
  initial begin
    j = p.i;     // j = 1, not 2
    j = p.get(); // j = 1, not -1 or -2
  end

endmodule : sv12_lrm_p0145_class_packet

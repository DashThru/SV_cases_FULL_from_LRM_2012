////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        150
// Description: Abstract classes and pure virtual methods
// Note:        
//
////////////////////////////////////////////////////////////////

virtual class BasePacket;
  pure virtual function integer send(bit[31:0] data); // No implementation
endclass

class EtherPacket extends BasePacket;
  virtual function integer send(bit[31:0] data);
    // body of the function
  endfunction
endclass

module sv12_lrm_p0150_virtual_class_basepacket;
  EtherPacket ep = new;
endmodule : sv12_lrm_p0150_virtual_class_basepacket

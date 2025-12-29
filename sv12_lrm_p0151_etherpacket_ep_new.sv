////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        151
// Description: Polymorphism - dynamic method lookup
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

class TokenPacket extends BasePacket;
  virtual function integer send(bit[31:0] data);
    // body of the function
  endfunction
endclass

class GPSPacket extends EtherPacket;
  virtual function integer send(bit[31:0] data);
    // body of the function
  endfunction
endclass

class Base;
  typedef enum {bin,oct,dec,hex} radix;
  static task print( radix r, integer n ); endtask
endclass


module sv12_lrm_p0151_etherpacket_ep_new;

  BasePacket packets[100];
  EtherPacket ep = new;  // extends BasePacket
  TokenPacket tp = new;  // extends BasePacket
  GPSPacket gp = new;    // extends EtherPacket

  initial begin
    packets[0] = ep;
    packets[1] = tp;       // packets[1].send(); shall invoke the send method associated with the TokenPacket class
    packets[2] = gp;
    packets[1].send(32'b0);
  end

  Base b = new;
  int bin = 123;
  initial begin
    b.print( Base::bin, bin ); // Base::bin and bin are different
    Base::print( Base::hex, 66 );
  end

endmodule : sv12_lrm_p0151_etherpacket_ep_new

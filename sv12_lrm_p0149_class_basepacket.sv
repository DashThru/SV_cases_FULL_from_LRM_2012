////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        149
// Description: class virtual methods
// Note:        
//
////////////////////////////////////////////////////////////////

class BasePacket;
  int A = 1;
  int B = 2;
  function void printA;
    $display("BasePacket::A is %d", A);
  endfunction : printA
  virtual function void printB;
    $display("BasePacket::B is %d", B);
  endfunction : printB
endclass : BasePacket

class My_Packet extends BasePacket;
  int A = 3;
  int B = 4;
  function void printA;
    $display("My_Packet::A is %d", A);
  endfunction: printA
  virtual function void printB;
    $display("My_Packet::B is %d", B);
  endfunction : printB
endclass : My_Packet

typedef int T; // T and int are matching data types.

class C;
  virtual function C some_method(int a); endfunction
endclass

class D extends C;
  virtual function D some_method(T a); endfunction
endclass

class E #(type Y = logic) extends C;
  virtual function D some_method(Y a); endfunction
endclass


module sv12_lrm_p0149_class_basepacket;

  BasePacket P1 = new;
  My_Packet P2 = new;

  E #(int) v2;  // Legal: type parameter Y resolves to int

  initial begin
    P1.printA;  // displays 'BasePacket::A is 1'
    P1.printB;  // displays 'BasePacket::B is 2'
    P1 = P2;    // P1 has a handle to a My_packet object
    P1.printA;  // displays 'BasePacket::A is 1'
    P1.printB;  // displays 'My_Packet::B is 4' - last derived method
    P2.printA;  // displays 'My_Packet::A is 3'
    P2.printB;  // displays 'My_Packet::B is 4'
  end



endmodule : sv12_lrm_p0149_class_basepacket

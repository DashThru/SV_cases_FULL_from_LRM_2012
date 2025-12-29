////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        142
// Description: assignment renaming and copying
// Note:        
//
////////////////////////////////////////////////////////////////

class Demo ;
  integer x;
  function new (integer x);
    this.x = x;
  endfunction
endclass

class Packet;
  integer x;
endclass

module sv12_lrm_p0142_class_demo;
  Demo d = new(1);

  Packet p1;
  Packet p2;
  initial begin
    p1 = new;
    p2 = p1;
  end
  
  Packet p3;
  Packet p4;
  initial begin
    p3 = new;
    p4 = new p3;
  end


endmodule : sv12_lrm_p0142_class_demo

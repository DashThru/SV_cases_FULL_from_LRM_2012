////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        489
// Description: rand soft constraints
// Note:        
//
////////////////////////////////////////////////////////////////



module sv12_lrm_p0489_class_packet;

  class Packet;
    rand int length;
    constraint deflt { soft length inside {32,1024}; }
  endclass

  Packet p = new();
  initial p.randomize() with { length == 1512; };


endmodule : sv12_lrm_p0489_class_packet

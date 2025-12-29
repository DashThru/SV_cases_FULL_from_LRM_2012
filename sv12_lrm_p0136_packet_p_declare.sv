////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        136
// Description: objects as class instance
// Note:        
//
////////////////////////////////////////////////////////////////

class Packet;
endclass

module sv12_lrm_p0136_packet_p_declare;

  Packet p; // declare a variable of class Packet
  initial p = new;  // initialize variable to a new allocated object of the class Packet

  task task1(integer a, Packet myexample);
    if (myexample == null) myexample = new;
  endtask


endmodule : sv12_lrm_p0136_packet_p_declare

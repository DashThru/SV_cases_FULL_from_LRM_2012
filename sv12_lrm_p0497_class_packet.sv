////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        497
// Description: disabling random variables with rand_mode()
// Note:        
//
////////////////////////////////////////////////////////////////

class Packet;
  rand integer source_value, dest_value;
endclass

module sv12_lrm_p0497_class_packet;

  int ret;
  Packet packet_a = new;

  initial begin
    // Turn off all variables in object
    packet_a.rand_mode(0);
    // ... other code
    // Enable source_value
    packet_a.source_value.rand_mode(1);
    ret = packet_a.dest_value.rand_mode();
  end


endmodule : sv12_lrm_p0497_class_packet

////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        498
// Description: controlling constraints with constraint_mode()
// Note:        
//
////////////////////////////////////////////////////////////////

class Packet;
  parameter m = 10;
  rand integer source_value;
  constraint filter1 { source_value > 2 * m; }
endclass

module sv12_lrm_p0498_class_packet;

  function integer toggle_rand( Packet p );
    if ( p.filter1.constraint_mode() )
      p.filter1.constraint_mode(0);
    else
      p.filter1.constraint_mode(1);
    toggle_rand = p.randomize();
  endfunction

  int ret;
  Packet packet_a = new;

  initial begin
    // Turn off all variables in object
    packet_a.constraint_mode(0);
    toggle_rand(packet_a);
  end


endmodule : sv12_lrm_p0498_class_packet

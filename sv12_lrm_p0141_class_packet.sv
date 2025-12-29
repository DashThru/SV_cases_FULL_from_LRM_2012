////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        141
// Description: class packet
// Note:        
//
////////////////////////////////////////////////////////////////

class Packet ;
  static integer fileID = $fopen( ".", "r" );
endclass

class ID;
  static int current = 0;
  static function int next_id();
    next_id = ++current; // OK to access static class property
  endfunction
endclass

class TwoTasks;
  static task t1(); endtask
endclass

module sv12_lrm_p0141_class_packet;

  Packet p = new;
  int c;
  initial c = $fgetc( p.fileID );

  ID id = new;
  TwoTasks twotasks = new;

endmodule : sv12_lrm_p0141_class_packet

////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        101
// Description: byte stream casting
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0101_typedef_struct;

  typedef struct {
    byte length;
	shortint address;
	byte payload[];
	byte chksum;
  } Packet;

  function Packet genPkt();
    Packet p;
    void'( randomize( p.address, p.length, p.payload )
      with { p.length > 1 && p.payload.size == p.length; } );
    p.chksum = p.payload.xor();
    return p;
  endfunction

  typedef byte channel_type[$];
  channel_type channel;
  initial channel = {channel, channel_type'(genPkt())};
  
  Packet p;
  int size;
  
  initial begin
    size = channel[0] + 4;
    p = Packet'( channel[0 : size - 1] );  // convert stream to Packet
    channel = channel[ size : $ ];         // update the stream so it now lacks that packet
  end
endmodule : sv12_lrm_p0101_typedef_struct

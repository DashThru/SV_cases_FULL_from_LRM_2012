////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        242
// Description: streaming dynamically sized data
// Note:        
//
////////////////////////////////////////////////////////////////

class Packet;
  rand int header;
  rand int len;
  rand byte payload[];
  int crc;
  constraint G { len > 1; payload.size == len ; }
  function void post_randomize; crc = payload.sum; endfunction
endclass

module sv12_lrm_p0242_byte_stream_byte;

  byte stream[$]; // byte stream

  initial begin
    byte q[$];
    Packet p = new;
    //void'(p.randomize());
    q = {<<byte{p.header, p.len, p.payload with [0 +: p.len], p.crc}};
    q = {<<byte{p.header, p.len, p.payload with [0 : p.len-1], p.crc}};
    q = {<<byte{p}};
  end

  initial send: begin  // Create random packet and transmit
    byte q[$];
    Packet p = new;
    //void'(p.randomize());
    q = {<< byte{p.header, p.len, p.payload, p.crc}};  // pack
    stream = {stream, q};  // append to stream
  end

  initial receive: begin  // Receive packet, unpack, and remove
    byte q[$];
    Packet p = new;
    {<< byte{ p.header, p.len, p.payload with [0 +: p.len], p.crc }} = stream;
	stream = stream[ $bits(p) / 8 : $ ];  // remove packet
  end

  

endmodule : sv12_lrm_p0242_byte_stream_byte

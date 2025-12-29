////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        100
// Description: bit stream casting
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0100_typedef_struct;

  typedef struct {
    shortint address;
    logic [3:0] code;
    byte command [2];
  } Control;
  
  typedef bit Bits [36:1];
  
  Control p;
  Bits stream[$];
  
  initial begin
    Bits b;
    Control q;

    // initialize control packet
    p = '{ address: 16'h1234,
           code:    4'hA,
           command: '{ 8'h11, 8'h22 } };
    
    stream.push_back(Bits'(p));  // append packet to unpacked queue of Bits
    
    b = stream.pop_front();      // get packet (as Bits) from stream
    q = Control'(b);             // convert packet bits back to a Control packet
  end
endmodule : sv12_lrm_p0100_typedef_struct


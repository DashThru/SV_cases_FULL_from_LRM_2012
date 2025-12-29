////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        471
// Description: random variables
// Note:        
//
////////////////////////////////////////////////////////////////

class packet;
  rand bit [7:0] len;
  rand integer data[];
  constraint db { data.size == len; }
  rand bit [7:0] x;
  randc bit [1:0] y;
endclass


module sv12_lrm_p0471_rand_bit_len;
  
  parameter constant=5;

  class packet;
    typedef struct {
      randc int addr = 1 + constant;
  	int crc;
      rand byte data [] = {1,2,3,4};
    } header;
    rand header h1;
  endclass

  packet p1=new;
endmodule : sv12_lrm_p0471_rand_bit_len

////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        502
// Description: random system functions $urandom
// Note:        
//
////////////////////////////////////////////////////////////////

class C;
  rand int i;
endclass

module sv12_lrm_p0502_bit_addr;

  bit [64:1] addr;
  bit [ 3:0] number;
  int val;
  string st;
  C c=new;

  initial begin
    addr[32:1] = $urandom( 254 );  // Initialize the generator,
                                   // get 32-bit random number
    addr = {$urandom, $urandom };  // 64-bit random number
    number = $urandom & 15;        // 4-bit random number

    val = $urandom_range(7,0);
    val = $urandom_range(7);
    val = $urandom_range(0,7);

    c.srandom(8);
    st = c.get_randstate();
    c.set_randstate(st);
  end
endmodule : sv12_lrm_p0502_bit_addr

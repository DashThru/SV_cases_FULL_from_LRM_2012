////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        484
// Description: rand static constraint blocks
// Note:        
//
////////////////////////////////////////////////////////////////

class C;
  rand int length,v;

  function int count_ones ( bit [9:0] w );
    for( count_ones = 0; w != 0; w = w >> 1 )
      count_ones += w & 1'b1;
  endfunction

  constraint C1 { length == count_ones( v ) ; }
  
  constraint C2
  {
  length == ((v>>9)&1) + ((v>>8)&1) + ((v>>7)&1) + ((v>>6)&1) + ((v>>5)&1) +
            ((v>>4)&1) + ((v>>3)&1) + ((v>>2)&1) + ((v>>1)&1) + ((v>>0)&1);
  }
endclass

class B;
  rand int x, y;
  function int F (int x); F=1;endfunction
  constraint C { x <= F(y); }
  constraint D { y inside { 2, 4, 8 } ; }
endclass


module sv12_lrm_p0484_x;
  B b=new;
  C c=new;
endmodule : sv12_lrm_p0484_x

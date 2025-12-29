////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        475
// Description: rand set membership
// Note:        
//
////////////////////////////////////////////////////////////////

class C;
  rand integer x, y, z;
  constraint c1 {x inside {3, 5, [9:15], [24:32], [y:2*y], z};}
  
  rand integer a, b, c;
  constraint c2 {a inside {b, c};}
  
  integer fives[4] = '{ 5, 10, 15, 20 };
  rand integer v;
  constraint c3 { v inside {fives}; }

endclass

module sv12_lrm_p0475_rand_integer_x;
  C c=new;
endmodule : sv12_lrm_p0475_rand_integer_x

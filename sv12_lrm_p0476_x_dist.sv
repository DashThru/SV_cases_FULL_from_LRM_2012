////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        476
// Description: rand constraint distribution
// Note:        
//
////////////////////////////////////////////////////////////////

class C;
  rand int x;

  constraint c1 {x dist {100 := 1, 200 := 2, 300 := 5};}
  
  constraint c2 {x != 200;x dist {100 := 1, 200 := 2, 300 := 5};}
  
  constraint c3 {x dist { [100:102] := 1, 200 := 2, 300 := 5};}
  
  constraint c4 {x dist { [100:102] :/ 1, 200 := 2, 300 := 5};}

endclass

module sv12_lrm_p0476_x_dist;
  C c=new;
endmodule : sv12_lrm_p0476_x_dist

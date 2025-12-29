////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        505
// Description: random object stability
// Note:        
//
////////////////////////////////////////////////////////////////

class C1;
  rand integer x;
endclass

class C2;
  rand integer y;
endclass

class C3;
  function new (integer seed);
     //set a new seed for this instance
     this.srandom(seed);
  endfunction
endclass

class Packet;
  rand bit[15:0] header;
  function new (int seed);
    this.srandom(seed);
  endfunction
endclass

module sv12_lrm_p0505_class_c1;

  
  initial begin
    Packet p = new(200);  // Create p with seed 200.
    p.srandom(300);       // Re-seed p with seed 300.
  end


  initial begin
    C1 c1 = new();
    C2 c2 = new();
    integer z;
    void'(c1.randomize());
    // z = $random;
    void'(c2.randomize());
  end


endmodule : sv12_lrm_p0505_class_c1

////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        643
// Description: define macro argument substitution
// Note:        
//
////////////////////////////////////////////////////////////////

module main;
  `define HI Hello
  `define LO "`HI, world"
  `define H(x) "Hello, x"
  initial begin
    $display("`HI, world");
    $display(`LO);
    $display(`H(world));
  end
endmodule
// will print:
//   `HI, world
//   `HI, world
//   Hello, x

module sv12_lrm_p0643_define_max_a;

  int r,s,p,q,a,b;
  logic [31:0] o,n;

  `define max(a,b)((a) > (b) ? (a) : (b))
  assign n = `max(p+q, r+s) ;  // will expand as n = ((p+q) > (r+s)) ? (p+q) : (r+s) ;
  
  `define TOP(a,b) a + b
  assign o = `TOP( `TOP(b,1), `TOP(42,a) );
  // expands to: b + 1 + 42 + a
  // not into:   42 + a + 1 + 42 + a
  // nor into:   b + 1 + 42 + b + 1

  main u_main();
    
endmodule : sv12_lrm_p0643_define_max_a

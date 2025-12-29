////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        664
// Description:  non-ANSI style port declarations
// Note:        
//
////////////////////////////////////////////////////////////////

module test(a,b,c,d,e,f,g,h);
  input [7:0] a;          // no explicit net declaration - net is unsigned
  input [7:0] b;
  input signed [7:0] c;
  input signed [7:0] d;   // no explicit net declaration - net is signed
  output [7:0] e;         // no explicit net declaration - net is unsigned
  output [7:0] f;
  output signed [7:0] g;
  output signed [7:0] h;  // no explicit net declaration - net is signed
  wire signed [7:0] b;    // port b inherits signed attribute from net decl.
  wire [7:0] c;           // net c inherits signed attribute from port
  logic signed [7:0] f;   // port f inherits signed attribute from logic decl.
  logic [7:0] g;          // logic g inherits signed attribute from port
endmodule

module complex_ports ( {c,d}, .e(f) );
  // Nets {c,d} receive the first port bits.
  // Name 'f' is declared inside the module.
  // Name 'e' is defined outside the module.
  // Cannot use named port connections of first port.
  input signed [7:0] c;
  input signed [7:0] d;   // no explicit net declaration - net is signed
  output [7:0] f;
endmodule

module split_ports (a[7:4], a[3:0]);
  // First port is upper 4 bits of 'a'.
  // Second port is lower 4 bits of 'a'.
  // Cannot use named port connections because
  // of part-select port 'a'.
  input [7:0] a;          // no explicit net declaration - net is unsigned
endmodule

module same_port (.a(i), .b(i));
  // Name 'i' is declared inside the module as an inout port.
  // Names 'a' and 'b' are defined for port connections.
  input [7:0] i;          // no explicit net declaration - net is unsigned
endmodule

module renamed_concat (.a({b,c}), f, .g(h[1]));
  // Names 'b', 'c', 'f', 'h' are defined inside the module.
  // Names 'a', 'f', 'g' are defined for port connections.
  // Can use named port connections.
  input [7:0] b;
  input signed [7:0] c;
  output [7:0] f;
  output signed [7:0] h;  // no explicit net declaration - net is signed
endmodule

module mixed_direction (.p({a, e}));
  input a; // p contains both input and output directions.
  output e;
endmodule


module sv12_lrm_p0664_module_test_a;
  test u_test();
  complex_ports u_complex_ports();
  split_ports u_split_ports();
  same_port u_same_port();
  renamed_concat u_renamed_concat();
  mixed_direction u_mixed_direction();
endmodule : sv12_lrm_p0664_module_test_a

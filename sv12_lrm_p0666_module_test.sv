////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        666
// Description: ANSI style list of port declarations
// Note:        
//
////////////////////////////////////////////////////////////////

module test (
  input [7:0] a,
  input signed [7:0] b, c, d,  // Multiple ports that share all
                               // attributes can be declared together.
  output [7:0] e,              // Every attribute of the declaration
                               // must be in the one declaration.
  output var signed [7:0] f, g,
  output signed [7:0] h) ;
  // It is illegal to redeclare any ports of
  // the module in the body of the module.
endmodule

module cpuMod(interface d, interface j);
endmodule

module mymod (
  output .P1(r[3:0]),
  output .P2(r[7:4]),
  ref    .Y(x),
  input  R
);
  logic [7:0] r;
  int x;
endmodule

module sv12_lrm_p0666_module_test;
  int x;

  test u_test();
  mymod u_mymod(.Y(x));
endmodule : sv12_lrm_p0666_module_test

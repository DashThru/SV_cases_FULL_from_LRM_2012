////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        261
// Description: declarative context binding of let arguments
// Note:        
//
////////////////////////////////////////////////////////////////

module top1;
  logic x = 1'b1;
  logic a, b;
  let y = x;
  always_comb begin
    // y binds to preceding definition of x
    // in the declarative context of let
    bit x;
    x = 1'b0;
    b = a | y;
  end
endmodule

// The effective code after expanding let expressions:
module top2;
  bit x = 1'b1;
  bit a,b;
  // let y = x;
  always_comb begin
    bit x;
    x = 1'b0;
    b = a | (top2.x);
  end
endmodule

module top3;
  logic a, b;
  let x = a || b;
  sequence s;
    x ##1 b;
  endsequence : s
endmodule

// The effective code after expanding let expressions:
module top4;
  logic a, b;
  // let x = a || b;
  sequence s;
    (top4.a || top4.b) ##1 b;
  endsequence : s
endmodule

module m();
  wire a, b;
  wire [2:0] c;
  wire [2:0] d;
  wire e;
  for (genvar i = 0; i < 3; i++) begin : L0
    if (i !=1) begin : L1
      let my_let(x) = !x || b && c[i];
      assign d[2 - i] = my_let(a); // OK
    end : L1
  end : L0
endmodule

module sv12_lrm_p0261_module_top;

  top1 u_top1();
  top2 u_top2();
  top3 u_top3();
  top4 u_top4();
  m    u_m();

endmodule : sv12_lrm_p0261_module_top

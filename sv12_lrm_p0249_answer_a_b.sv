////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        249
// Description: example of self-determined expressions
// Note:        
//
////////////////////////////////////////////////////////////////

module bitlength();
  logic [3:0] a, b, c;
  logic [4:0] d;
  initial begin
    a = 9;
    b = 8;
    c = 1;
    $display("answer = %b", c ? (a&b) : d);  // answer = 01000
  end
endmodule

module sv12_lrm_p0249_answer_a_b;
  logic [3:0] a;
  logic [5:0] b;
  logic [15:0] c;

  initial begin
    a = 4'hF;
    b = 6'hA;
    $display("a*b=%h", a*b);  // expression size is self-determined
    c = {a**b};               // expression a**b is self-determined
	                          // due to concatenation operator {}
    $display("a**b=%h", c);
    c = a**b;                 // expression size is determined by c
    $display("c=%h", c);
  end
  // a*b=16 // 'h96 was truncated to 'h16 since expression size is 6
  // a**b=1 // expression size is 4 bits (size of a)
  // c=ac61 // expression size is 16 bits (size of c)

  bitlength u_bitlength();
endmodule : sv12_lrm_p0249_answer_a_b

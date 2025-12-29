////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        695
// Description: defparam statement override
// Note:        
//
////////////////////////////////////////////////////////////////

module m1 (a,b);
  input a,b;
  real r1,r2;
  parameter [2:0] A = 3'h2;
  parameter B = 3'h2;
  initial begin
    r1 = A;
    r2 = B;
    $display("r1 is %f r2 is %f",r1,r2);
  end
endmodule: m1

module m2;
  wire a,b;
  defparam f1.A = 3.1415;
  defparam f1.B = 3.1415;
  m1 f1(a,b);
endmodule: m2

module flop(input a,b,c);
  parameter xyz = 0;
endmodule

module sv12_lrm_p0695_module_m1_a;
  
  m2 um2();
  
  genvar i;
  logic [7:0] in,in1,out1;
  
  generate
    for (i = 0; i < 8; i = i + 1) begin : somename
      flop my_flop(in[i], in1[i], out1[i]);
      defparam somename[i].my_flop.xyz = i ;
    end
  endgenerate


endmodule : sv12_lrm_p0695_module_m1_a

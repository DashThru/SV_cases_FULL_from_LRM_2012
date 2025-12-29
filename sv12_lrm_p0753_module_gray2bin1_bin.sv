////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        753
// Description: loop generate constructs
// Note:        
//
////////////////////////////////////////////////////////////////

module gray2bin1 (bin, gray); 
  parameter SIZE = 8;    // this module is parameterizable
  output [SIZE-1:0] bin; 
  input [SIZE-1:0] gray;
  genvar i; 
  generate
    for (i=0; i<SIZE; i=i+1) begin:bitnum 
	  assign bin[i] = ^gray[SIZE-1:i];
        // i refers to the implicitly defined localparam whose
        // value in each instance of the generate block is
        // the value of the genvar when it was elaborated.
    end
  endgenerate
endmodule

module addergen1 (co, sum, a, b, ci); 
  parameter SIZE = 4;
  output [SIZE-1:0] sum;
  output co;
  input [SIZE-1:0] a, b; 
  input ci;
  wire [SIZE :0] c;
  wire [SIZE-1:0] t [1:3];
  genvar i;
  assign c[0] = ci;
  // Hierarchical gate instance names are:
  // xor gates: bitnum[0].g1 bitnum[1].g1 bitnum[2].g1 bitnum[3].g1
  //            bitnum[0].g2 bitnum[1].g2 bitnum[2].g2 bitnum[3].g2
  // and gates: bitnum[0].g3 bitnum[1].g3 bitnum[2].g3 bitnum[3].g3
  //            bitnum[0].g4 bitnum[1].g4 bitnum[2].g4 bitnum[3].g4
  // or  gates: bitnum[0].g5 bitnum[1].g5 bitnum[2].g5 bitnum[3].g5
  // Generated instances are connected with
  // multidimensional nets t[1][3:0] t[2][3:0] t[3][3:0]
  // (12 nets total)
  for(i=0; i<SIZE; i=i+1) begin:bitnum
    xor g1 ( t[1][i], a[i],    b[i]);
	xor g2 ( sum[i], t[1][i],  c[i]);
	and g3 ( t[2][i], a[i],    b[i]);
	and g4 ( t[3][i], t[1][i], c[i]);
    or g5 ( c[i+1], t[2][i], t[3][i]); 
  end
  assign co = c[SIZE]; 
endmodule

module sv12_lrm_p0753_module_gray2bin1_bin;
  gray2bin1 gray2bin1();
  addergen1 addergen1();
endmodule : sv12_lrm_p0753_module_gray2bin1_bin

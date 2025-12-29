////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        754
// Description: loop generate constructs
// Note:        
//
////////////////////////////////////////////////////////////////

module addergen1 (co, sum, a, b, ci); 
  parameter SIZE = 4;
  output [SIZE-1:0] sum;
  output co;
  input [SIZE-1:0] a, b; 
  input ci; 
  wire [SIZE :0] c;
  genvar i; 
  assign c[0] = ci;
  // Hierarchical gate instance names are:
  // xor gates: bitnum[0].g1 bitnum[1].g1 bitnum[2].g1 bitnum[3].g1
  //            bitnum[0].g2 bitnum[1].g2 bitnum[2].g2 bitnum[3].g2
  // and gates: bitnum[0].g3 bitnum[1].g3 bitnum[2].g3 bitnum[3].g3
  //            bitnum[0].g4 bitnum[1].g4 bitnum[2].g4 bitnum[3].g4
  // or  gates: bitnum[0].g5 bitnum[1].g5 bitnum[2].g5 bitnum[3].g5
  // Gate instances are connected with nets named:
  //            bitnum[0].t1 bitnum[1].t1 bitnum[2].t1 bitnum[3].t1
  //            bitnum[0].t2 bitnum[1].t2 bitnum[2].t2 bitnum[3].t2
  //            bitnum[0].t3 bitnum[1].t3 bitnum[2].t3 bitnum[3].t3
  for(i=0; i<SIZE; i=i+1) begin:bitnum 
    wire t1, t2, t3;
	xor g1( t1,    a[i], b[i]);
	xor g2( sum[i],  t1, c[i]);
	and g3( t2,    a[i], b[i]);
	and g4( t3,      t1, c[i]);
	or g5 ( c[i+1],  t2, t3);
  end
  assign co = c[SIZE]; 
endmodule

module M1; endmodule
module M2; endmodule
module M3; endmodule
module M4; endmodule

module sv12_lrm_p0754_module_addergen1_co;

  parameter SIZE = 2; 
  genvar i, j, k, m; 
  generate
    for (i=0; i<SIZE; i=i+1) begin:B1      // scope B1[i]
	  M1 N1();                             // instantiates B1[i].N1
	  for (j=0; j<SIZE; j=j+1) begin:B2    // scope B1[i].B2[j]
	    M2 N2();                           // instantiates B1[i].B2[j].N2
		for (k=0; k<SIZE; k=k+1) begin:B3  // scope B1[i].B2[j].B3[k]
		  M3 N3();                         // instantiates
        end                                //   B1[i].B2[j].B3[k].N3
	  end
      if (i>0) begin:B4                    // scope B1[i].B4
        for (m=0; m<SIZE; m=m+1) begin:B5  // scope B1[i].B4.B5[m]
          M4 N4();                         // instantiates
        end                                //   B1[i].B4.B5[m].N4
	  end
   end
  endgenerate

  addergen1 addergen1();

endmodule : sv12_lrm_p0754_module_addergen1_co

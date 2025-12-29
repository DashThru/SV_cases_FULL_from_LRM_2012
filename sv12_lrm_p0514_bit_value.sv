////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        514
// Description: accessing these implicit variables
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0514_bit_value;

  bit [7:0] value [1:2];
  string operator;
  
  int cnt;
  initial 
  randsequence( A )
    void A  : A1 A2;
    void A1 : { cnt = 1; } B repeat(5) C B
            { $display("c=%d, b1=%d, b2=%d", C, B[1], B[2]); }  // implicit int B[1:2]; int C;
		;
    void A2 : if (1) D(5) else D(20)
	        { $display("d1=%d, d2=%d", D[1], D[2]); }  // implicit int D[1:2];
		;
	int B   : C { return C; }
	        | C C { return C[2]; }
		| C C C { return C[3]; }
		;
	int C   : { cnt = cnt + 1; return cnt; };
	int D (int prm) : { return prm; };

    int E: { cnt = 1; };
     X :E { int y = E;} B {int j = B+E;} ;
  endsequence

endmodule : sv12_lrm_p0514_bit_value

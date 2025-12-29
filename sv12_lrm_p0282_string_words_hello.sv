////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        282
// Description: foreach-loop statement
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0282_string_words_hello;

  string words [2] = '{ "hello", "world" };
  int prod [1:8] [1:3];
  
  initial foreach( words [ j ] )
    $display( j , words[j] ); // print each index and value

  initial foreach( prod[ k, m ] )
    prod[k][m] = k * m; // initialize

  //     1  2  3         3    4       1   2 -> Dimension numbers
  int A [2][3][4]; bit [3:0][2:1] B [5:1][4];
  
  initial foreach( A [ i, j, k ] ) begin end
  initial foreach( B [ q, r, , s ] ) begin end

  initial begin : count1s
    logic [7:0] tempreg,data;
    int count;
    count = 0;
    tempreg = data;
    while (tempreg) begin
      if (tempreg[0])
	    count++;
      tempreg >>= 1;
    end
  end

endmodule : sv12_lrm_p0282_string_words_hello

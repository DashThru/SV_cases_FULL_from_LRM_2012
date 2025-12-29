////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        283
// Description: do while and forever loop
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0283_string_s;

  string s;
  int map[string];
  initial begin
    map["apple"]  = 10;
    map["banana"] = 20;
    map["cherry"] = 30;

    if ( map.first( s ) )
    do
      $display( "%s : %d\n", s, map[ s ] );
    while ( map.next( s ) );
  end

  logic clock1,clock2;
  initial begin
    clock1 <= 0;
    clock2 <= 0;
    fork
      forever #10 clock1 = ~clock1;
      #5 forever #10 clock2 = ~clock2;
      #100 $finish;
    join
  end

endmodule : sv12_lrm_p0283_string_s

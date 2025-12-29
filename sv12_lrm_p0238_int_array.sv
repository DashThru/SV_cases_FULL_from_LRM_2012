////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        238
// Description: set membership operator
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0238_int_array;

  int a=1, b=2, c=3, ex=1;
  int array [$] = '{3,4,5};

  logic [2:0] val=3'b110;
  wire r;
  assign r=3'bz11 inside {3'b1?1, 3'b011};  // r = 1'bx

  bit ba = a inside { [16:23], [32:47] };
  string I;

  initial begin

    if ( a inside {b, c} ) ;

    if ( ex inside {1, 2, array} ) ; // same as { 1, 2, 3, 4, 5}

    while ( val inside {3'b1?1} ) ;  // matches 3'b101, 3'b111, 3'b1x1, 3'b1z1

    if (I inside {["a rock":"hard place"]}) ;
      // I between "a rock" and a "hard place"
  end
endmodule : sv12_lrm_p0238_int_array

////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        593
// Description: size of displayed data
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0593_display_d_h;
  logic [11:0] r1;
  initial begin
    r1 = 10;
    $display( "Printing with maximum size - :%d: :%h:", r1,r1 );
    $display( "Printing with minimum size - :%0d: :%0h:", r1,r1 );
  end
endmodule : sv12_lrm_p0593_display_d_h

// will print:
// Printing with maximum size - :  10: :00a:
// Printing with minimum size - :10: :a:


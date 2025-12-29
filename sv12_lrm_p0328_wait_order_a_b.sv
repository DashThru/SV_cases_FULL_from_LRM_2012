////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        328
// Description: event sequencing wait_order()
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0328_wait_order_a_b;

  event a, b, c;
  bit success;

  initial begin
    wait_order( a, b, c);
    wait_order( a, b, c ) else $display( "Error: events out of order" );
    wait_order( a, b, c ) success = 1; else success = 0;
  end
  

  initial begin
    a = b;
    -> c;
    -> a;  // also triggers b
    -> b;  // also triggers a
    a = c;
    b = a;
    -> a;  // also triggers b and c
    -> b;  // also triggers a and c
    -> c;  // also triggers a and c
  end

endmodule : sv12_lrm_p0328_wait_order_a_b

////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        83
// Description: Using enumerated type methods
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0083_typedef_enum_red;

  typedef enum { red, green, blue, yellow } Colors;
  Colors c = c.first;

  initial begin
    $display( "%s : %d\n", c.name, c );
    if( c == c.last ) c=c.prev;
    c = c.next;
  end

  localparam byte colon1 = ":" ;
  specparam delay = 10 ; // specparams are used for specify blocks
  parameter logic flag = 1 ;

endmodule : sv12_lrm_p0083_typedef_enum_red

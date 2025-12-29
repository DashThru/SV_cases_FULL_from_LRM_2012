////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        594
// Description: unknown and high-impedance values
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0594_display_d_bx;
  initial begin
    // Format Value    Displays
    // %d     32'd10   : 10:
    // %0d    32'd10   :10:
    // %h     32'd10   :0000000a:
    // %0h    32'd10   :a:
    // %3d    32'd5    :  5:
    // %3d    32'd100  :100:
    // %3d    32'd1234 :1234:
    // %3h    32'h5    :005:
    // %3h    32'h100  :100:
    // %3h    32'h1234 :1234:
    // %s     "abc"    :abc:
    // %3s    "a"      :  a:
    // %3s    "abc"    :abc:
    // %3s    "abcdef" :abcdef:
    
    //         STATEMENT                       RESULT
      $display("%d", 1'bx);                 //    x
      $display("%h", 14'bx01010);           //  xxXa
      $display("%h %o", 12'b001xxx101x01,
                        12'b001xxx101x01);  // XXX 1x5X
  end
endmodule : sv12_lrm_p0594_display_d_bx

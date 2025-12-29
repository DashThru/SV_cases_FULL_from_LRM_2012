////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        222
// Description: using integer literals in expressions
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0222_int_inta;


  int IntA;

  initial begin
    IntA = -12 / 3;       // The result is -4
    IntA = -'d 12 / 3;    // The result is 1431655761
    IntA = -'sd 12 / 3;   // The result is -4
    IntA = -4'sd 12 / 3;  // -4'sd12 is the negative of the 4-bit
                          // quantity 1100, which is -4. -(-4) = 4
                          // The result is 1
  end

  int n = 8, zero = 0;
  int res = 'b01xz | n;  // res gets 'b11xz coerced to int, or 'b1100
  int sum = n + n;       // sum gets 16 coerced to int, or 16
  int sumx = 'x + n;     // sumx gets 'x coerced to int, or 0
  int div2 = n/zero + n;  // div2 gets 'x coerced to int, or 0
  integer div4 = n/zero + n;  // div4 gets 'x

endmodule : sv12_lrm_p0222_int_inta

////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        183
// Description: implicit event_expression list
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0183_always_equivalent_to;

  logic a,b,c,d, tmp1, tmp2, i,kid,x,en,f;
  logic [3:0] y;

  function myfunction(int f);
  endfunction

  always @(*) // equivalent to @(a or b or c or d or f)
    y = (a & b) | (c & d) | myfunction(f);

  always @* begin // equivalent to @(a or b or c or d or tmp1 or tmp2)
    tmp1 = a & b;
    tmp2 = c & d;
    y = tmp1 | tmp2;
  end

  always @* begin // equivalent to @(b)
    @(i) kid = b; // i is not added to @*
  end

  always @* begin // equivalent to @(a or b or c or d)
    x = a ^ b;
    @* // equivalent to @(c or d)
    x = c ^ d;
  end

  always @* begin // same as @(a or en)
    y = 8'hff;
    y[a] = !en;
  end

endmodule : sv12_lrm_p0183_always_equivalent_to

////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        280
// Description: the for-loop statement
// Note:        
//
////////////////////////////////////////////////////////////////

module m;
  initial begin
    for (int i = 0; i <= 255; i++)
      begin end
  end
  initial begin
    loop2: for (int i = 15; i >= 0; i--)
      begin end
  end
endmodule

module n;
  initial begin
    begin
      automatic int i;
      for (i = 0; i <= 255; i++)
        begin end
	end
  end
  initial begin
    begin : loop2
      automatic int i;
      for (i = 15; i >= 0; i--)
        begin end
    end
  end
endmodule

module sv12_lrm_p0280_module_m;
  m um();
  n un();
endmodule : sv12_lrm_p0280_module_m

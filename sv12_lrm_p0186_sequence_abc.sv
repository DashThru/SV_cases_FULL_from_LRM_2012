////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        186
// Description: level-sensitive sequence controls
// Note:        
//
////////////////////////////////////////////////////////////////


logic clk,a,b,c,d,e;

sequence abc;
  @(posedge clk) a ##1 b ##1 c;
endsequence

sequence de;
  @(negedge clk) d ##[2:5] e;
endsequence

program check;
  initial begin
    wait( abc.triggered || de.triggered );
	if( abc.triggered )
      $display( "abc succeeded" );
	if( de.triggered )
      $display( "de succeeded" );
  end
endprogram

module sv12_lrm_p0186_sequence_abc;

  check u_check();

endmodule : sv12_lrm_p0186_sequence_abc

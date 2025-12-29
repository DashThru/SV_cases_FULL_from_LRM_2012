////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        185
// Description: level-sensitive event control 
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0185_begin;

  logic enable,a,b,c,d;

  initial  begin
    wait (!enable) #10 a = b;
	#10 c = d;
  end
endmodule : sv12_lrm_p0185_begin

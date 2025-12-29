////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        257
// Description: minimum, typical, and maximum delay expressions
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0257_a_b_c;

  int a,b,c,d,e,f,z,val;
  initial begin
    z = (a:b:c) + (d:e:f);
    z = val - (32'd 50: 32'd 75: 32'd 100);
  end
endmodule : sv12_lrm_p0257_a_b_c

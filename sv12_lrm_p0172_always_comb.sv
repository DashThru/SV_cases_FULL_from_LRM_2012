////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        172
// Description: always comb sensitivities
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0172_always_comb;

  logic a,b,c,d,e,q,ck,r1,r2,reset,disable_error,clock;

  always_comb
    begin
      a = b & c;
      A1:assert (a != e) else if (!disable_error) $error("failed");
    end
  
  always_latch
    if(ck) q <= d;
  
  always_ff @(posedge clock iff reset == 0 or posedge reset) begin
    r1 <= reset ? 0 : r2 + 1;
  end

endmodule : sv12_lrm_p0172_always_comb

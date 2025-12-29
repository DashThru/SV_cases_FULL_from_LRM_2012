////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        428
// Description: embedding concurrent assertions
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0428_property_r1;

  logic mclk,clock,scanclk,reset,q,q1,d,d1,cnt;

  property r1;
    q != d;
  endproperty
  always @(posedge mclk) begin
    q <= d1;
    r1_p1: assert property (r1);
    r1_p2: assert property (@(posedge scanclk)r1);
  end
  
  property r2;
    q != d;
  endproperty
  always @(posedge clock iff reset == 0 or posedge reset) begin
    cnt <= reset ? 0 : cnt + 1;
    q <= $past(d1);
    r2_p: assert property (r2);
  end

endmodule : sv12_lrm_p0428_property_r1

////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        344
// Description: boolean expressions assertion
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0344_bit_count;


  bit [2:0] count;
  bit clk;
  realtime t;

  initial count = 0;
  always @(posedge clk) begin
    if (count == 0) t = $realtime; //capture t in a procedural context
    count++;
  end

  property p1;
    @(posedge clk)
    count == 7 |-> $realtime - t < 50.5;
  endproperty

  property p2;
    realtime l_t;
    @(posedge clk)
    (count == 0, l_t = $realtime) ##1 (count == 7)[->1] |->
       $realtime - l_t < 50.5;
  endproperty

endmodule : sv12_lrm_p0344_bit_count

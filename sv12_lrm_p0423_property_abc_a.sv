////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        423
// Description: property assume statement
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0423_property_abc_a;

  logic req,gnt,rst,clk,ack;

  property abc(a, b, c);
    disable iff (c) @(posedge clk) a |=> b;
  endproperty
  env_prop:
    assume property (abc(req, gnt, rst)) else $error("Assumption failed.");

  a1:assume property ( @(posedge clk) req dist {0:=40, 1:=60} ) ;
  property proto ;
    @(posedge clk) req |-> req[*1:$] ##0 ack;
  endproperty
  
  a1_assertion:assert property ( @(posedge clk) req inside {0, 1} ) ;
  property proto_assertion ;
    @(posedge clk) req |-> req[*1:$] ##0 ack;
  endproperty

endmodule : sv12_lrm_p0423_property_abc_a

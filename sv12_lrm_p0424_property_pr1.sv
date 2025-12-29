////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        424
// Description: property assume statement
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0424_property_pr1;

  logic clk,reset_n,req,ack;

  property pr1;
    @(posedge clk) !reset_n |-> !req;  // when reset_n is asserted (0),
                                       // keep req 0
  endproperty
  property pr2;
    @(posedge clk) ack |=> !req;  // one cycle after ack, req
	                              // must be deasserted
  endproperty
  property pr3;
    @(posedge clk) req |-> req[*1:$] ##0 ack;  // hold req asserted until
                                               // and including ack asserted
  endproperty

  property pa1;
    @(posedge clk) !reset_n || !req |-> !ack;
  endproperty
  property pa2;
    @(posedge clk) ack |=> !ack;
  endproperty

  a1:assume property (@(posedge clk) req dist {0:=40, 1:=60} );
  assume_req1:assume property (pr1);
  assume_req2:assume property (pr2);
  assume_req3:assume property (pr3);
  assert_ack1:assert property (pa1)
     else $display("\n ack asserted while req is still deasserted");
  assert_ack2:assert property (pa2)
     else $display("\n ack is extended over more than one cycle");

endmodule : sv12_lrm_p0424_property_pr1

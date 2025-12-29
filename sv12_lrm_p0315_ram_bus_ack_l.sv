////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        315
// Description: explicit synchronous events
// Note:        
//
////////////////////////////////////////////////////////////////

class domain;
  bit [7:0] sign;
  bit sig1,sig2;

endclass

module sv12_lrm_p0315_ram_bus_ack_l;
  logic clk,ack_l,enable;
  domain dom = new();
  parameter a = 2;

  clocking ram_bus @(negedge clk);
    input ack_l;
    input enable;
  endclocking
  

  initial begin
    @(ram_bus.ack_l);
    @(ram_bus);
    @(posedge ram_bus.enable);
    @(negedge dom.sign[a]);
    @(posedge dom.sig1 or dom.sig2);
    @(negedge dom.sig1 or posedge dom.sig2);
    @(edge dom.sig1);
    @(negedge dom.sig1 or posedge dom.sig1);
  end
endmodule : sv12_lrm_p0315_ram_bus_ack_l

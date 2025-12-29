////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        392
// Description: assertions associated with preconditions
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0392_property_preconditions;

  logic mclk,data_phase,irdy,trdy,stop,frame;

  `define data_end_exp (data_phase && ((irdy==0)&&($fell(trdy)||$fell(stop))))
  property data_end_rule1;
    @(posedge mclk)
    `data_end_exp |-> ##[1:2] $rose(frame) ##1 $rose(irdy);
  endproperty
  
  property data_end_rule2;
    @(posedge mclk) ##[1:2] $rose(frame) ##1 $rose(irdy);
  endproperty

endmodule : sv12_lrm_p0392_property_preconditions

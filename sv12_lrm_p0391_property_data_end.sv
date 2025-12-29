////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        391
// Description: property implication construct
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0391_property_data_end;

  logic mclk,data_phase,irdy,trdy,stop;

  property data_end;
    @(posedge mclk)
    $rose(data_phase) |-> ##[1:5] ((irdy==0) && ($fell(trdy) || $fell(stop)));
  endproperty

endmodule : sv12_lrm_p0391_property_data_end

////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        395
// Description: followed-by property
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0395_property_p1;
  
  logic done,rst;
  
  property p1;
    ##[0:5] done #-# always !rst;
  endproperty
  property p2;
    ##[0:5] done #=# always !rst;
  endproperty

endmodule : sv12_lrm_p0395_property_p1

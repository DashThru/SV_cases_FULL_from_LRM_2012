////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        394
// Description: property as a nested implication
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0394_property_p16;

  logic write_en,data_valid;
  logic [0:7] retire_address,write_address,addr;

  property p16;
    (write_en & data_valid) ##0
    (write_en && (retire_address[0:4]==addr)) [*2] |->
    ##[3:8] write_en && !data_valid &&(write_address[0:4]==addr);
  endproperty
  
  property p16_nested;
    (write_en & data_valid) |->
      (write_en && (retire_address[0:4]==addr)) [*2] |->
        ##[3:8] write_en && !data_valid && (write_address[0:4]==addr);
  endproperty

endmodule : sv12_lrm_p0394_property_p16

////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        294
// Description: constant function for ram model address
// Note:        
//
////////////////////////////////////////////////////////////////

module ram_model (address, write, chip_select, data);
  parameter data_width = 8;
  parameter ram_depth = 256;
  localparam addr_width = clogb2(ram_depth);
  input [addr_width - 1:0] address;
  input write, chip_select;
  inout [data_width - 1:0] data;
  //define the clogb2 function
  function integer clogb2 (input [31:0] value);
    value = value - 1;
    for (clogb2 = 0; value > 0; clogb2 = clogb2 + 1)
      value = value >> 1;
  endfunction
  logic [data_width - 1:0] data_store[0:ram_depth - 1];
  //the rest of the ram model
endmodule: ram_model


module sv12_lrm_p0294_module_ram_model_address;
  wire [31:0] a_data;
  ram_model #(32,421) ram_a0(a_addr,a_wr,a_cs,a_data);
endmodule : sv12_lrm_p0294_module_ram_model_address

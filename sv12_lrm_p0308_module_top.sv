////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        308
// Description: clocking block events
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0308_module_top;

  logic phi1,data,address;

  default clocking dram @(posedge phi1);
    inout data;
    output negedge #1 address;
  endclocking

  parameter j = 2;

  initial @(dram) $display("haha");
  initial ##5;
  initial ##(j+1);

endmodule : sv12_lrm_p0308_module_top

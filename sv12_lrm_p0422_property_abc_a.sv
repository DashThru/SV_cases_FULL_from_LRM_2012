////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        422
// Description: assert statement
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0422_property_abc_a;
 
  logic clk,rst,in1,in2;

  property abc(a, b, c);
    disable iff (a==2) @(posedge clk) not (b ##1 c);
  endproperty

  env_prop: assert property (abc(rst, in1, in2))
              $display("env_prop passed."); else $display("env_prop failed.");

endmodule : sv12_lrm_p0422_property_abc_a

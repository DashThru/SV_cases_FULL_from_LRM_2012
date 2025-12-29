////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        87
// Description: interface quiet time checker parameter
// Note:        
//
////////////////////////////////////////////////////////////////

interface quiet_time_checker #(parameter min_quiet = 0,
                               parameter max_quiet = 0)
                              (input logic clk, reset_n, logic en);
  generate
    if ( max_quiet == 0) begin
      property quiet_time;
        @(posedge clk) reset_n |-> ($countones(en) == 1);
      endproperty
      a1: assert property (quiet_time);
    end
    else begin
      property quiet_time;
        @(posedge clk)
           (reset_n && ($past(en) != 0) && en == 0)
		   |->(en == 0)[*min_quiet:max_quiet]
        ##1 ($countones(en) == 1);
      endproperty
      a1: assert property (quiet_time);
    end
  endgenerate
endinterface


interface width_checker #(parameter min_cks = 1, parameter max_cks = 1)
                         (input logic clk, reset_n, expr);
  generate
    if ($isunbounded(max_cks)) begin
      property width;
	    @(posedge clk)
           (reset_n && $rose(expr)) |-> (expr [* min_cks]);
      endproperty
      a2: assert property (width); 
    end
    else begin
      property assert_width_p;
        @(posedge clk)
           (reset_n && $rose(expr)) |-> (expr[* min_cks:max_cks])
              ##1 (!expr);
      endproperty
      a2: assert property (assert_width_p); 
    end
  endgenerate
endinterface

module sv12_lrm_p0087_interface_parameter;
  wire clk,enables;

  quiet_time_checker #(0, 0) quiet_never (clk,1'b1,enables);
  quiet_time_checker #(2, 4) quiet_in_window (clk,1'b1,enables);
  quiet_time_checker #(0, $) quiet_any (clk,1'b1,enables);
  
  width_checker #(3, $) max_width_unspecified (clk,1'b1,enables);
  width_checker #(2, 4) width_specified (clk,1'b1,enables);

endmodule : sv12_lrm_p0087_interface_parameter

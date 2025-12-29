////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        668
// Description: rules for determining port kind
// Note:        
//
////////////////////////////////////////////////////////////////

module mh_nonansi(x, y);
  input wire x;
  output tri0 y;
endmodule

module mh0 (wire x);                            endmodule // inout wire logic x
module mh1 (integer x);                         endmodule // inout wire integer x
module mh2 (inout integer x);                   endmodule // inout wire integer x
module mh3 ([5:0] x);                           endmodule // inout wire logic [5:0] x
module mh5 (input x);                           endmodule // inout wire logic x
module mh6 (input var x);                       endmodule // inout var logic x
module mh7 (input var integer x);               endmodule // inout var integer x
module mh8 (output x);                          endmodule // output wire logic x
module mh9 (output var x);                      endmodule // output var logic x
module mh10(output signed [5:0] x);             endmodule // output wire logic signed [5:0] x
module mh11(output integer x);                  endmodule // output var integer x
module mh12(ref [5:0] x);                       endmodule // ref var logic [5:0] x
module mh13(ref x [5:0]);                       endmodule // ref var logic x [5:0]

module mh14(wire x, y[7:0]);                    endmodule // inout wire logic x
                                                          // inout wire logic y[7:0]
module mh15(integer x, signed [5:0] y);         endmodule // inout wire integer x
                                                          // inout wire logic signed [5:0] y

module mh16([5:0] x, wire y);                   endmodule // inout wire logic [5:0] x
                                                          // inout wire logic y
module mh17(input var integer x, wire y);       endmodule // input var integer x
                                                          // input wire logic y
module mh18(output var x, input y);             endmodule // output var logic x
                                                          // input wire logic y
module mh19(output signed [5:0] x, integer y);  endmodule // output wire logic signed [5:0] x
                                                          // output var integer y
module mh20(ref [5:0] x, y);                    endmodule // ref var logic [5:0] x
                                                          // ref var logic [5:0] y
module mh21(ref x [5:0], y);                    endmodule // ref var logic x [5:0]
                                                          // ref var logic y

module mh22 (input wire integer p_a, .p_b(s_b), p_c);
  logic [5:0] s_b;
endmodule


module sv12_lrm_p0668_module_mh_nonansi_x;
endmodule : sv12_lrm_p0668_module_mh_nonansi_x

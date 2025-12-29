////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        95
// Description: type operator
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0095_type_operator;

  nettype real realNet;
  nettype realNet rN;

  int a,b,i;
  logic [17:0] v;
  var type(a+b) c, d;

  initial c = type(i+3)'(v[15:0]);

  localparam type T = type(bit[12:0]);

  bit [12:0] A_bus, B_bus;
  parameter type bus_t = type(A_bus);
  generate
    case (type(bus_t))
      type(bit[12:0]): initial a=0;
      type(real): initial a=1;
    endcase
  endgenerate

endmodule : sv12_lrm_p0095_type_operator

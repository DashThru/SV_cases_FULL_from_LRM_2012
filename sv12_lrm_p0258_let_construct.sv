////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        258
// Description: let construct
// Note:        
//
////////////////////////////////////////////////////////////////

package pex_gen9_common_expressions;
  let valid_arb(request, valid, override) = |(request & valid) || override;
endpackage

module my_checker;
  import pex_gen9_common_expressions::*;
  logic a, b;
  wire [1:0] req;
  wire [1:0] vld;
  logic ovr;
  initial if (valid_arb(.request(req), .valid(vld), .override(ovr))) ;
endmodule

module sv12_lrm_p0258_let_construct;
  my_checker u_my_checker();

endmodule : sv12_lrm_p0258_let_construct

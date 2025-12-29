////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        420
// Description: local variable initialization assignments
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0420_property_p;

  logic clk,clk1,clk2,a,b,c,d,e,f,g;

  property p;
    logic v = e;
    (@(posedge clk1) (a == v)[*1:$] |-> b)
    and
    (@(posedge clk2) c[*1:$] |-> d == v)
    ;
  endproperty
  a1: assert property (@(posedge clk) f |=> p);

  property p2;
    logic v;
    (@(posedge clk1) (1, v = e) ##0 (a == v)[*1:$] |-> b)
	and
    (@(posedge clk2) (1, v = e) ##0 c[*1:$] |-> d == v)
	;
  endproperty

endmodule : sv12_lrm_p0420_property_p

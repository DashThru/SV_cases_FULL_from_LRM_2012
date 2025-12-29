////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        398
// Description: always assert property
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0398_always_property;

  logic a,b,c,clk,reset;
  default clocking m @(posedge clk);
  endclocking

  implicit_always: assert property(p1);
  
  initial explicit_always: assert property(always p2);
  
  initial a1: assume property( @(posedge clk) reset[*5] #=# always !reset);

  property p1;
    a ##1 b |=> always c;
  endproperty

  property p2;
    always [2:5] a;
  endproperty
  
  property p3;
    s_always [2:5] a;
  endproperty

  property p4;
    always [2:$] a;
  endproperty

endmodule : sv12_lrm_p0398_always_property

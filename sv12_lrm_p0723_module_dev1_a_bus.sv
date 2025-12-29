////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        723
// Description: interfaces and specify blocks
// Note:        
//
////////////////////////////////////////////////////////////////

interface itf; 
  logic c,q,d;
  modport flop (input c,d, output q); 
endinterface

module dtype (itf.flop ch);
  always_ff @(posedge ch.c) ch.q <= ch.d;
  specify
    (posedge ch.c => (ch.q+:ch.d)) = (5,6); 
    $setup( ch.d, posedge ch.c, 1 );
  endspecify
endmodule

module sv12_lrm_p0723_module_dev1_a_bus;
  itf itf();
  dtype dtype(itf.flop);
endmodule : sv12_lrm_p0723_module_dev1_a_bus

////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        717
// Description: interface modport definition
// Note:        
//
////////////////////////////////////////////////////////////////

interface i2;
  wire a, b, c, d;
  modport master (input a, b, output c, d); 
  modport slave (output a, b, input c, d);
endinterface

module m (i2.master i);
endmodule

module s (i2.slave i);
endmodule 

module top;
  i2 i();
  m u1(.i(i));
  s u2(.i(i));
endmodule

module m1 (i2 i); 
endmodule

module s1 (i2 i); 
endmodule 

module top1;
  i2 i();
  m1 u1(.i(i.master));
  s1 u2(.i(i.slave));
endmodule


module sv12_lrm_p0717_module_cpumod_simple_bus;
  top top();
  top1 top1();
endmodule : sv12_lrm_p0717_module_cpumod_simple_bus

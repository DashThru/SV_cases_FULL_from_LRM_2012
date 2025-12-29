////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        562
// Description: conversion system functions
// Note:        
//
////////////////////////////////////////////////////////////////

module driver (net_r);
  output [64:1] net_r;
  real r;
  wire [64:1] net_r = $realtobits(r);
endmodule

module receiver (net_r);
  input [64:1] net_r;
  wire [64:1] net_r;
  real r;
  initial assign r = $bitstoreal(net_r);
endmodule

module sv12_lrm_p0562_module_driver_net_r;
  driver driver(net_r);
  receiver receiver(net_r);
endmodule : sv12_lrm_p0562_module_driver_net_r

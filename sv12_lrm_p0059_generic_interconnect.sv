////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        59
// Description: generic interconnect
// Note:        
//
////////////////////////////////////////////////////////////////

package NetsPkg;
  nettype real realNet;
endpackage : NetsPkg

module sv12_lrm_p0059_generic_interconnect();
  interconnect [0:1] iBus;
  lDriver l1(iBus[0]);
  rDriver r1(iBus[1]);
  rlMod m1(iBus);
endmodule : sv12_lrm_p0059_generic_interconnect

module lDriver(output wire logic out);
endmodule : lDriver

module rDriver
  import NetsPkg::*;
  (output realNet out);
endmodule : rDriver

module rlMod(input interconnect [0:1] iBus);
  lMod l1(iBus[0]);
  rMod r1(iBus[1]);
endmodule : rlMod

module lMod(input interconnect iBus);
endmodule : lMod

module rMod(input interconnect iBus);
endmodule : rMod


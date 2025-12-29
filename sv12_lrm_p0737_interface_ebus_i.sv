////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        737
// Description: access to interface objects
// Note:        
//
////////////////////////////////////////////////////////////////

interface ebus_i;
  integer I;              // reference to I not allowed through modport mp
  typedef enum {Y,N} choice; 
  choice Q;
  localparam True = 1; 
  modport mp(input Q);
endinterface

module Top;
  ebus_i ebus (); 
  sub s1 (ebus.mp);
endmodule

module sub(interface.mp i); 
  typedef i.choice yes_no;  // import type from interface 
  yes_no P;
  assign P = i.Q;           // refer to Q with a port reference
  initial
    Top.ebus.Q = i.True;    // refer to Q with a hierarchical reference
  initial
    Top.ebus.I = 0;         // referring to i.I would not be legal because
	                        // is not in modport mp
endmodule

module sv12_lrm_p0737_interface_ebus_i;
  Top Top();
endmodule : sv12_lrm_p0737_interface_ebus_i

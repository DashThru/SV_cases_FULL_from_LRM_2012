////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        744
// Description: using packages in module headers
// Note:        
//
////////////////////////////////////////////////////////////////

package A;
  typedef struct {
    bit [ 7:0] opcode;
    bit [23:0] addr; 
  } instruction_t;
endpackage: A

package B;
  typedef enum bit {FALSE, TRUE} boolean_t;
endpackage: B

module M import A::instruction_t, B::*;
         #(WIDTH = 32)
          (input [WIDTH-1:0] data, 
		   input instruction_t a, 
		   output [WIDTH-1:0] result, 
		   output boolean_t OK
          );
endmodule: M

module sv12_lrm_p0744_package_a;
  M M();
endmodule : sv12_lrm_p0744_package_a

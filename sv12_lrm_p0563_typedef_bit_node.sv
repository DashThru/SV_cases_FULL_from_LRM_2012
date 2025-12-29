////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        563
// Description: data query system functions
// Note:        
//
////////////////////////////////////////////////////////////////

// source code       // $typename would return
typedef bit node;    // "bit"
node [2:0] X;        // "bit [2:0]"
int signed Y;        // "int"

package A;
  enum {A,B,C=99} X;   // "enum{A=32'sd0,B=32'sd1,C=32'sd99}A::e$1"
  typedef bit [9:1'b1] word;  // "A::bit[9:1]"
endpackage : A

import A::*;
module top;
  typedef struct {node A,B;} AB_t;
  AB_t AB[10];         // "struct{bit A;bit B;}top.AB_t$[0:9]"
endmodule

module sv12_lrm_p0563_typedef_bit_node;

  logic [31:0] v;

  typedef struct {
    logic valid;
	bit [8:1] data;
  } MyType;
  
  typedef bit[$bits(MyType):1] MyBits; //same as typedef bit [9:1] MyBits;
  MyBits b;

  parameter int i = $;  // $isunbounded(i) shall return true

  initial $display($isunbounded(i));
  initial $display($bits(MyType));
  initial $display($typename(b));
  initial $display($typename(byte));
  
  top u_top();


endmodule : sv12_lrm_p0563_typedef_bit_node

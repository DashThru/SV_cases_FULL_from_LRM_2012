////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        685
// Description: extern module instance
// Note:        
//
////////////////////////////////////////////////////////////////

extern module m (a,b,c,d);
extern module a #(parameter size= 8, parameter type TP = logic [7:0])
                (input [size:0] a, output TP b);

module top1 ();
  wire [8:0] a;
  logic [7:0] b;
  wire c, d;
  m mm (.*);
  a aa (.*);
endmodule

// Modules m and a are then assumed to be instantiated as follows
module top2 ();
  wire [8:0] a;
  logic [7:0] b;
  wire c, d;
  m mm (a,b,c,d);
  a aa (a,b);
endmodule

module m (.*);
  input [8:0] a;
  input [7:0] b;
  input c;
  output d;
endmodule
module a (.*);
endmodule

// equivalent to writing
module m1 (a,b,c,d);
  input a,b,c;
  output d;
endmodule

module a1 #(parameter size = 8, parameter type TP = logic [7:0])
         (input [size:0] a, output TP b);
endmodule

module sv12_lrm_p0685_module_top;
  top1 top1();
  top2 top2();
  m1 mm1();
  a1 aa1();
endmodule : sv12_lrm_p0685_module_top

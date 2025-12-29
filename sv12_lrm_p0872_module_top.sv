////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        872
// Description: setting parameters in configurations
// Note:        Typo fix in line 30-33
//
////////////////////////////////////////////////////////////////

module adder #(parameter ID = "id", 
                         W = 8,
                         D = 512)
             ();
  initial $display("ID = %s, W = %d, D = %d", ID, W, D);
endmodule: adder

module top; 
  parameter WIDTH = 16; 
  adder a1 ();
endmodule

config cfg1;
  design rtlLib.top;
  instance top use #(.WIDTH(32)); 
  instance top.a1 use #(.W(top.WIDTH));
endconfig

module top4;
  parameter S = 16;
  adder #(.ID("a1")) a1(); 
  adder #(.ID("a2")) a2(); 
  adder #(.ID("a3")) a3(); 
  adder #(.ID("a4")) a4();
endmodule

config cfg2;
  localparam S = 24;
  design rtlLib.top4;
  instance top4.a1 use #(.W(top4.S)); 
  instance top4.a2 use #(.W(S));
endconfig

module top5;
  parameter WIDTH = 64, DEPTH = 1024, ID = "A1"; 
  adder #(.ID(ID), .W(WIDTH), .D(DEPTH)) a1 ();
endmodule

config cfg3;
  design rtlLib.top5;
  instance top5.a1 use #(.W()); // set only parameter W back to its default
endconfig

config cfg4;
  design rtlLib.top; 
  instance top.a1 use #();  // set all parameters in instance a1
                            // back to their defaults
endconfig

module sv12_lrm_p0872_module_top;
  top top();
  top4 top4();
  top5 top5();
endmodule : sv12_lrm_p0872_module_top

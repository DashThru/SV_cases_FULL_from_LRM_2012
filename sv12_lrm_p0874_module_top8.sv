////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        874
// Description: configuration with a defparam statement
// Note:        
//
////////////////////////////////////////////////////////////////

module top8;
  parameter WIDTH = 32;
  adder #(.ID("a1")) a1 ();
  adder #(.ID("a2"),.W(WIDTH)) a2 ();
endmodule

module adder #(parameter ID = "id", 
                         W = 8,
                         D = 512)
             ();
  initial $display("ID = %s, W = %d, D = %d", ID, W, D);
endmodule

config cfg6;
  design rtlLib.test;
  instance test.t use #(.WIDTH(48));
endconfig

module sv12_lrm_p0874_module_top8;
  top8 t();
  defparam t.WIDTH = 64; 
  defparam t.a1.W = 16; 
endmodule : sv12_lrm_p0874_module_top8

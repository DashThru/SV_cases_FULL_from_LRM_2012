////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        706
// Description: the program construct
// Note:        
//
////////////////////////////////////////////////////////////////

program test1 (input clk, input [16:1] addr, inout [7:0] data); 
endprogram

program test2 ( interface device_ifc ); 
endprogram

interface device_ifc;
endinterface

module test();
  int shared; // variable shared by programs p1 and p1
  program p1;
    initial shared =1;
  endprogram
  program p2; 
    initial shared =1;
  endprogram // p1 and p2 are implicitly instantiated once in module test 
endmodule

module sv12_lrm_p0706_program_test_input;
  device_ifc device_ifc();
  test1 test1();
  test2 test2(device_ifc);
  test test();
endmodule : sv12_lrm_p0706_program_test_input

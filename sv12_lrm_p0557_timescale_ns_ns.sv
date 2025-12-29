////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        557
// Description: simulation time system functions
// Note:        
//
////////////////////////////////////////////////////////////////

`timescale 10 ns / 1 ns
module test1;
  logic set;
  parameter p = 1.55;
  initial begin
    $monitor($time,,"set=", set);
    #p set = 0;
    #p set = 1;
  end
endmodule

`timescale 10 ns / 1 ns
module test2;
  logic set;
  parameter p = 1.55;
  initial begin
    $monitor($realtime,,"set=", set);
    #p set = 0;
    #p set = 1;
  end
endmodule

module sv12_lrm_p0557_timescale_ns_ns;
  test1 u_test1();
  test2 u_test2();
endmodule : sv12_lrm_p0557_timescale_ns_ns

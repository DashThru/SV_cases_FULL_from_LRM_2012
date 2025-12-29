////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        304
// Description: clocking block declaration
// Note:        
//
////////////////////////////////////////////////////////////////

module mem;
  logic enable;
endmodule

module sv12_lrm_p0304_clocking_ck1_posedge;

  logic clk,clock1,data,ready,enable,ack,addr;
  mem mem1();

  clocking ck1 @(posedge clk);
    default input #1step output negedge; // legal
    // outputs driven on the negedge clk
    //input ... ;
    //output ... ;
  endclocking

  clocking ck2 @(clk); // no edge specified!
    default input #1step output negedge; // legal
    //input ... ;
    //output ... ;
  endclocking

  clocking bus @(posedge clock1);
    default input #10ns output #2ns;
    input data, ready, enable = sv12_lrm_p0304_clocking_ck1_posedge.mem1.enable;
    output negedge ack;
    input #1step addr;
  endclocking

endmodule : sv12_lrm_p0304_clocking_ck1_posedge

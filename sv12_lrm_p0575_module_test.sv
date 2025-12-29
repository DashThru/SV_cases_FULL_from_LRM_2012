////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        575
// Description: assertion control system tasks
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0575_module_test;

  logic clk;
  logic a, b;
  logic c, d;
  // Define lets to make the code more readable.
  let LOCK = 1;
  let UNLOCK = 2;
  let ON = 3;
  let OFF = 4;
  let KILL = 5;
  let CONCURRENT = 1;
  let S_IMMEDIATE = 2; // simple immediate
  let D_IMMEDIATE = 12; // Final and Observed deferred immediate
  let EXPECT = 16;
  let UNIQUE = 32; // unique if and case violation
  let UNIQUE0 = 64; // unique0 if and case violation
  let PRIORITY = 128; // priority if and case violation
  let ASSERT = 1;
  let COVER = 2;
  let ASSUME = 4;
  let ALL_DIRECTIVES = (ASSERT|COVER|ASSUME);
  let ALL_ASSERTS = (CONCURRENT|S_IMMEDIATE|D_IMMEDIATE|EXPECT);
  let VACUOUSOFF = 11;
  a1: assert property (@(posedge clk) a |=> b) $info("assert passed");
      else $error("assert failed");
  c1: cover property (@(posedge clk) a ##1 b);

  always @(posedge clk) begin
    ia1: assert (a);
  end

  always_comb begin
    if (c)
      df1: assert #0 (d);
    unique if ((a==0) || (a==1)) $display("0 or 1");
    else if (a == 2) $display("2");
    else if (a == 4) $display("4"); // values 3,5,6,7 cause a violation
  end

  initial begin
    $assertcontrol(VACUOUSOFF, CONCURRENT | EXPECT);
    $assertcontrol(OFF);
    #20 $assertcontrol(ON, CONCURRENT|S_IMMEDIATE|D_IMMEDIATE,ASSERT|COVER|ASSUME, 0);

    #20 $assertcontrol(ON, UNIQUE|UNIQUE0|PRIORITY);
    #100 $assertcontrol(KILL, CONCURRENT, ASSERT, 0);
    #10 $assertcontrol(ON, CONCURRENT|S_IMMEDIATE|D_IMMEDIATE, ASSERT, 0, c1);
				   
    #10 $assertcontrol(LOCK, ALL_ASSERTS, ALL_DIRECTIVES, 0, a1);
    $assertcontrol(ON); // enable all the assertions except a1
    $assertcontrol(UNLOCK, ALL_ASSERTS, ALL_DIRECTIVES, 0, a1);
  end

endmodule : sv12_lrm_p0575_module_test


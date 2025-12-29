////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        615
// Description: command line input example
// Note:        
//
////////////////////////////////////////////////////////////////

`define STRING logic [1024 * 8:1]

module goodtasks;
  `STRING str;
  integer i1;
  logic [31:0] vect;
  real realvar;
  initial
    begin
      if ($value$plusargs("TEST=%d", i1))
	    $display("value was %d", i1);
      else
        $display("+TEST= not found");
      #100 $finish;
    end
endmodule

module ieee1364_example;
  real frequency;
  logic [8*32:1] testname;
  logic [64*8:1] pstring;
  logic clk;
  initial
    begin
      if ($value$plusargs("TESTNAME=%s",testname))
	    begin
          $display(" TESTNAME= %s.",testname);
          $finish;
        end
      if (!($value$plusargs("FREQ+%0F",frequency)))
	    frequency = 8.33333; // 166 MHz
      $display("frequency = %f",frequency);
      pstring = "TEST%d";
      if ($value$plusargs(pstring, testname))
        $display("Running test number %0d.",testname);
    end
endmodule
// adding the tool's command line the plusarg
//   +TEST=5
// will result in the following output:
//   value was           5
//   frequency = 8.333330
//   Running text number x.
// adding the tool's command line the plusarg
//   +TESTNAME=t1
// will result in the following output:
//   +TEST= not found
//   TESTNAME=            t1.
// adding the tool's command line the plusarg
//   +FREQ+9.234
// will result in the following output:
//   +TEST= not found
//   frequency = 9.234000
// adding the tool's command line the plusarg
//   +TEST23
//   t1.
// will result in the following output:
//   +TEST= not found
//   frequency = 8.333330
//   Running test number 23.

module sv12_lrm_p0615_define_string_logic;

  goodtasks u_goodtasks();
  ieee1364_example u_ieee1364_example();

endmodule : sv12_lrm_p0615_define_string_logic

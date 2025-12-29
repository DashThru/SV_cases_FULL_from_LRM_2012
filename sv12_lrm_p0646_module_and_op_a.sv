////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        646
// Description: `ifdef `else `elsif `endif `ifndef
// Note:        
//
////////////////////////////////////////////////////////////////

module and_op (a, b, c);
  output a;
  input b, c;
  `ifdef behavioral
    wire a = b & c;
  `else
    and a1 (a,b,c);
  `endif
endmodule

module test1(out);
  output out;
  `define wow
  `define nest_one
  `define second_nest
  `define nest_two
  `ifdef wow
    initial $display("wow is defined");
	`ifdef nest_one
      initial $display("nest_one is defined");
	  `ifdef nest_two
        initial $display("nest_two is defined");
      `else
        initial $display("nest_two is not defined");
      `endif
    `else
      initial $display("nest_one is not defined");
    `endif
  `else
    initial $display("wow is not defined");
    `ifdef second_nest
      initial $display("second_nest is defined");
	`else
      initial $display("second_nest is not defined");
	`endif
  `endif
endmodule

module test2;
  `ifdef first_block
    `ifndef second_nest
      initial $display("first_block is defined");
    `else
      initial $display("first_block and second_nest defined");
    `endif
  `elsif second_block
    initial $display("second_block defined, first_block is not");
  `else
    `ifndef last_result
      initial $display("first_block, second_block,",
	     " last_result not defined.");
    `elsif real_last
      initial $display("first_block, second_block not defined,",
         " last_result and real_last defined.");
    `else
      initial $display("Only last_result defined!");
	`endif
  `endif
endmodule

module sv12_lrm_p0646_module_and_op_a;

  and_op and_op();
  test1 test1();
  test2 test2();


endmodule : sv12_lrm_p0646_module_and_op_a

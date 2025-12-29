////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        458
// Description: checker method for a covergroup
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0458_checker_op_test_logic;

  checker op_test (logic clk, vld_1, vld_2, logic [3:0] opcode);
    bit [3:0] opcode_d1;
    always_ff @(posedge clk) opcode_d1 <= opcode;
    covergroup cg_op with function sample(bit [3:0] opcode_d1);
	  cp_op : coverpoint opcode_d1;
    endgroup: cg_op
    cg_op cg_op_1 = new();
    sequence op_accept;
      @(posedge clk) vld_1 ##1 (vld_2, cg_op_1.sample(opcode_d1));
    endsequence
    cover property (op_accept);
  endchecker

  checker counter_model(logic flag);
    bit [2:0] counter = '0;
	always_ff @$global_clock
      counter <= counter + 1'b1;
    assert property (@$global_clock counter == 0 |-> flag);
  endchecker : counter_model

  checker observer_model(bit valid, reset);
    default clocking @$global_clock; endclocking
	rand bit flag;
	m1: assume property (reset |=> !flag);
	m2: assume property (!reset && flag |=> flag);
	m3: assume property ($rising_gclk(flag) |-> valid);
  endchecker : observer_model

endmodule : sv12_lrm_p0458_checker_op_test_logic

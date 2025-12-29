////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        457
// Description: covergroups in checkers
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0457_checker_my_check_logic;

  checker my_check(logic clk, active);
    bit active_d1 = 1'b0;
    always_ff @(posedge clk) begin
	  active_d1 <= active;
    end
    covergroup cg_active @(posedge clk);
	  cp_active : coverpoint active
      {
        bins idle = { 1'b0 };
        bins active = { 1'b1 };
      }
      cp_active_d1 : coverpoint active_d1
	  {
        bins idle = { 1'b0 };
        bins active = { 1'b1 };
      }
      option.per_instance = 1;
    endgroup
    cg_active cg_active_1 = new();
  endchecker : my_check

  checker op_test (logic clk, vld_1, vld_2, logic [3:0] opcode);
    bit [3:0] opcode_d1;
    always_ff @(posedge clk) opcode_d1 <= opcode;
    covergroup cg_op;
      cp_op : coverpoint opcode_d1;
    endgroup: cg_op
    cg_op cg_op_1 = new();
    sequence op_accept;
      @(posedge clk) vld_1 ##1 (vld_2, cg_op_1.sample());
    endsequence
    cover property (op_accept);
  endchecker

endmodule : sv12_lrm_p0457_checker_my_check_logic

////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        305
// Description: clocking input and output skews
// Note:        
//
////////////////////////////////////////////////////////////////

module cpu;
  logic state;
endmodule

module sv12_lrm_p0305_clocking_dram_clk;
  logic clk,address,data,phi1,state,clock,instruction,opcode;
  logic [3:0] regA,regB;
  cpu cpu1();

  clocking dram @(clk);
    input #1ps address;
    input #5 output #6 data;
  endclocking

  clocking cd1 @(posedge phi1);
    input #1step state = sv12_lrm_p0305_clocking_dram_clk.cpu1.state;
  endclocking

  clocking mem @(clock);
    input instruction = { opcode, regA, regB[3:1] };
  endclocking

  initial $display("%b",mem.instruction);

endmodule : sv12_lrm_p0305_clocking_dram_clk

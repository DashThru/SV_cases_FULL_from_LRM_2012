////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        306
// Description: multiple clocking blocks example
// Note:        
//
////////////////////////////////////////////////////////////////

module cpu(input phi, input data, input write);
  logic state;
endmodule

module mem(input phi, input cmd, input enable);
  logic state;
endmodule

program test( input phi1, input [15:0] data, output logic write,
              input phi2, inout [8:1] cmd, input enable
            );
  reg [8:1] cmd_reg;
  clocking cd1 @(posedge phi1);
    input data;
    output write;
    input state = sv12_lrm_p0306_program_test_input.cpu1.state;
  endclocking
  clocking cd2 @(posedge phi2);
    input #2 output #4ps cmd;
    input enable;
  endclocking
  initial begin
    // program begins here
    // user can access cd1.data , cd2.cmd , etc...
    $display("%b",cd1.data);
    $display("%b",cd2.cmd);
  end
  assign cmd = enable ? cmd_reg: 'x;
endprogram

module sv12_lrm_p0306_program_test_input;
  logic phi1, phi2;
  wire [8:1] cmd; // cannot be logic (two bidirectional drivers)
  logic [15:0] data;
  test main (phi1, data, write, phi2, cmd, enable);
  cpu cpu1 (phi1, data, write);
  mem mem1 (phi2, cmd, enable);
endmodule




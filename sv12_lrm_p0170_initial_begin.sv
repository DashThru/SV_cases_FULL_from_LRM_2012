////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        170
// Description: initial begin end procedures
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0170_initial_begin;

  int a,size=10;
  logic [5:0] inputs;
  logic [5:0] memory [100];

  initial begin
    a = 0; // initialize a
    for (int index = 0; index < size; index++)
      memory[index] = 0; // initialize memory word
  end
  
  initial begin
    inputs = 'b000000;     // initialize at time zero
    #10 inputs = 'b011001; // first pattern
    #10 inputs = 'b011011; // second pattern
    #10 inputs = 'b011000; // third pattern
    #10 inputs = 'b001000; // last pattern
  end

endmodule : sv12_lrm_p0170_initial_begin

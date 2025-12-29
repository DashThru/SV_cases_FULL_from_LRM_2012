////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        694
// Description: overriding module parameters
// Note:        
//
////////////////////////////////////////////////////////////////

module generic_fifo
  #(MSB=3, LSB=0) // parameter port list parameters
   (input wire [MSB:LSB] in,
    input wire clk, read, write, reset,
	output logic [MSB:LSB] out,
    output logic full, empty
);
  parameter DEPTH=4; // module item parameter
  localparam FIFO_MSB = DEPTH*MSB;
  localparam FIFO_LSB = LSB;
    // These constants are local, and cannot be overridden.
    // They can be affected by altering the value parameters above
  logic [FIFO_MSB:FIFO_LSB] fifo;
  logic [DEPTH:0] depth;
  always @(posedge clk or posedge reset) begin
    casez ({read,write,reset})
      0: fifo = 0;
      1: fifo = 1;
    endcase
  end
endmodule

module sv12_lrm_p0694_module_generic_fifo;
  generic_fifo #(5,2) generic_fifo();
endmodule : sv12_lrm_p0694_module_generic_fifo

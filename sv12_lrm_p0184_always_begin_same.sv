////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        184
// Description: conditional event controls
// Note:        
//
////////////////////////////////////////////////////////////////

module latch (output logic [31:0] y, input [31:0] a, input enable);
  always @(a iff enable == 1)
    y <= a; //latch is in transparent mode
endmodule

logic clk;
logic a, b, c;

sequence abc;
  @(posedge clk) a ##1 b ##1 c;
endsequence

program test;
  initial begin
    @ abc $display( "Saw a-b-c" );
  end
endprogram


module sv12_lrm_p0184_always_begin_same;

  // ------------------------------------------------------------
  // State encoding (one-hot)
  localparam IDLE = 0;
  localparam READ = 1;
  localparam DLY  = 2;
  localparam DONE = 3;
  
  // ------------------------------------------------------------
  // Registers / signals
  logic        go;        // input handshake
  logic        ws;        // wait signal
  logic [3:0]  state;     // one-hot current state
  logic [3:0]  next;      // one-hot next state

  always @* begin // same as @(state or go or ws)
    next = 4'b0;
    case (1'b1)
      state[IDLE]: if (go)  next[READ] = 1'b1;
	               else     next[IDLE] = 1'b1;
      state[READ]:          next[DLY ] = 1'b1;
      state[DLY ]: if (!ws) next[DONE] = 1'b1;
                   else     next[READ] = 1'b1;
      state[DONE]:          next[IDLE] = 1'b1;
    endcase
  end

  test u_test();


endmodule : sv12_lrm_p0184_always_begin_same

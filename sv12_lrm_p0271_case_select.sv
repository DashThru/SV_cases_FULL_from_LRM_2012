////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        271
// Description: case statement
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0271_case_select;

  logic [0:3] select,result,flaga,flagb,sig;
  initial begin

  case (select[1:2])
    2'b00: result = 0;
    2'b01: result = flaga;
    2'b0x,
    2'b0z: result = flaga ? 'x : 0;
    2'b10: result = flagb;
    2'bx0,
    2'bz0: result = flagb ? 'x : 0;
    default result = 'x;
  endcase

  case (sig)
    1'bz:    $display("signal is floating");
    1'bx:    $display("signal is unknown");
    default: $display("signal is %b", sig);
  endcase
  end
endmodule : sv12_lrm_p0271_case_select

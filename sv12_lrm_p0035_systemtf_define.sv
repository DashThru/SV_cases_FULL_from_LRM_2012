////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        35
// Description: system tasks and compiler directive examples
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0035_systemtf_define;

initial begin
  $display ("display a message");
  $finish;
end

`define wordsize

endmodule : sv12_lrm_p0035_systemtf_define


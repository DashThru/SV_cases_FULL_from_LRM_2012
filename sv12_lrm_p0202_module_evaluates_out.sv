////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        202
// Description: nonblocking procedural assignments
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0202_module_evaluates_out (out);
  output out;
  logic a, b, c;
  initial begin
    a = 0;
    b = 1;
    c = 0;
    $finish;
  end
  always c = #5 ~c;
  always @(posedge c) begin
    a <= b; // evaluates, schedules,
    b <= a; // and executes in two steps
  end
endmodule



////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        187
// Description: repeat event expression
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0187_repeat_event_expression;

  logic event_expression,a,b;
  int i;

  initial begin
    repeat (3) @ (event_expression);
      // will execute event_expression three times
    repeat (-3) @ (event_expression);
      // will not execute event_expression.
    repeat (i) @ (event_expression);
      // if a is assigned -3, it will execute the event_expression if a is declared as an unsigned variable, but not if a is signed
  end

  initial fork
    #5 a = b;
    #5 b = a;
  join

  initial fork // data swap
    a = #5 b;
    b = #5 a;
  join

endmodule : sv12_lrm_p0187_repeat_event_expression

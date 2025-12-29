////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        192
// Description: begin outer block disable
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0192_begin_outer_block;

  int i,n,d;
  logic a,b,clk,ev1,trig,areg,breg,reset,q,retrig;

  initial begin : outer_block
    for (i = 0; i < n; i = i+1) begin : inner_block
	  @clk
        if (a == 0) // "continue" loop
          disable inner_block ;
      @clk
        if (a == b) // "break" from loop
          disable outer_block;
    end
  end

  initial fork
    begin : event_expr
      @ev1;
      repeat (3) @trig;
      #d areg = breg;
    end
    @reset disable event_expr;
  join

  always begin : monostable
    #250 q = 0;
  end
  
  always @retrig begin
    disable monostable;
	q = 1;
  end

endmodule : sv12_lrm_p0192_begin_outer_block

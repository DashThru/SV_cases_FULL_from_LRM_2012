////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        191
// Description: begin block name
// Note:        
//
////////////////////////////////////////////////////////////////

module m;
  task task1;
  endtask

  initial
    begin : always1
      t1: task1( ); // task call
    end
  initial
    begin
      disable m.always1;  // exit always1, which will exit task1,
    end                   // if it was currently executing
endmodule

module sv12_lrm_p0191_begin_block_name;
  logic a;

  task proc_a;
    begin
      if (a == 0)
        disable proc_a; // return if true
    end
  endtask

  initial begin : block_name
    if (a == 0)
      disable block_name; 
  end // end of named block
  // continue with code following named block

  m um(); 

endmodule : sv12_lrm_p0191_begin_block_name

////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        469
// Description: constrained random concepts and usage
// Note:        
//
////////////////////////////////////////////////////////////////

class XYPair;
  rand integer x, y;
endclass

class MyXYPair extends XYPair;
  function void pre_randomize();
    super.pre_randomize();
    $display("Before randomize x=%0d, y=%0d", x, y);
  endfunction
  function void post_randomize();
    super.post_randomize();
    $display("After randomize x=%0d, y=%0d", x, y);
  endfunction
endclass

module sv12_lrm_p0469_task_exercise_illegal_mybus;

    XYPair xy = new;
    MyXYPair myxy = new;

endmodule : sv12_lrm_p0469_task_exercise_illegal_mybus

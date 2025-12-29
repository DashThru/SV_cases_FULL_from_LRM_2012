////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        641
// Description: define compiler directive
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0641_define_d_x;

  `define D(x,y) initial $display("start", x , y, "end");
  
  `D( "msg1" , "msg2" )
    // expands to 'initial $display("start", "msg1" , "msg2", "end");'
  `D( " msg1", )
    // expands to 'initial $display("start", " msg1" , , "end");'
  `D(, "msg2 ")
    // expands to 'initial $display("start", , "msg2 ", "end");'
  `D(,)
    // expands to 'initial $display("start", , , "end");'
  `D( , )
    // expands to 'initial $display("start", , , "end");'

endmodule : sv12_lrm_p0641_define_d_x

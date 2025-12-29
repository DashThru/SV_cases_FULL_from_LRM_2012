////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        644
// Description: define macro override
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0644_define_msg_x;

  `define msg(x,y) `"x: `\`"y`\`"`"
  initial $display(`msg(left side,right side));
  // expands to: $display("left side: \"right side\"");

  int clock_master;
  `define append(f) f``_master
  initial `append(clock) = 0;
  // expands to: clock_master

  `define home(filename) `"/home/mydir/filename`"
  string fp = `home(myfile);

endmodule : sv12_lrm_p0644_define_msg_x

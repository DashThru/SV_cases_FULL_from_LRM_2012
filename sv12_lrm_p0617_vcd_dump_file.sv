////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        617
// Description: value change dump VCD files
// Note:        
//
////////////////////////////////////////////////////////////////

module dump;
 event do_dump;
 logic clock;
 initial $dumpfile("verilog.dump");
 initial @do_dump
  $dumpvars;  
 //dump variables in the design 
 always @do_dump
  begin 
    $dumpon; 
    //to begin the dump at event do_dump 
    //no effect the first time through 
    repeat (500) @(posedge clock); //dump for 500 cycles 
    $dumpoff; 
 //stop the dump 
 end 
 initial @(do_dump)
  forever #10000 $dumpall; // checkpoint all variables
endmodule 

module mod;
  wire net1;
endmodule

module sv12_lrm_p0617_vcd_dump_file;

  mod mod1();
  mod mod2();
  dump dump();

  initial begin
    $dumpfile ("module1.dump") ;
    $dumpvars (1, sv12_lrm_p0617_vcd_dump_file);
    $dumpvars (0, sv12_lrm_p0617_vcd_dump_file.mod1, sv12_lrm_p0617_vcd_dump_file.mod2.net1);
    #200    $dumpoff;
    #800    $dumpon;  
    $dumpflush ;
    $finish;
  end

endmodule : sv12_lrm_p0617_vcd_dump_file



////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        91
// Description: module lifetime
// Note:        
//
////////////////////////////////////////////////////////////////

module top_legal;
  int svar1 = 1;
  initial begin
    for (int i=0; i<3; i++) begin
	  automatic int loop3 = 0;
      for (int j=0; j<3; j++) begin
        loop3++;
        $display(loop3);
      end
    end // prints 1 2 3 1 2 3 1 2 3
	for (int i=0; i<3; i++) begin
      static int loop2 = 0;
      for (int j=0; j<3; j++) begin
        loop2++;
        $display(loop2);
      end
    end // prints 1 2 3 4 5 6 7 8 9
  end
endmodule : top_legal

program automatic test ;
  int i;             // not within a procedural block - static
  task t ( int a );  // arguments and variables in t are automatic
  endtask            //   unless explicitly declared static
endprogram

module sv12_lrm_p0091_module_top_legal;
  top_legal u_top_legal();
  test u_test();
endmodule : sv12_lrm_p0091_module_top_legal

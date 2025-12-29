////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        272
// Description: case statement with do-not-cares
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0272_logic_ir;

  function instruction1(logic [7:0] ir);  endfunction
  function instruction2(logic [7:0] ir);  endfunction
  function instruction3(logic [7:0] ir);  endfunction
  function instruction4(logic [7:0] ir);  endfunction

  logic [7:0] ir;
  initial casez (ir)
        8'b1???????: instruction1(ir);
	8'b01??????: instruction2(ir);
	8'b00010???: instruction3(ir);
	8'b000001??: instruction4(ir);
  endcase

  task stat1; endtask
  task stat2; endtask
  task stat3; endtask
  task stat4; endtask
  logic [7:0] r, mask;
  initial begin
  mask = 8'bx0x0x0x0;
  casex (r ^ mask)
	8'b001100xx: stat1;
	8'b1100xx00: stat2;
	8'b00xx0011: stat3;
	8'bxx010100: stat4;
  endcase
  end
  
  logic [2:0] encode ;
  initial case (1)
    encode[2] : $display("Select Line 2") ;
    encode[1] : $display("Select Line 1") ;
    encode[0] : $display("Select Line 0") ;
    default     $display("Error: One of the bits expected ON");
  endcase

endmodule : sv12_lrm_p0272_logic_ir

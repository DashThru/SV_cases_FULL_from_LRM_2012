////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        808
// Description: specify edge-sensitive state-dependent paths
// Note:        
//
////////////////////////////////////////////////////////////////

module ALU (o1, i1, i2, opcode); 
  input [7:0] i1, i2;
  input [2:1] opcode;
  output [7:0] o1;
  //functional description omitted
  specify
    // add operation
    if (opcode == 2'b00) (i1,i2 *> o1) = (25.0, 25.0); 
	// pass-through i1 operation
    if (opcode == 2'b01) (i1 => o1) = (5.6, 8.0);
    // pass-through i2 operation
    if (opcode == 2'b10) (i2 => o1) = (5.6, 8.0);
    // delays on opcode changes
    (opcode *> o1) = (6.1, 6.5);
  endspecify
endmodule

module sv12_lrm_p0808_module_alu_o1(input in,clk,clock,reset,clear,cntrl,data, output out, output [3:0] q);

  specify
    if ( !reset && !clear )
        ( posedge clock => ( out +: in ) ) = (10, 8) ;

    ( posedge clk => ( q[0] : data ) ) = (10, 5); 
    ( negedge clk => ( q[0] : data ) ) = (20, 12);
  endspecify
  
  specify
    if (reset)
      (posedge clk => ( q[0] : data ) ) = (15, 8); 
    if (!reset && cntrl)
      (posedge clk => ( q[0] : data ) ) = (6, 2); 
  endspecify

  specify
    if (reset)
      (posedge clk => (q[3:0]:data)) = (10,5); 
    if (!reset)
      (posedge clk => (q[0]:data)) = (15,8); 
  endspecify
  
  ALU ALU();

endmodule : sv12_lrm_p0808_module_alu_o1

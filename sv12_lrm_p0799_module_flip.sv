////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        799
// Description: the syntax for creating a UDP instance
// Note:        
//
////////////////////////////////////////////////////////////////

primitive d_edge_ff (q, clk, d); 
  input clk, d;
  output q; reg q;
  initial q = 1'b1;
  table
  // clk d   q   q+ 
      r  0 : ? : 0 ; 
	  r  1 : ? : 1 ; 
	  f  ? : ? : - ; 
	  ?  * : ? : - ;
  endtable
endprimitive

module flip;
  reg clock, data; 
  parameter p1 = 10; 
  parameter p2 = 33;
  parameter p3 = 12;
  d_edge_ff #p3 d_inst (q, clock, data);
  initial begin
    data = 1;
    clock = 1;
    #(20 * p1) $finish;
  end
  always #p1 clock = ~clock; 
  always #p2 data = ~data;
endmodule

module sv12_lrm_p0799_module_flip;
  flip flip();
endmodule : sv12_lrm_p0799_module_flip

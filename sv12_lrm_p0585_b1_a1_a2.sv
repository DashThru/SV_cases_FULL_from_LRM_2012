////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        585
// Description: logic array personality formats
// Note:        
//
////////////////////////////////////////////////////////////////

module async_array(a1,a2,a3,a4,a5,a6,a7,b1,b2,b3);
  input a1, a2, a3, a4, a5, a6, a7 ;
  output b1, b2, b3;
  logic [1:7] mem[1:3]; // memory declaration for array personality
  logic b1, b2, b3;
  initial begin
    // set up the personality from the file array.dat
    $readmemb("array.dat", mem);
    // set up an asynchronous logic array with the input
    // and output terms expressed as concatenations
    $async$and$array(mem,{a1,a2,a3,a4,a5,a6,a7},{b1,b2,b3});
  end
endmodule

module sync_array(a1,a2,a3,a4,a5,a6,a7,bb1,bb2,bb3,clk);
  input a1, a2, a3, a4, a5, a6, a7, clk;
  output bb1, bb2, bb3;
  logic [1:7] mem[1:3]; // memory declaration
  logic bb1, bb2, bb3;
  initial begin
    // set up the personality
    $readmemb("array.dat", mem);
    // set up a synchronous logic array to be evaluated
	// when a positive edge on the clock occurs
	forever @(posedge clk)
      $async$and$array(mem,{a1,a2,a3,a4,a5,a6,a7},{bb1,bb2,bb3});
  end
endmodule

module sv12_lrm_p0585_b1_a1_a2;

  wire a1, a2, a3, a4, a5, a6, a7;
  logic b1, b2, b3, bb1, bb2, bb3,clk;
  wire [1:7] awire;
  logic [1:3] breg;

  async_array u_async_array(.*);
  sync_array u_sync_array(.*);

endmodule : sv12_lrm_p0585_b1_a1_a2

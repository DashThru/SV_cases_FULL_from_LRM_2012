////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        49
// Description: struct declaration
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0049_struct;
 
  logic clk,sel;

  struct {
    bit [7:0] A;
	bit [7:0] B;
	byte C;
  } abc;

  assign abc.C = sel ? 8'hBE : 8'hEF;
  
  not (abc.A[0],abc.B[0]),
      (abc.A[1],abc.B[1]),
      (abc.A[2],abc.B[2]),
      (abc.A[3],abc.B[3]);

  always @(posedge clk) abc.B <= abc.B + 1;
  
  always @(posedge clk) abc.A[7:4] <= !abc.B[7:4];

endmodule : sv12_lrm_p0049_struct

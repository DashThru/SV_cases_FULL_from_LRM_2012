////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        103
// Description: aggregate structure
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0103_struct_bit_opcode;


  struct { bit [7:0] opcode; bit [23:0] addr; } IR;  //anonymous structure defines variable IR
  initial begin
    IR.opcode = 1;  // set field in IR.
  end

  typedef struct {
    bit [7:0] opcode;
    bit [23:0] addr;
  } instruction; // named structure type
  instruction IR2; // define variable

endmodule : sv12_lrm_p0103_struct_bit_opcode

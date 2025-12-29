////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        107
// Description: tagged unions
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0107_b_u1_bit_slice;

  typedef union tagged {
    void Invalid;
    int Valid;
  } VInt;
  
  typedef union tagged {
    struct {
      bit [4:0] reg1, reg2, regd;
	} Add;
    union tagged {
	  bit [9:0] JmpU;
	  struct {
        bit [1:0] cc;
        bit [9:0] addr;
	  } JmpC;
    } Jmp;
  } Instr;

endmodule : sv12_lrm_p0107_b_u1_bit_slice

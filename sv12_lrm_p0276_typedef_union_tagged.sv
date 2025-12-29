////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        276
// Description: pattern matching in case statements
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0276_typedef_union_tagged;


  typedef union tagged {
    void Invalid;
    int Valid;
  } VInt;
  VInt v;
  initial case (v) matches
    tagged Invalid : $display ("v is Invalid");
    tagged Valid .n : $display ("v is Valid with value %d", n);
  endcase

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
  
  Instr instr;
  bit [31:0] rf [0:31];   // register file
  bit [31:0] pc;          // program counter

  initial case (instr) matches
    tagged Add '{.r1, .r2, .rd} &&& (rd != 0) : rf[rd] = rf[r1] + rf[r2];
    tagged Jmp .j : case (j) matches
                          tagged JmpU .a : pc = pc + a;
                          tagged JmpC '{.c, .a}: if (rf[c]) pc = a;
                        endcase
  endcase

  initial case (instr) matches 
    tagged Add '{.*, .*, 0}: ; // no op 
    tagged Add '{.r1, .r2, .rd} : rf[rd] = rf[r1] + rf[r2];
    tagged Jmp .j : case (j) matches 
                      tagged JmpU .a    : pc = pc + a;
                      tagged JmpC '{.c, .a} : if (rf[c]) pc = a;
                    endcase 
  endcase


endmodule : sv12_lrm_p0276_typedef_union_tagged

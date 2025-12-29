////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        277
// Description: pattern matching in case statements
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0277_case_instr_matches;

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
    tagged Add .s: case (s) matches
                     '{.*,.*,0} : ; // no op
                     '{.r1, .r2, .rd}  : rf[rd] = rf[r1] + rf[r2];
                  endcase
    tagged Jmp .j: case (j) matches
                     tagged JmpU .a : pc = pc + a;
                     tagged JmpC '{.c, .a} : if (rf[c]) pc = a;
                   endcase
  endcase

  initial case (instr) matches
    tagged Add '{.r1, .r2, .rd} &&& (rd != 0) : rf[rd] = rf[r1] + rf[r2];
    tagged Jmp (tagged JmpU .a) : pc = pc + a;
    tagged Jmp (tagged JmpC '{.c, .a}) : if (rf[c]) pc = a;
  endcase

endmodule : sv12_lrm_p0277_case_instr_matches

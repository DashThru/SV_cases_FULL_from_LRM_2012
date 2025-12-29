////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        278
// Description: pattern matching in if statements
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0278_case_instr_matches;

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
  
  Instr instr,e,j;
  bit [31:0] rf [0:31];   // register file
  bit [31:0] pc;          // program counter

  initial case (instr) matches
    tagged Add '{reg2:.r2,regd:.rd,reg1:.r1} &&& (rd != 0): rf[rd] = rf[r1] + rf[r2];
    tagged Jmp (tagged JmpU .a) : pc = pc + a;
    tagged Jmp (tagged JmpC '{addr:.a,cc:.c}) : if (rf[c]) pc = a;
  endcase
  
  initial if (e matches (tagged Jmp (tagged JmpC '{cc:.c,addr:.a}))) $display("haha"); // c and a can be used here
  else $display("hehe");

  initial if (e matches (tagged Jmp .j) &&& j matches (tagged JmpC '{cc:.c,addr:.a})) $display("haha"); // c and a can be used here
  else $display("hehe");
  
  initial if (e matches (tagged Jmp (tagged JmpC '{cc:.c,addr:.a})) &&& (rf[c] != 0)) $display("haha"); // c and a can be used here
  else $display("hehe");

endmodule : sv12_lrm_p0278_case_instr_matches

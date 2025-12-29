////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        252
// Description: tagged union expressions and member access
// Note:        Typo fix in line 43
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0252_typedef_union_tagged;

  typedef union tagged {
    void Invalid;
    int Valid;
  } VInt;
  VInt vi1, vi2;

  initial begin
    vi1 = tagged Valid (23+34);  // Create Valid int
    vi2 = tagged Invalid;        // Create an Invalid value
  end

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

  Instr i1, i2;
  bit [4:0] x;
  bit e = 1'b0,e1,ed,e2;

  initial begin
    // Create an Add instruction with its 3 register fields
    i1 = ( e
           ? tagged Add '{ e1, 4, ed }                  // struct members by position
           : tagged Add '{ reg2:e2, regd:3, reg1:19 }); // by name (order irrelevant)
    // Create a Jump instruction, with "unconditional" sub-opcode
    i1 = tagged Jmp (tagged JmpU 239);
    // Create a Jump instruction, with "conditional" sub-opcode
    i2 = tagged Jmp (tagged JmpC '{ 2, 83 }); // inner struct by position
    i2 = tagged Jmp (tagged JmpC '{ cc:2, addr:83 }); // by name

    x = i1.Add.reg1;
    i1.Add = '{19, 4, 3};
    i1.Add.reg2 = 4;
  end

endmodule : sv12_lrm_p0252_typedef_union_tagged

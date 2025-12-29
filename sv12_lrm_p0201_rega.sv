////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        201
// Description: blocking procedural assignments
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0201_rega;
  logic [0:7] rega,regb;
  logic [7:0] mema [100];
  logic carry,acc;
  int address;

  initial begin
    rega = 0;
    rega[3] = 1;  // a bit-select
    rega[3:5] = 7;  // a part-select
    mema[address] = 8'hff;  // assignment to a mem element
    {carry, acc} = rega + regb;  // a concatenation
  end

endmodule : sv12_lrm_p0201_rega

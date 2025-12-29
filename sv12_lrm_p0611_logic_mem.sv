////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        611
// Description: loading memory array data from a file
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0611_logic_mem;

  logic [7:0] mem[1:256];
  logic [31:0] me [0:2][0:4][5:8];  // test $readmemb and $readmemh, etc...
  
  
  initial $readmemh("mem.data", mem);
  initial $readmemh("mem.data", mem, 16);
  initial $readmemh("mem.data", mem, 128, 1);
  initial $readmemh("mem.data", me, 1, 1);

endmodule : sv12_lrm_p0611_logic_mem

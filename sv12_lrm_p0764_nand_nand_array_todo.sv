////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        764
// Description: primitive instance connection list
// Note:        
//
////////////////////////////////////////////////////////////////

module driver (in, out, en); 
  input [3:0] in;
  output [3:0] out;
  input en;
  bufif0 ar[3:0] (out, in, en); // array of three-state buffers 
endmodule

module driver_equiv (in, out, en); 
  input [3:0] in;
  output [3:0] out;
  input en;
  bufif0 ar3 (out[3], in[3], en); // each buffer declared separately 
  bufif0 ar2 (out[2], in[2], en);
  bufif0 ar1 (out[1], in[1], en);
  bufif0 ar0 (out[0], in[0], en);
endmodule

module busdriver (busin, bushigh, buslow, enh, enl); 
  input [15:0] busin;
  output [ 7:0] bushigh, buslow;
  input enh, enl;
  driver busar3 (busin[15:12], bushigh[7:4], enh);
  driver busar2 (busin[11:8], bushigh[3:0], enh);
  driver busar1 (busin[7:4], buslow[7:4], enl);
  driver busar0 (busin[3:0], buslow[3:0], enl);
endmodule

module busdriver_equiv (busin, bushigh, buslow, enh, enl); 
  input [15:0] busin;
  output [ 7:0] bushigh, buslow;
  input enh, enl;
  driver busar[3:0] (.out({bushigh, buslow}), .in(busin), 
                     .en({enh, enh, enl, enl}));
endmodule


module sv12_lrm_p0764_nand_nand_array_todo;
  driver driver();
  driver_equiv driver_equiv();
  busdriver busdriver();
  busdriver_equiv busdriver_equiv();
endmodule : sv12_lrm_p0764_nand_nand_array_todo

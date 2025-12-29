////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        763
// Description: the gate type specification
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0763_nor_highz1_strong0;

  wire out1,in1,in2;

  nor (highz1,strong0) n1(out1,in1,in2);
  
  nand #2 t_nand3[0:7](out1,in1,in2);
  nand #2 x_nand[0:3] (out1,in1,in2), y_nand[4:7] (out1,in1,in2);

endmodule : sv12_lrm_p0763_nor_highz1_strong0

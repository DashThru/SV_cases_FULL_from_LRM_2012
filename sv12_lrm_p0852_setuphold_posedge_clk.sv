////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        852
// Description: requirements for accurate simulation
// Note:        Typo fix in line 21
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0852_setuphold_posedge_clk(input CLK,D,DATA,DATA1,DATA2, output Q);

  wire del_CLK,del_DATA1,dCLK,dD;

  specify
    $setuphold(posedge CLK, DATA, -10, 20);
    $setuphold(posedge CLK, DATA1, -10, 20); 
    $setuphold(posedge CLK, DATA2, -15, 18);
    $setuphold(posedge CLK, DATA1, -10, 20,,,, del_CLK, del_DATA1); 
    $setuphold(posedge CLK, DATA2, -15, 18);

    (CLK => Q) = 6;
    $setuphold (posedge CLK, posedge D, -3, 8, , , , dCLK, dD); 
    $setuphold (posedge CLK, negedge D, -7, 13, , , , dCLK, dD);
  endspecify

endmodule : sv12_lrm_p0852_setuphold_posedge_clk

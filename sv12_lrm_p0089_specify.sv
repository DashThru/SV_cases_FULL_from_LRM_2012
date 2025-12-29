////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        89
// Description: specify parameter
// Note:        
//
////////////////////////////////////////////////////////////////

module RAM16GEN ( output [7:0] DOUT,
                  input [7:0] DIN,
				  input [5:0] ADR,
                  input WE, CE);
  specify
    specparam tRise_clk_q = 150, tFall_clk_q = 200;
    specparam tRise_control = 40, tFall_control = 50;
  endspecify

  specparam dhold = 1.0;
  specparam ddly = 1.0;
  parameter width = 1;
endmodule

module sv12_lrm_p0089_specify;

  RAM16GEN u_RAM16GEN();

endmodule : sv12_lrm_p0089_specify

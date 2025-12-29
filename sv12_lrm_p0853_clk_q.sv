////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        853
// Description: conditions in negative timing checks
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0853_clk_q(input clk,data,CP,D,TI,TE);

  logic cond1,ntfr,notifier;
  specify
    specparam tsetup=1,thold=2;
    $setup (data, clk &&& cond1, tsetup, ntfr);
    $hold (clk, data &&& cond1, thold, ntfr);
    $setuphold( clk, data, tsetup, thold, ntfr, , cond1);
  endspecify
  
  wire TE_cond_D,TE_cond_TI,DXTI_cond,dTE,dTI,dCP,dD;

  assign TE_cond_D = (dTE !== 1'b1); 
  assign TE_cond_TI = (dTE !== 1'b0); 
  assign DXTI_cond = (dTI !== dD);
  specify
    $setuphold(posedge CP, D, -10, 20, notifier, ,TE_cond_D, dCP, dD); 
    $setuphold(posedge CP, TI, 20, -10, notifier, ,TE_cond_TI, dCP, dTI);
    $setuphold(posedge CP, TE, -4, 8, notifier, ,DXTI_cond, dCP, dTE); 
  endspecify

endmodule : sv12_lrm_p0853_clk_q

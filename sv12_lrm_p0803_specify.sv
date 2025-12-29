////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        803
// Description: specify block declaration
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0803_specify(input clk,d,A,B,C,D, output q,Q);

  specify
    specparam tRise_clk_q = 150, tFall_clk_q = 200; 
    specparam tSetup = 70;
    (clk => q) = (tRise_clk_q, tFall_clk_q); 
    $setup(d, posedge clk, tSetup);
    (A => Q) = 10;
    (B => Q) = (12);
    (C, D *> Q) = 18;
  endspecify

endmodule : sv12_lrm_p0803_specify

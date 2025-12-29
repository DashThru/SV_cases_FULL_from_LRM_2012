////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        316
// Description: synchronous drives
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0316_dom_sig_entire;

  logic clk;
  logic [7:0] sig;

  clocking dom @(negedge clk);
    output sig;
  endclocking
  
  initial begin
    dom.sig      <= 1;      // entire clockvar
    dom.sig[2]   <= 1;   // bit-select
    dom.sig[8:2] <= 1; // slice
  end
endmodule : sv12_lrm_p0316_dom_sig_entire

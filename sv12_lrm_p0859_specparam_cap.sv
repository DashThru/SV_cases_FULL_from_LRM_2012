////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        859
// Description: SDF annotation of specparams
// Note:        
//
////////////////////////////////////////////////////////////////

module clock(clk);
  output clk;
  reg clk;
  specparam dhigh=1, dlow=2; 
  initial clk = 0;
  always 
    begin
    #dhigh clk = 1; // Clock remains low for time dlow 
                    // before transitioning to 1
    #dlow clk = 0;  // Clock remains high for time dhigh 
                    // before transitioning to 0
    end
endmodule

module sv12_lrm_p0859_specparam_cap(input A,clk, output Z);

  specparam cap = 0;
  specify
    (A => Z) = 1.4 * cap + 0.7;
  endspecify

  clock clock(clk);
  initial #100 $finish;
endmodule : sv12_lrm_p0859_specparam_cap

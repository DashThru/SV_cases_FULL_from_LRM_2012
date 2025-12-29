////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        181
// Description: d rega regb delay control
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0181_d_rega_regb;

   logic rega,regb,regr,clock,r;
   int d,e;
   
  initial begin
    #10 rega = regb;
    #d rega = regb;          // d is defined as a parameter
    #((d+e)/2) rega = regb;  // delay is average of d and e
    #regr regr = regr + 1;   // delay is the value in regr

    @r rega = regb;  // controlled by any value change in the reg r
    @(posedge clock) rega = regb;         // controlled by posedge on clock
    forever @(negedge clock) rega = regb; // controlled by negedge on clock
    forever @(edge clock) rega = regb;    // controlled by edge on clock
  end
endmodule : sv12_lrm_p0181_d_rega_regb

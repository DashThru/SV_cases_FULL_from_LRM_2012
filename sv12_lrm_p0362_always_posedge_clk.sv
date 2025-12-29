////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        362
// Description: sampled value functions $rose and $past
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0362_always_posedge_clk;

  logic clk,reg1,a,b,in1,enable;

  always @(posedge clk)
    reg1 <= a & $rose(b);

  always @(posedge clk)
    reg1 <= $past(in1, , enable);

endmodule : sv12_lrm_p0362_always_posedge_clk

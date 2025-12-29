////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        363
// Description: sampled value functions
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0363_always_posedge_clk;

  logic clk,clk2,reg1,reg3,a,b,d,q,out,done,enable;
  logic [7:0] reg2,g,cond;

  always @(posedge clk)
    reg1 <= a & $past(b);

  always @(posedge clk)
    for (int i = 0; i < 4; i ++)
      if (cond[i])
        reg2[i] <= $past(g[i]);

  always @(posedge clk)
    if (enable) q <= d;

  always @(posedge clk)
    assert property (done |=> (out == $past(q, 2,enable)) );

  bit fclk, req, gnt, en;
  a1: assert property
        (@(posedge clk) en && $rose(req) |=> gnt);
  a2: assert property
        (@(posedge clk) en && $rose(req, @(posedge fclk)) |=> gnt);

  always_ff @(posedge clk)
    reg3 <= $rose(b, @(posedge clk2));


endmodule : sv12_lrm_p0363_always_posedge_clk

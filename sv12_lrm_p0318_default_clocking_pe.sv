////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        318
// Description: driving clocking output signals
// Note:        
//
////////////////////////////////////////////////////////////////

module m;
  bit a = 1'b1,clk,x;
  default clocking cb @(posedge clk);
    output a;
  endclocking
  initial begin
    ## 1;
    cb.a <= 1'b0;
    @(x); // x is triggered by reactive stimulus running in same time step
    cb.a <= 1'b1;
  end
endmodule

module n;
  bit v,clk;
  default clocking cb @(posedge clk);
    output v;
  endclocking
  initial begin
    ##1;                   // Wait until cycle 1
    cb.v <= 1;             // Matures in cycle 1, v is assigned expr1
    cb.v <= ##2 1;         // Matures in cycle 3
    #1 cb.v <= ##2 1;      // Matures in cycle 3
    ##1 cb.v <= ##1 1;     // Matures in cycle 3, v is assigned expr4
  end
endmodule

module sv12_lrm_p0318_default_clocking_pe;

  logic clk, nibble;

  default clocking pe @(posedge clk);
    output nibble; // four bit output
  endclocking
  
  initial begin
    ##2;
    pe.nibble <= 4'b0101;
    pe.nibble <= 4'b0011;
  end

  m um();
  n un();
endmodule : sv12_lrm_p0318_default_clocking_pe

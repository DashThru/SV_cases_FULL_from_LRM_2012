////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        317
// Description: synchronous drive for default clocking
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0317_bus_data_h5;

  logic clk,v,a,b,c;
  logic [7:0] data,r;

  clocking bus @(posedge clk); // Assume clk has a period of #10 units
    output data;
  endclocking

  initial begin
    bus.data[3:0] <= 4'h5;  // drive data in Re-NBA region of the current cycle
    ##1 bus.data <= 8'hz;   // wait 1 default clocking cycle, then drive data
    ##2; bus.data <= 2;     // wait 2 default clocking cycles, then drive data
    bus.data <= ##2 r;      // remember the value of r and then drive data 2 (bus) cycles later
  end

  default clocking cb @(posedge clk); // Assume clk has a period of #10 units
    output v;
  endclocking
  
  initial begin
    #3 cb.v <= 1;  // Matures in cycle 1; equivalent to ##1 cb.v <= expr1
  end

  clocking cb1 @(posedge clk);
    inout a;
    output b;
  endclocking

  initial begin
    cb1.a <= c;     // The value of a will change in the Re-NBA region
    cb1.b <= cb1.a;  // b is assigned the value of a before the change
  end
endmodule : sv12_lrm_p0317_bus_data_h5

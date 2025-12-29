////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        433
// Description: disabling procedural concurrent assertions
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0433_default_clocking_posedge;

  logic clk,clear_b2,bad_val,bad_val_ok,a,b,c;
  default clocking @(posedge clk); endclocking

  always @(bad_val or bad_val_ok) begin : b1
    a1: assert property (bad_val) else $fatal(1, "Sorry");
	if (bad_val_ok) begin
           disable a1;
	end
  end

  always @(a or b or c) begin : b2
    if (c == 8'hff) begin
      a2: assert property (a && b);
    end else begin
      a3: assert property (a || b);
    end
  end
  always @(clear_b2) begin : b3
    disable b2;
  end

endmodule : sv12_lrm_p0433_default_clocking_posedge

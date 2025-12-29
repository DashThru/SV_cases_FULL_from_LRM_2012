////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        188
// Description: fork data shift
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0188_fork_data_shift;

  logic clk,a,b,c,data,phi1,phi2;
  int num;

  initial fork // data shift
    a = @(posedge clk) b;
    b = @(posedge clk) c;
  join

  initial a <= repeat(5) @(posedge clk) data;

  initial a = repeat(num) @(clk) data;
  
  initial a <= repeat(a+b) @(posedge phi1 or negedge phi2) data;

  initial a <= repeat(a+b) @(edge phi1) data;

endmodule : sv12_lrm_p0188_fork_data_shift

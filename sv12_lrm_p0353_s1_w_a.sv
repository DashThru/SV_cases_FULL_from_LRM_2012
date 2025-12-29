////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        353
// Description: reference to a typed formal argument
// Note:        Typo fix in line 38
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0353_s1_w_a;

  logic clk,x,y,z,t;

  default clocking pe @(posedge clk);
  endclocking  

  sequence delay_arg_example (max, shortint delay1, delay2, min);
    x ##delay1 y[*min:max] ##delay2 z;
  endsequence
  parameter my_delay=2;
  cover property (delay_arg_example($, my_delay, my_delay-1, 3));

  cover property (x ##2 y[*3:$] ##1 z);
  
  sequence event_arg_example (event ev);
    @(ev) x ##1 y;
  endsequence
  
  cover property (event_arg_example(posedge clk));
  
  cover property (@(posedge clk) x ##1 y);
  
  sequence event_arg_example2 (reg sig);
    @(posedge sig) x ##1 y;
  endsequence
  cover property (event_arg_example2(clk));
  
  cover property (@(posedge clk) x ##1 y);
  
  sequence s(bit a, bit b);
    bit loc_a;
    (1'b1, loc_a = a) ##0
    (t == loc_a) [*0:$] ##1 b;
  endsequence

endmodule : sv12_lrm_p0353_s1_w_a

////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        351
// Description: declaring sequences
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0351_sequence_delay_example_x;

  logic clk,sysclk,a,b,c,d,e,f,g,h,i,j,k,l,x,y; 
  logic frame,trans,start_trans,end_trans;
  logic [0:7] c_be,data_bus; 
 
  sequence delay_example(x, y, min, max, delay1);
    x ##delay1 y[*min:max];
  endsequence
  
  // Legal
  a1: assert property (@(posedge clk) delay_example(x, y, 3, $, 2));

  sequence s1;
    @(posedge clk) a ##1 b ##1 c;
  endsequence
  sequence s2;
    @(posedge clk) d ##1 e ##1 f;
  endsequence
  sequence s3;
    @(negedge clk) g ##1 h ##1 i;
  endsequence
  sequence s4;
    @(edge clk) j ##1 k ##1 l;
  endsequence

  sequence s20_1(data,en);
    (!frame && (data==data_bus)) ##1 (c_be[0:3] == en);
  endsequence
  
  sequence s;
    a ##1 b ##1 c;
  endsequence

  sequence rule1;
    @(posedge sysclk)
    trans ##1 start_trans ##1 s ##1 end_trans;
  endsequence
  
  sequence rule2;
    @(posedge sysclk)
    trans ##1 start_trans ##1 (a ##1 b ##1 c) ##1 end_trans ;
  endsequence

endmodule : sv12_lrm_p0351_sequence_delay_example_x

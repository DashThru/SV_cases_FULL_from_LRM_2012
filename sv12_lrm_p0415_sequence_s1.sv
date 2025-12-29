////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        415
// Description: sequence clock flow
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0415_sequence_s1;

  logic a,b,c,d,e,f,clk,clk1,clk2;

  sequence s1;
    a ##1 b; // unclocked sequence
  endsequence
  sequence s2;
    c ##1 d; // unclocked sequence
  endsequence
  
  sequence mult_s;
    @(posedge clk) a ##1 @(posedge clk1) s1 ##1 @(posedge clk2) s2;
  endsequence
  
  property mult_p1;
    @(posedge clk) a ##1 @(posedge clk1) s1 ##1 @(posedge clk2) s2;
  endproperty
  
  property mult_p2;
    mult_s;
  endproperty
  
  property mult_p3;
    @(posedge clk) a ##1 @(posedge clk1) s1 |=> @(posedge clk2) s2;
  endproperty

  property mult_p6;
    mult_s |=> mult_s;
  endproperty
  
  property mult_p7;
    @(posedge clk) a ##1 b |-> c ##1 @(posedge clk1) d;
  endproperty
  
  property mult_p8;
    @(posedge clk) a ##1 b |->
	if (c)
      (1 |=> @(posedge clk1) d)
	else
      e ##1 @(posedge clk2) f ;
  endproperty


endmodule : sv12_lrm_p0415_sequence_s1

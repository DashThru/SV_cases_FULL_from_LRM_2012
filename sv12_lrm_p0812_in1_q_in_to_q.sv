////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        812
// Description: specify module path polarity
// Note:        Typo fix in line 30
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0812_in1_q_in_to_q(input In1,s,clk,clr,pre, output q);

  specify
    specparam In_to_q = 3.2,s_to_q = 4.5;
    // Unknown polarity 
    (In1 => q) = In_to_q ; 
    (s *> q) = s_to_q ;
    
     // Positive polarity
    (In1 +=> q) = In_to_q ;
    (s +*> q) = s_to_q ;
    
    // Negative polarity
    (In1 -=> q) = In_to_q ;
    (s -*> q) = s_to_q ;
  endspecify

  specify
    // Specify Parameters
    specparam tRise_clk_q = 45:150:270, tFall_clk_q=60:200:350; 
    specparam tRise_control = 35:40:45, tFall_control=40:50:65;
    // Module Path Assignments
    (clk => q) = (tRise_clk_q, tFall_clk_q);
    (clr, pre *> q) = (tRise_control, tFall_control);
  endspecify

endmodule : sv12_lrm_p0812_in1_q_in_to_q

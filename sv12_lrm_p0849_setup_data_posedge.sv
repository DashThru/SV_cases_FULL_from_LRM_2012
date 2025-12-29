////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        849
// Description: enabling timing checks with conditioned events
// Note:        Typo fix in line 14
//
////////////////////////////////////////////////////////////////

module DFF (Q, CLK, DAT); 
  input CLK;
  input [7:0] DAT; 
  output logic [7:0] Q; 
  always @(posedge CLK)
    Q = DAT;
  specify
    $setup (DAT, posedge CLK, 10);
  endspecify
endmodule

module sv12_lrm_p0849_setup_data_posedge(input clk,data,clr,set);

  logic clr_and_set;
  and new_gate( clr_and_set, clr, set );

  specify
    $setup( data, posedge clk, 10 );
    $setup( data, posedge clk &&& clr, 10 ) ;
    $setup( data, posedge clk &&& (~clr), 10 ) ; 
    $setup( data, posedge clk &&& (clr===0), 10 );
    $setup( data, posedge clk &&& clr_and_set, 10 );
  endspecify

  logic Q, CLK, DAT;
  DFF DFF(Q, CLK, DAT);

endmodule : sv12_lrm_p0849_setup_data_posedge

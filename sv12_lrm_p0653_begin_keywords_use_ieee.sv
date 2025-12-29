////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        653
// Description: begin end keywords directive
// Note:        
//
////////////////////////////////////////////////////////////////

`begin_keywords "1364-2001"  // use IEEE Std 1364-2001 Verilog keywords
module m2 ();
  reg [63:0] logic;          // OK: "logic" is not a keyword in 1364-2001
endmodule
`end_keywords

`begin_keywords "1800-2005" // use IEEE Std 1800-2005 SystemVerilog keywords
interface if1 ();
endinterface
`end_keywords

module sv12_lrm_p0653_begin_keywords_use_ieee;
  m2 um2();
  if1 uif1();
endmodule : sv12_lrm_p0653_begin_keywords_use_ieee

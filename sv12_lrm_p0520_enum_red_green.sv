////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        520
// Description: defining the coverage model
// Note:        
//
////////////////////////////////////////////////////////////////

enum { red, green, blue } color;
logic clk;
covergroup g1 @(posedge clk);
  c: coverpoint color;
endgroup

class xyz;
  bit [3:0] m_x;
  int m_y;
  bit m_z;
  covergroup cov1 @m_z;
    coverpoint m_x;
	coverpoint m_y;
  endgroup
  function new(); cov1 = new; endfunction
endclass

module sv12_lrm_p0520_enum_red_green;
  
  enum { red, green, blue } color;
  bit [3:0] pixel_adr, pixel_offset, pixel_hue;
  
  covergroup g2 @(posedge clk);
    Hue: coverpoint pixel_hue;
	Offset: coverpoint pixel_offset;
    AxC: cross color, pixel_adr;    // cross 2 variables (implicitly declared
                                    // coverpoints)
	all: cross color, Hue, Offset;  // cross 1 variable and 2 coverpoints
  endgroup

  g1 g10=new;
  g2 g20=new;
  xyz xyz=new;

endmodule : sv12_lrm_p0520_enum_red_green

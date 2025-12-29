////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        521
// Description: using covergroup in classes
// Note:        
//
////////////////////////////////////////////////////////////////

class MC;
  logic [3:0] m_x;
  local logic m_z;
  bit m_e;
  logic clk;
  covergroup cv1 @(posedge clk); coverpoint m_x; endgroup
  covergroup cv2 @m_e ; coverpoint m_z; endgroup
endclass 

class Helper;
  int m_ev;
endclass

class MyClass;
  Helper m_obj;
  int m_a;
  covergroup Cov @(m_obj.m_ev);
    coverpoint m_a;
  endgroup
  function new();
    m_obj = new;
    Cov = new;
  endfunction
endclass

module sv12_lrm_p0521_class_helper;
  MC mc=new;
  MyClass mcl=new;

  class C1;
    bit [7:0] x;
    logic clk;
    covergroup cv (int arg) @(posedge clk);
      option.at_least = arg;
      coverpoint x;
    endgroup
    function new(int p1);
      cv = new(p1);
    endfunction
  endclass

  initial begin
    C1 obj = new(4);
  end
endmodule : sv12_lrm_p0521_class_helper

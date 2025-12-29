////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        140
// Description: typed constructor calls
// Note:        
//
////////////////////////////////////////////////////////////////

class C; endclass
class D extends C; endclass
class E #(type T = int) extends C;
  T x;
  function new(T x_init);
    super.new();
    x = x_init;
  endfunction
endclass

module sv12_lrm_p0140_class_c_endclass;

  C c = D::new;  // variable c of superclass type C now references
                 // a newly constructed object of type D

  D d  = new;
  C c1 = d;
  C c2;
 
  initial begin
    c2 = E #(.T(byte))::new(.x_init(5));
  end


endmodule : sv12_lrm_p0140_class_c_endclass

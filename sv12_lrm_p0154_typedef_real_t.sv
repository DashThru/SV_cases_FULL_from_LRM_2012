////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        154
// Description: class out-of-block methods
// Note:        
//
////////////////////////////////////////////////////////////////

typedef real T;

class C;
  typedef int T;
  extern function T f();
  extern function real f2();
endclass

function C::T C::f();  // the return must use the scope resolution
  return 1;            // since the type is defined within the class
endfunction

function real C::f2();
  return 1.0;
endfunction

module sv12_lrm_p0154_typedef_real_t;
  C c   = new;
endmodule : sv12_lrm_p0154_typedef_real_t

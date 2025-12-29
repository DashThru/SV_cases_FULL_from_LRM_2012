////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        157
// Description: class resolution operator for parameterized classes
// Note:        
//
////////////////////////////////////////////////////////////////

class C #(int p = 1);
  parameter int q = 5; // local parameter
  static task t;
    int p;
    int x = C::p;  // C::p disambiguates p
                   // C::p is not p in the default specialization
  endtask
endclass

class D #(int p = 1, type T = int);
  extern static function T f();
endclass

function D::T D::f();
  return p + D::p;
endfunction


module sv12_lrm_p0157_class_c_int;

  int y = C#()::p;  // legal; refers to parameter p in the default
                    // specialization of C
  typedef C T;  // T is a default specialization, not an alias to
                // the name "C"
  int z = T::p;  // legal; T::p refers to p in the default specialization
  int v = C#(3)::p;  // legal; parameter p in the specialization of C#(3)
  int w = C#()::q;   // legal; refers to the local parameter
  T obj = new();
  int u = obj.q;     // legal; refers to the local parameter

  initial $display("%0d %0d", D#()::f(),D#(5)::f()); // output is "2 10"

endmodule : sv12_lrm_p0157_class_c_int

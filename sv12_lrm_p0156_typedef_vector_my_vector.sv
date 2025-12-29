////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        156
// Description: class parameter definition
// Note:        
//
////////////////////////////////////////////////////////////////

class C #(type T = bit); endclass  // base class
class D1 #(type P = real) extends C; endclass  // T is bit (the default)
class D2 #(type P = real) extends C #(integer); endclass  // T is integer
class D3 #(type P = real) extends C #(P); endclass  // T is P
class D4 #(type P = C#(real)) extends P; endclass   // for default T is real

class CA #(int p = 1);
endclass

class DA #(int p);
endclass


module sv12_lrm_p0156_typedef_vector_my_vector;
  CA obj; // legal; equivalent to "C#() obj";
endmodule : sv12_lrm_p0156_typedef_vector_my_vector

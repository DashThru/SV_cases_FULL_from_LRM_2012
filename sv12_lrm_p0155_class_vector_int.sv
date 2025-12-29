////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        155
// Description: parameterized classes definition
// Note:        
//
////////////////////////////////////////////////////////////////

class vector #(int size = 1);
  bit [size-1:0] a;
endclass

class stack #(type T = int);
  local T items[];
  task push( T a ); endtask
  task pop( ref T a ); endtask
endclass

class vector1 #(int size = 1);
  bit [size-1:0] a;
  static int count = 0;
  function void disp_count();
    $display( "count: %d of size %d", count, size );
  endfunction
endclass

module sv12_lrm_p0155_class_vector_int;

  vector #(10) vten;        // object with vector of size 10
  vector #(.size(2)) vtwo;  // object with vector of size 2
  typedef vector#(4) Vfour; // Class with vector of size 4

  stack is;              // default: a stack of ints
  stack#(bit[1:10]) bs;  // a stack of 10-bit vector
  stack#(real) rs;       // a stack of real numbers

  typedef vector1 my_vector;  // use default size of 1
  vector1#(6) vx;             // use size 6

  typedef vector1#(4) Vfour1;
  typedef stack#(Vfour1) Stack4;
  Stack4 s1, s2; // declare objects of type Stack4



endmodule : sv12_lrm_p0155_class_vector_int

////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        152
// Description: class scope with nested class
// Note:        
//
////////////////////////////////////////////////////////////////

class StringList;
  class Node; // Nested class for a node in a linked list.
    string name;
    Node link;
  endclass
endclass

class StringTree;
  class Node; // Nested class for a node in a binary tree.
    string name;
    Node left, right;
  endclass
endclass
// StringList::Node is different from StringTree::Node

class Outer;
  int              outerProp;
  local int        outerLocalProp;
  static int       outerStaticProp;
  static local int outerLocalStaticProp;
  class Inner;
    function void innerMethod(Outer h);
	  outerStaticProp = 0;
        // Legal, same as Outer::outerStaticProp
	  outerLocalStaticProp = 0;
        // Legal, nested classes may access local's in outer class
	  h.outerProp = 0;
        // Legal, qualified access.
	  h.outerLocalProp = 0;
        // Legal, qualified access and locals to outer class allowed.
	endfunction
  endclass
endclass

module sv12_lrm_p0152_b_print_base;
   StringList sl = new;
   StringTree st = new;
   Outer      ot = new;
endmodule : sv12_lrm_p0152_b_print_base

////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        143
// Description: class shallow copying
// Note:        
//
////////////////////////////////////////////////////////////////

class baseA ;
  integer j = 5;
endclass

class B ;
  integer i = 1;
  baseA a = new;
endclass

class xtndA extends baseA;
  rand int x;
  constraint cst1 { x < 10; }
endclass

class Packet ;
  int i;
  function copy(Packet p);
    this.i = p.i;
  endfunction
  
endclass

module sv12_lrm_p0143_class_basea;

  function integer test;
    xtndA xtnd1;
    baseA base2, base3;
    B b1 = new;         // Create an object of class B
    B b2 = new b1;      // Create an object that is a copy of b1
    b2.i = 10;          // i is changed in b2, but not in b1
    b2.a.j = 50;        // change a.j, shared by both b1 and b2
    test = b1.i;        // test is set to 1 (b1.i has not changed)
    test = b1.a.j;      // test is set to 50 (a.j has changed)
	xtnd1 = new;        // create a new instance of class xtndA
	xtnd1.x = 3;
    base2 = xtnd1;      // base2 refers to the same object as xtnd1
	base3 = new base2;  // Creates a shallow copy of xtnd1
  endfunction


  //b1.a.j // reaches into a, which is a property of b1
  //p.next.next.next.val // chain through a sequence of handles to get to val

  Packet p1 = new;
  Packet p2 = new;
  initial p2.copy(p1);


endmodule : sv12_lrm_p0143_class_basea

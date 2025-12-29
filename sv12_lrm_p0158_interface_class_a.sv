////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        158
// Description: interface class definition
// Note:        
//
////////////////////////////////////////////////////////////////

interface class A;
endclass

class B implements A;
endclass

class C extends B;
endclass

interface class PutImp#(type PUT_T = logic);
  pure virtual function void put(PUT_T a);
endclass

interface class GetImp#(type GET_T = logic);
  pure virtual function GET_T get();
endclass

class Fifo#(type T = logic, int DEPTH=1) implements PutImp#(T), GetImp#(T);
  T myFifo [$:DEPTH-1];
  virtual function void put(T a);
    myFifo.push_back(a);
  endfunction
  virtual function T get();
    get = myFifo.pop_front();
  endfunction
endclass

class Stack#(type T = logic, int DEPTH=1) implements PutImp#(T), GetImp#(T);
  T myFifo [$:DEPTH-1];
  virtual function void put(T a);
    myFifo.push_front(a);
  endfunction
  virtual function T get();
    get = myFifo.pop_front();
  endfunction
endclass

module sv12_lrm_p0158_interface_class_a;
  C c = new;
  Fifo fifo =new;
  Stack stack =new;

endmodule : sv12_lrm_p0158_interface_class_a

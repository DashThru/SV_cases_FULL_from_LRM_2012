////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        161
// Description: interface class inherited virtual method
// Note:        
//
////////////////////////////////////////////////////////////////

interface class IntfClass;
  pure virtual function bit funcBase();
  pure virtual function bit funcExt();
endclass

class BaseClass;
  virtual function bit funcBase();
    return (1);
  endfunction
endclass

class ExtClass extends BaseClass implements IntfClass;
  virtual function bit funcExt();
    return (0);
  endfunction
endclass

interface class IntfClass1;
  pure virtual function void f();
endclass

class BaseClass1;
  function void f();
    $display("Called BaseClass1::f()");
  endfunction
endclass

class ExtClass1 extends BaseClass1 implements IntfClass1;
  virtual function void f();
    $display("Called ExtClass1::f()");
  endfunction
endclass

module sv12_lrm_p0161_interface_class_intfclass;
  ExtClass ext = new;
  ExtClass1 ext1 = new;
endmodule : sv12_lrm_p0161_interface_class_intfclass

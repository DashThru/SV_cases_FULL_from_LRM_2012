////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        164
// Description: class method name conflict resolution
// Note:        
//
////////////////////////////////////////////////////////////////

interface class IntfBase1;
  pure virtual function bit funcBase();
endclass

interface class IntfBase2;
  pure virtual function bit funcBase();
endclass

virtual class ClassBase;
  pure virtual function bit funcBase();
endclass

class ClassExt extends ClassBase implements IntfBase1, IntfBase2;
  virtual function bit funcBase();
    return (0);
  endfunction
endclass

interface class PutImp#(type T = logic);
  pure virtual function void put(T a);
endclass

interface class GetImp#(type T = logic);
  pure virtual function T get();
endclass

interface class PutGetIntf#(type TYPE = logic) extends PutImp#(TYPE), GetImp#(TYPE);
  typedef TYPE T;
endclass

module sv12_lrm_p0164_interface_class_putimp;
  ClassExt ce = new;
endmodule : sv12_lrm_p0164_interface_class_putimp

////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        163
// Description: casting and object reference assignment
// Note:        
//
////////////////////////////////////////////////////////////////

interface class PutImp #(type T = bit);
endclass

interface class GetImp #(type T = bit);
endclass

class Fifo #(type T = int) implements PutImp#(T), GetImp#(T);
endclass

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

module sv12_lrm_p0163_getimp_int_get_ref;

Fifo#(int) fifo_obj_o = new;
PutImp#(int) put_ref_o = fifo_obj_o;
GetImp#(int) get_ref;

Fifo#(int) fifo_obj = new;
PutImp#(int) put_ref = fifo_obj;

initial begin
  $cast(get_ref, put_ref);
  $cast(fifo_obj, put_ref); // legal
  $cast(put_ref, fifo_obj); // legal, but casting is not required
end

endmodule : sv12_lrm_p0163_getimp_int_get_ref

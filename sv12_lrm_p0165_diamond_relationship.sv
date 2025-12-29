////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        165
// Description: interface class diamond relationship
// Note:        
//
////////////////////////////////////////////////////////////////

interface class IntfBase;
  parameter SIZE = 64;
endclass

interface class IntfExt1 extends IntfBase;
  pure virtual function bit funcExt1();
endclass

interface class IntfExt2 extends IntfBase;
  pure virtual function bit funcExt2();
endclass

interface class IntfExt3 extends IntfExt1, IntfExt2;
endclass


interface class AIntfBase #(type T = int);
  pure virtual function bit funcBase();
endclass

interface class AIntfExt1 extends AIntfBase#(bit);
  pure virtual function bit funcExt1();
endclass

interface class AIntfExt2 extends AIntfBase#(logic);
  pure virtual function bit funcExt2();
endclass

interface class AIntfFinal extends AIntfExt1, AIntfExt2;
  typedef bit T; // Override the conflicting identifier name
  pure virtual function bit funcBase();
endclass



module sv12_lrm_p0165_diamond_relationship;
endmodule : sv12_lrm_p0165_diamond_relationship

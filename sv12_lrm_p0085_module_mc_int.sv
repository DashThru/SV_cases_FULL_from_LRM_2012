////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        85
// Description: module mc int
// Note:        
//
////////////////////////////////////////////////////////////////

module mc #(int N = 5, M = N*16, type T = int, T x = 0) ();
endmodule

class Mem #(type T, int size);
  T words[size];
endclass

typedef Mem#(byte, 1024) Kbyte;

module sv12_lrm_p0085_module_mc_int;
  mc u_mc();
  Kbyte u_Kbyte;
endmodule : sv12_lrm_p0085_module_mc_int

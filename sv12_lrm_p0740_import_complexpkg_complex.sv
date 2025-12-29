////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        740
// Description: referencing data in packages
// Note:        
//
////////////////////////////////////////////////////////////////

package ComplexPkg; 
  typedef struct {
    shortreal i, r; 
  } Complex;
  function Complex add(Complex a, b); 
    add.r = a.r + b.r;
    add.i = a.i + b.i;
  endfunction
  function Complex mul(Complex a, b); 
    mul.r = (a.r * b.r) - (a.i * b.i); 
	mul.i = (a.r * b.i) + (a.i * b.r);
  endfunction 
endpackage : ComplexPkg

package p;
  typedef enum { FALSE, TRUE } bool_t;
endpackage

package q;
  typedef enum { ORIGINAL, FALSE } teeth_t;
endpackage

module top1 ;
  import p::*; 
  import q::teeth_t;
  teeth_t myteeth;
  initial myteeth = q:: FALSE; // OK:
endmodule

module top2 ;
  import p::*;
  import q::teeth_t, q::ORIGINAL, q::FALSE;
  teeth_t myteeth;
  initial begin
     myteeth = FALSE; // OK: Direct reference to FALSE refers to the 
  end                 // FALSE enumeration literal imported from q
endmodule

module sv12_lrm_p0740_import_complexpkg_complex;
  import ComplexPkg::*;
  top1 top1();
  top2 top2();
endmodule : sv12_lrm_p0740_import_complexpkg_complex

////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        739
// Description: package declarations
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


module sv12_lrm_p0739_package_complexpkg;

  ComplexPkg::Complex a,b;
  ComplexPkg::Complex cout = ComplexPkg::mul(a, b);

endmodule : sv12_lrm_p0739_package_complexpkg

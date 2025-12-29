////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        15
// Description: package ComplexPkg
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

module sv12_lrm_p0015_complexpkg;
  import ComplexPkg::*;   // use the package

  Complex a;              // declare a variable of package type
  Complex b;              // minimal usage, no initialization or behavior
  Complex c;
endmodule


////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        223
// Description: operator expression short circuiting
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0223_logic_rega_regb;


  logic regA, regB, regC, result ;
  
  function logic myFunc(logic x);
  endfunction
  
  initial result = regA & (regB | myFunc(regC)) ;  // only && || -> ?:  short circuit, NOT &
    // Even if regA is known to be zero, the subexpression (regB | myFunc(regC)) will be evaluated and any
    // side effects caused by calling myFunc(regC) will occur.

  int a=3,b=4,c=5,d[6];
  initial if ((a=b)) b = (a+=1);
  
  initial a = (b = (c = 5));
  
  initial d[3]+=2; // same as a[i] = a[i] +2;
endmodule : sv12_lrm_p0223_logic_rega_regb

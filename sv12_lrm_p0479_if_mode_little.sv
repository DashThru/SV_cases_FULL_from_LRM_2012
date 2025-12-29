////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        479
// Description: rand if-else constraints
// Note:        
//
////////////////////////////////////////////////////////////////

class C;
  rand logic mode,little,big;
  rand int len;

  constraint c1 {
  if (mode == little)
    len < 10;
  else if (mode == big)
    len > 100;}

  constraint c2 {
  if (mode != big)
    if (mode == little)
      len < 10;
    else // the else applies to preceding if
      len > 100;}
endclass

class D;
  rand byte A[] ;
  constraint C1 { foreach ( A [ i ] ) A[i] inside {2,4,8,16}; }
  constraint C2 { foreach ( A [ j ] ) A[j] > 2 * j; }
endclass

module sv12_lrm_p0479_if_mode_little;
  C c=new;
  D d=new;
endmodule : sv12_lrm_p0479_if_mode_little

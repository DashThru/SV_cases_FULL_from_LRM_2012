////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        229
// Description: logical operators
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0229_rega_alpha_beta;
  logic regA,regB,alpha,beta;
  int a=1,size=10,b=2,c=3,index=6,lastone=10;

  int inword =100;

  initial begin


    regA = alpha && beta;  // regA is set to 0
    regB = alpha || beta;  // regB is set to 1
    
    regB = a < size-1 && b != c && index != lastone;
    
    regB = (a < size-1) && (b != c) && (index != lastone);

    if (!inword) ;
    
    if (inword == 0) ;


  end
endmodule : sv12_lrm_p0229_rega_alpha_beta

////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        255
// Description: operator overloading
// Note:        Deprecated since SV2017
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0255_typedef_struct;


  typedef struct {
    bit sign;
    bit [3:0] exponent;
    bit [10:0] mantissa;
  } float;
  
  bind + function float faddif(int, float);
  bind + function float faddfi(float, int);
  bind + function float faddrf(real, float);
  bind + function float faddrf(shortreal, float);
  bind + function float faddfr(float, real);
  bind + function float faddfr(float, shortreal);
  bind + function float faddff(float, float);
  bind + function float fcopyf(float);     // unary +
  bind + function float fcopyi(int);       // unary +
  bind + function float fcopyr(real);      // unary +
  bind + function float fcopyr(shortreal); // unary +

  float A, B, C, D;
  assign A = B + C;    //equivalent to A = faddff(B, C);
  assign D = A + 1.0;  //equivalent to A = faddfr(A, 1.0);

endmodule : sv12_lrm_p0255_typedef_struct

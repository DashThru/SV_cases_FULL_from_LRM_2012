////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        256
// Description: overloading the assignment operator
// Note:        Deprecated since SV2017
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0256_function_float_fcopyi;

  typedef struct packed {
    logic        sign;
    logic [7:0]  exponent;
    logic [22:0] mantissa;
  } float;
  

  function float fcopyi (int i); 
    float o;
    o.sign = i[31];
    o.exponent = 0;
    o.mantissa = 0;
    return o;
  endfunction

  function float fcopyr (real i); 
    float o;
    o.sign = i;
    o.exponent = 0;
    o.mantissa = 0;
    return o;
  endfunction

  bind = function float fcopyi(int);  // cast int to float
  bind = function float fcopyr(real);  // cast real to float
  bind = function float fcopyr(shortreal);  // cast shortreal to float

  float A, B;
  wire clock;
  bind + function float faddff(float, float);
  always @(posedge clock) A += B;  // equivalent to A = A + B

endmodule : sv12_lrm_p0256_function_float_fcopyi

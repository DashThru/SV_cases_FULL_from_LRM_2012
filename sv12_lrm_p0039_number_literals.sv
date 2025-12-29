////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        39
// Description: number literal and unsized literal examples
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0039_number_literals;

  logic [15:0] a, b, c, d;

  initial begin
    a = '0;  // sets all 16bits to 0
    b = '1;  // sets all 16bits to 1
    c = 'x;  // sets all 16bits to x
    d = 'z;  // sets all 16bits to z
  end

  // dummy variables for literal evaluation (minimal additions for legal compilation)
  int _v1, _v2, _v3;
  real _r1, _r2, _r3, _r4, _r5, _r6, _r7, _r8, _r9;

  initial begin
    _v1 = 27_195_000;               // unsized decimal 27195000
    _v2 = 16'b0011_0101_0001_1111;  // 16-bit binary number
    _v3 = 32 'h 12ab_f001;          // 32-bit hexadecimal number

    _r1 = 1.2;
    _r2 = 0.1;
    _r3 = 2394.26331;
    _r4 = 1.2E12;    // (the exponent symbol can be e or E)
    _r5 = 1.30e-2;
    _r6 = 0.1e-0;
    _r7 = 23E10;
    _r8 = 29E-2;
    _r9 = 236.123_763_e-12;  // (underscores are ignored)
  end

endmodule : sv12_lrm_p0039_number_literals


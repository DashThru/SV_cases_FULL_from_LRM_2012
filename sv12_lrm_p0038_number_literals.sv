////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        38
// Description: number literal examples
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0038_number_literals;

  int v[20];
  logic [11:0] a, b, c, d;
  logic [84:0] e, f, g;

  initial begin
    v[0] = 659       ;// is a decimal number
    v[1] = 'h 837FF  ;// is a hexadecimal number
    v[2] = 'o7460    ;// is an octal number

    v[3] = 4'b1001   ;// is a 4-bit binary number
    v[4] = 5 'D 3    ;// is a 5-bit decimal number
    v[5] = 3'b01x    ;// is a 3-bit number with the least significant bit unknown
    v[6] = 12'hx     ;// is a 12-bit unknown number
    v[7] = 16'hz     ;// is a 16-bit high-impedance number

    v[8] = -8 'd 6   ;// this defines the two's complement of 6, held in 8 bits-equivalent to -(8'd 6)
    v[9] = 4 'shf    ;// this denotes the 4-bit number '1111', to be interpreted as a 2's complement number, or '-1'. This is equivalent to -4'h 1
    v[10] = -4 'sd15 ;// this is equivalent to -(-4'd 1), or '0001'
    v[10] = 16'sd?   ;// the same as 16'sbz

    a = 'h x;     // yields xxx
    b = 'h 3x;    // yields 03x
    c = 'h z3;    // yields zz3
    d = 'h 0z3;   // yields 0z3
	
    e = 'h5;      // yields {82{1'b0},3'b101}
    f = 'hx;      // yields {85{1'hx}}
    g = 'hz;      // yields {85{1'hz}}
  end

endmodule : sv12_lrm_p0038_number_literals


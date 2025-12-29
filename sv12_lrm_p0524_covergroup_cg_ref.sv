////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        524
// Description: defining coverage points
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0524_covergroup_cg_ref;
  logic reset,s0;


  covergroup cg ( ref int x , ref int y, input int c);
    coverpoint x;       // creates coverpoint "x" covering the formal "x"
    b: coverpoint y;    // creates coverpoint "b" covering the formal "y"
    cx: coverpoint x;   // creates coverpoint "cx" covering the formal "x"
    option.weight = c;  // set weight of "cg" to value of formal "c"
    bit [7:0] d: coverpoint y[31:24]; // creates coverpoint "d" covering the
                                      // high order 8 bits of the formal "y"
    e: coverpoint x {
      option.weight = 2;  // set the weight of coverpoint "e"
    }
    cross x, y {          // Creates implicit coverpoint "y" covering
                          // the formal "y". Then creates a cross of
                          // coverpoints "x", "y"
      option.weight = c;  // set weight of cross to value of formal "c"
    }
  endgroup

  covergroup g4;
    coverpoint s0 iff(!reset);
  endgroup

endmodule : sv12_lrm_p0524_covergroup_cg_ref

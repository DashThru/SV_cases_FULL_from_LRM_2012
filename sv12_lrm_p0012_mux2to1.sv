////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        12
// Description: combined port and type declaration
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0012_mux2to1 (input wire a, b, sel, // combined port and type declaration
                output logic y);
  always_comb begin // procedural block
    if (sel) y = a; // procedural statement
    else y = b;
  end
endmodule: sv12_lrm_p0012_mux2to1


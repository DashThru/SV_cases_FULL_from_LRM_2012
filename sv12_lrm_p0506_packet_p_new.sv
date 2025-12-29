////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        506
// Description: random weighted caserandcase
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0506_packet_p_new;

  int x;

  initial randcase
    3 : x = 1;
    1 : x = 2;
    4 : x = 3;
  endcase
  
  byte a, b;

  initial randcase
    a + b : x = 1;
    a - b : x = 2;
    a ^ ~b : x = 3;
    12'h800 : x = 4;
  endcase

endmodule : sv12_lrm_p0506_packet_p_new

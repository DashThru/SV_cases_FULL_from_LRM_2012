////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        273
// Description: unique-case, unique0-case, and priority-case
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0273_bit_a;


  bit [2:0] a;
  initial unique case(a) // values 3,5,6,7 cause a violation report
       0,1: $display("0 or 1");
       2: $display("2");
       4: $display("4");
  endcase
  
  initial priority casez(a) // values 4,5,6,7 cause a violation report
    3'b00?: $display("0 or 1");
    3'b0??: $display("2 or 3");
  endcase

  initial unique0 case(a) // values 3,5,6,7 do not cause a violation report
    0,1: $display("0 or 1");
    2: $display("2");
    4: $display("4");
  endcase

endmodule : sv12_lrm_p0273_bit_a

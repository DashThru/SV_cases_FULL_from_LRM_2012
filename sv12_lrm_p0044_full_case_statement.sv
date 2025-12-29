////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        44
// Description: full case parallel case statement
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0044_full_case_statement;

  bit a;
  bit r;

  always @ (*)
  (* full_case, parallel_case *)
  case (a)
     0: r=0;
     1: r=1;
  endcase
  
  always @ (*)
  (* full_case=1 *)
  (* parallel_case=1 *) // Multiple attribute instances also OK
  case (a)
     0: r=0;
     1: r=1;
  endcase

  always @ (*)
  (* full_case, // no value assigned
   parallel_case=1 *)
  case (a)
     0: r=0;
     1: r=1;
  endcase
  
  always @ (*)
  (* full_case *) // parallel_case not specified
  case (a)
     0: r=0;
     1: r=1;
  endcase
  
  always @ (*)
  (* full_case=1, parallel_case = 0 *)
  case (a)
     0: r=0;
     1: r=1;
  endcase
endmodule : sv12_lrm_p0044_full_case_statement

////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        124
// Description: associative array literals
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0124_string_aa_int;

  string aa[int];
  byte ix;
  int status;
  initial begin
    aa[ 1000 ] = "a";
    status = aa.first( ix );  // status is -1. ix is 232 (least significant 8 bits of 1000)
  end

  string words [int] = '{default: "hello"};
  integer tab [string] = '{"Peter":20, "Paul":22, "Mary":23, default:-1 };

endmodule : sv12_lrm_p0124_string_aa_int

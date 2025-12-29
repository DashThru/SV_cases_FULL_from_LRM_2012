////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        213
// Description: structure assignment patterns override
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0213_typedef_struct;


  typedef struct {
    logic [7:0] a;
    bit b;
    bit signed [31:0] c;
	string s;
  } sa;
  
  sa s2;

  initial s2 = '{int:1, default:0, string:""};  // set all to 0 except the array of bits to 1 and string to ""
  initial #10 s2 = '{default:'1, s : ""};       // set all to 1 except s to ""

endmodule : sv12_lrm_p0213_typedef_struct

////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        241
// Description: streaming concatenation as an assignment target
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0241_int_a_b;
  int a, b, c;
  logic [10:0] up [3:0];
  logic [11:1] p1, p2, p3, p4;
  bit [96:1] y = {>>{ a, b, c }};  // OK: pack a, b, c
  bit [99:0] d = {>>{ a, b, c}};   // OK: d is padded with 4 bits

  initial begin

    {>>{ a, b, c }} = 96'b1;         // OK: unpack a = 0, b = 0, c = 1
    {>>{ a, b, c }} = 100'b1;        // OK: unpack as above (4 bits unread)
    {>>{p1, p2, p3, p4}} = up;       // OK: unpack p1 = up[3], p2 = up[2],
                                   // p3 = up[1], p4 = up[0]
  end
endmodule : sv12_lrm_p0241_int_a_b

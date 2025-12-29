////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        182
// Description: event control and event or operator
// Note:        
//
////////////////////////////////////////////////////////////////

class Packet;
  logic status;
endclass

module sv12_lrm_p0182_real_aor_dynamic;

  real AOR[];                        // dynamic array of reals
  byte stream[$];                    // queue of bytes
  initial wait(AOR.size() > 0) ;     // waits for array to be allocated
  initial wait($bits(stream) > 60);  // waits for total number of bits in stream greater than 60

  Packet p = new; // Packet 1 -- Packet is defined in 8.2
  Packet q = new; // Packet 2
  initial fork
    @(p.status);  // Wait for status in Packet 1 to change
    @p;           // Wait for a change to handle p
    # 10 p = q;   // triggers @p.
    // @(p.status) now waits for status in Packet 2 to change,
    // if not already different from Packet 1
  join

  logic trig,enable,rega,regb,clk_a,clk_b;
  logic a,b,c,d,e,clk,rstn;

  initial @(trig or enable) rega = regb; // controlled by trig or enable
  initial @(posedge clk_a or posedge clk_b or trig) rega = regb;

  always @(a, b, c, d, e) rega = regb;
  always @(posedge clk, negedge rstn) rega = regb;
  always @(a or b, c, d or e) rega = regb;

endmodule : sv12_lrm_p0182_real_aor_dynamic

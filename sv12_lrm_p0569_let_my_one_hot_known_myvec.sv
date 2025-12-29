////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        569
// Description: bit vector system functions
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0569_let_my_one_hot_known_myvec;


  // Custom one-hot that, unlike $onehot, fails on any X or Z
  let my_one_hot_known(myvec) = (
                                 ($countones(myvec) == 1) &&
                                 ($countbits(myvec,'x,'z) == 0) );

  logic [1:0] bad_bits;
  logic [31:0] myvec;
  logic design_initialization_done;
  always_comb begin
    if (!design_initialization_done) begin
      bad_bits[0] = 'x;
      bad_bits[1] = 'x; // Repeated control_bit same as single occurrence
    end else begin
      bad_bits[0] = 'x;
      bad_bits[1] = 'z;
    end
    // Z allowed during initialization, but no Z or X allowed afterwards
    a1: assert ($countbits(myvec,bad_bits[0],bad_bits[1]) != 0);
  end  // The control bit arguments to $countbits may be variables

endmodule : sv12_lrm_p0569_let_my_one_hot_known_myvec

////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        459
// Description: checker variables
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0459_rand_bit_r;

  checker reason_about_one_bit(bit [63:0] data1, bit [63:0] data2,
                               event clock);
    rand bit r;
    let a = r ? 3'd3 : 3'd5;

    rand const bit [5:0] idx;
    a1: assert property (@clock data1[idx] == data2[idx]);
  endchecker : reason_about_one_bit

endmodule : sv12_lrm_p0459_rand_bit_r

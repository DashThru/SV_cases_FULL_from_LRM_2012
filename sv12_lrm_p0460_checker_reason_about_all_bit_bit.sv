////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        460
// Description: checker variables
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0460_checker_reason_about_all_bit_bit;
  logic clock;

  checker reason_about_all_bit(bit [63:0] data1, bit [63:0] data2,
                               event clock);
    a1: assert property (@clock data1 == data2);
  endchecker : reason_about_all_bit

  checker data_legal(start_ev, end_ev, in_data, out_data);
    rand const bit [$bits(in_data)-1:0] mem_data;
    sequence transaction;
      start_ev && (in_data == mem_data) ##1 end_ev[->1];
    endsequence
    a1: assert property (@clock transaction |-> out_data == mem_data);
  endchecker : data_legal

  checker data_legal_with_loc(start_ev, end_ev, in_data, out_data);
    sequence transaction (loc_var);
      (start_ev, loc_var = in_data) ##1 end_ev[->1];
    endsequence
    property data_legal;
      bit [$bits(in_data)-1:0] mem_data;
      transaction(mem_data) |-> out_data == mem_data;
    endproperty
    a1: assert property (@clock data_legal);
  endchecker : data_legal_with_loc

endmodule : sv12_lrm_p0460_checker_reason_about_all_bit_bit

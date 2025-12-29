////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        407
// Description: recursive properties
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0407_property_p3_p;

  logic a,b,reset,write_request,write_request_ack,write_request_ack_tag,data_valid,data_valid_tag,retry,retry_tag,last_data_valid;
  logic [0:127] model_data,data;

  property p3(p, bit b, abort);
    (p and (1'b1 |=> p4(p, b, abort)));
  endproperty
  
  property p4(p, bit b, abort);
    accept_on(b) reject_on(abort) p3(p, b, abort);
  endproperty

  property check_write;
    logic [0:127] expected_data;  // local variable to sample model data
    logic [3:0] tag;              // local variable to sample tag
    disable iff (reset)
	(
      write_request && write_request_ack,
      expected_data = model_data,
      tag = write_request_ack_tag
    )
    |=>
    check_write_data_beat(expected_data, tag, 4'h0);
  endproperty

  property check_write_data_beat
  (
    local input logic [0:127] expected_data,
    local input logic [3:0] tag, i
  );
    (
      (data_valid && (data_valid_tag == tag))
      ||
      (retry && (retry_tag == tag))
    )[->1]
	|->
    (
      (
        (data_valid && (data_valid_tag == tag))
        |->
        (data == expected_data[i*8+:8])
      )
      and
      (
        if (retry && (retry_tag == tag))
		(
          1'b1 |=> check_write_data_beat(expected_data, tag, 4'h0)
        )
        else if (!last_data_valid)
		(
          1'b1 |=> check_write_data_beat(expected_data, tag, i+4'h1)
        )
        else
        (
          ##1 (retry && (retry_tag == tag))
          |=>
          check_write_data_beat(expected_data, tag, 4'h0)
        )
      )
    );
  endproperty


endmodule : sv12_lrm_p0407_property_p3_p

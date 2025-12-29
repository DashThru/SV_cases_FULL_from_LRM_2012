////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        71
// Description: string data type
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0071_string_data_type;

  parameter string default_name = "John Smith";
  string myName = default_name;

  byte c = "A";                 // assigns to c "A"
  bit [10:0] b = "\x41";        // assigns to b 'b000_0100_0001
  bit [1:4][7:0] h = "hello" ;  // assigns to h "ello"

endmodule : sv12_lrm_p0071_string_data_type

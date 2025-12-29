////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        104
// Description: packed structures
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0104_struct_packed_signed;

  struct packed signed {
    int a;
    shortint b;
	byte c;
    bit [7:0] d;
  } pack1; // signed, 2-state
  
  struct packed unsigned {
    time a;
    integer b;
    logic [31:0] c;
  } pack2; // unsigned, 4-state

  logic [31:0] c;
  initial begin
   c = pack1[15:8]; // c
  end

  typedef struct packed { // default unsigned
    bit [3:0] GFC;
    bit [7:0] VPI;
    bit [11:0] VCI;
    bit CLP;
    bit [3:0] PT ;
    bit [7:0] HEC;
    bit [47:0] [7:0] Payload;
    bit [2:0] filler;
  } s_atmcell;

endmodule : sv12_lrm_p0104_struct_packed_signed

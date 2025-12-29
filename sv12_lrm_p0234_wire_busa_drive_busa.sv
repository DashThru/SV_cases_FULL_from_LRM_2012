////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        234
// Description: conditional operator
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0234_wire_busa_drive_busa;

  wire drive_busa,data;
  wire [15:0] busa = drive_busa ? data : 16'bz;

endmodule : sv12_lrm_p0234_wire_busa_drive_busa

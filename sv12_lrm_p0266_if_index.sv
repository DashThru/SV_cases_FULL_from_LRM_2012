////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        266
// Description: ifelseif construct
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0266_if_index;
  
  logic indexa,rega,regb,result;
  
  initial if (indexa > 0)
    if (rega > regb)
      result = rega;
    else // else applies to preceding if
      result = regb;
  
  initial if (indexa > 0)
    begin
      if (rega > regb)
	    result = rega;
    end
  else result = regb;

  logic [31:0]  instruction,
                segment_area[255:0];
  logic [7:0]   index;
  logic [5:0]   modify_seg1,
                modify_seg2,
                modify_seg3;
  parameter
      segment1 = 0,  inc_seg1 = 1,
      segment2 = 20, inc_seg2 = 2,
      segment3 = 64, inc_seg3 = 4,
      data = 128;

  // test the index variable
  initial if (index < segment2) begin
    instruction = segment_area [index + modify_seg1];
    index = index + inc_seg1;
  end
  else if (index < segment3) begin
    instruction = segment_area [index + modify_seg2];
    index = index + inc_seg2;
  end
  else if (index < data) begin
    instruction = segment_area [index + modify_seg3];
    index = index + inc_seg3;
  end else
    instruction = segment_area [index];

endmodule : sv12_lrm_p0266_if_index

////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        688
// Description: items declared within each other
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0688_begin;
  initial begin
    fork : mod_1
          reg x;
          mod_2.x = 1;
    join
    fork : mod_2
          reg x;
          mod_1.x = 0;
    join
  end
endmodule : sv12_lrm_p0688_begin

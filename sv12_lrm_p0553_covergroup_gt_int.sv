////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        553
// Description: covergroup type coverage computation
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0553_covergroup_gt_int;

  bit [7:0] a;
  covergroup gt ( int l, h);
    coverpoint a { bins b[] = { [l:h] }; }
  endgroup
  gt gt1 = new (0,1);
  gt gt2 = new (1,2);

  covergroup ga ( int abm);
    option.auto_bin_max = abm;
    coverpoint a { ignore_bins i = {3}; }
  endgroup
  ga ga1 = new (64);
  ga ga2 = new (32);

endmodule : sv12_lrm_p0553_covergroup_gt_int

////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        789
// Description: primitive gate min:typ:max delays
// Note:        
//
////////////////////////////////////////////////////////////////

module iobuf (io1, io2, dir); 
  inout io1, io2, dir;
  bufif0 #(5:7:9, 8:10:12, 15:18:21) b1 (io1, io2, dir);
  bufif1 #(6:8:10, 5:7:9, 13:17:19) b2 (io2, io1, dir);
endmodule

module sv12_lrm_p0789_parameter_min_hi_typ_hi;

  parameter min_hi = 97, typ_hi = 100, max_hi = 107; 
  logic clk;

  always begin
    #(95:100:105) clk = 1;
    #(min_hi:typ_hi:max_hi) clk = 0;
  end
  
  trireg (large) #(0,0,50) cap1;

  iobuf iobuf();
endmodule : sv12_lrm_p0789_parameter_min_hi_typ_hi

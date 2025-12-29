////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        673
// Description: top-level modules and $root
// Note:        
//
////////////////////////////////////////////////////////////////

module mod;
  int C=0;
endmodule

module sv12_lrm_p0673_root_a_b;
  
  int B=0;
  mod mod();
 
  initial begin
    $display($root.sv12_lrm_p0673_root_a_b.B);   // item B within top instance A
    $display($root.sv12_lrm_p0673_root_a_b.mod.C); // item C within instance B within instance A
  end
endmodule : sv12_lrm_p0673_root_a_b

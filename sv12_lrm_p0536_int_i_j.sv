////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        536
// Description: defining cross coverage bins
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0536_int_i_j;


  int i,j;
  covergroup ct;
    coverpoint i { bins i[] = { [0:1] }; }
	coverpoint j { bins j[] = { [0:1] }; }
	x1: cross i,j;
	x2: cross i,j {
	  bins i_zero = binsof(i) intersect { 0 };
          bins ni_zero= !binsof(i) intersect { 0 };
	}
  endgroup

endmodule : sv12_lrm_p0536_int_i_j

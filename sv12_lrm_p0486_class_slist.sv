////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        486
// Description: rand constraint guards
// Note:        Typo fix in line 12
//
////////////////////////////////////////////////////////////////

class SList;
  rand int n;
  rand SList next;
  constraint sort1 { n < next.n; }
  constraint sort2 { if( next != null ) n < next.n; }
endclass


module sv12_lrm_p0486_class_slist;
  SList sl=new;
endmodule : sv12_lrm_p0486_class_slist

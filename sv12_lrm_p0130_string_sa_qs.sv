////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        130
// Description: array locator methods
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0130_string_sa_qs;


  string SA[10], qs[$];
  int IA[int], qi[$];

  initial begin
  // Find all items greater than 5
  qi = IA.find( x ) with ( x > 5 );
  // Find indices of all items equal to 3
  qi = IA.find_index with ( item == 3 );
  // Find first item equal to Bob
  qs = SA.find_first with ( item == "Bob" );
  // Find last item equal to Henry
  qs = SA.find_last( y ) with ( y == "Henry" );
  // Find index of last item greater than Z
  qi = SA.find_last_index( s ) with ( s > "Z" );
  // Find smallest item
  qi = IA.min;
  // Find string with largest numerical value
  qs = SA.max with ( item.atoi );
  // Find all unique string elements
  qs = SA.unique;
  // Find all unique strings in lowercase
  qs = SA.unique( s ) with ( s.tolower );
  end

endmodule : sv12_lrm_p0130_string_sa_qs

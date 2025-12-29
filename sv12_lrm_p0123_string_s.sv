////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        123
// Description: Associative array next prev methods
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0123_string_s;

  int map[ string ];
  string s;

  initial begin
    if ( map.last( s ) )
      $display( "Last entry is : map[ %s ] = %0d\n", s, map[s] );
  
    if ( map.first( s ) )
      do
        $display( "%s : %d\n", s, map[ s ] );
      while ( map.next( s ) );
    
    if ( map.last( s ) )
      do
        $display( "%s : %d\n", s, map[ s ] );
      while ( map.prev( s ) );
  end

endmodule : sv12_lrm_p0123_string_s

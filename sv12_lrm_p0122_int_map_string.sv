////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        122
// Description: associative array methods
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0122_int_map_string;
 
  int map[ string ];
  initial begin
    map[ "hello" ] = 1;
    map[ "sad" ] = 2;
    map[ "world" ] = 3;
    map.delete( "sad" ); // remove entry whose index is "sad" from "map"
    map.delete;          // remove all entries from the associative array "map"
  end

  initial begin
    if ( map.exists( "hello" ))
      map[ "hello" ] += 1;
    else
      map[ "hello" ] = 0;
  end

  string s;
  initial begin
    if ( map.first( s ) )
      $display( "First entry is : map[ %s ] = %0d\n", s, map[s] );
  end
endmodule : sv12_lrm_p0122_int_map_string

////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        296
// Description: subroutine calls and argument passing value
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0296_function_automatic_int;


  function automatic int crc1( byte packet [1000:1] );
    for( int j= 1; j <= 1000; j++ ) begin
      crc1 ^= packet[j];
    end
  endfunction
  
    
  function automatic int crc2( ref byte packet [1000:1] );
    for( int j= 1; j <= 1000; j++ ) begin
      crc2 ^= packet[j];
    end
  endfunction

  byte packet1[1000:1];
  int k = crc2( packet1 ); // pass by value or by reference: call is the same

endmodule : sv12_lrm_p0296_function_automatic_int

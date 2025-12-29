////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        608
// Description: file positioning system function
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0608_integer_pos;

  integer pos,fd ;
  integer code ;
  int offset=2,count=4;
  string str="haha";


  initial begin

    $system("touch cpu.dat");
    fd = $fopen("cpu.dat","w");
    $fdisplay(fd , "haha\nhaha\n");
    fd = $fopen("cpu.dat","r");

    pos = $ftell ( fd );
    
    code = $fseek ( fd, offset, 0 );
    code = $rewind ( fd );

    $fflush ( fd );
    $fflush ( );
  end
endmodule : sv12_lrm_p0608_integer_pos

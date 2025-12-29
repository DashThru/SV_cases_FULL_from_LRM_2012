////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        609
// Description: I/O error status
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0609_integer_errno;

  integer errno,code,fd;
  string str;

  initial begin
    $system("touch cpu.dat");
    fd = $fopen("cpu.dat","w");

    errno = $ferror ( fd, str );
    code = $feof ( fd );
  end
endmodule : sv12_lrm_p0609_integer_errno

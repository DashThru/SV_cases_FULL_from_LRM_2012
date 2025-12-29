////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        603
// Description: reading data from a file
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0603_integer_c;

  integer c,fd,integral_var,mem;
  int start=0,count=4;
  integer code,out;
  string str="haha";

  initial begin
    $system("touch cpu.dat");
    fd = $fopen("cpu.dat","w");
    $fdisplay(fd , "haha\nhaha\n");

    fd = $fopen("cpu.dat","r");
    c = $fgetc ( fd );
    
    code = $ungetc ( c, fd );
    code = $fgets ( str, fd );

    code = $fscanf ( fd, "%d",  out);
    code = $sscanf ( str, "%d", out );

    code = $fread( integral_var, fd);
    code = $fread( mem, fd);
    code = $fread( mem, fd, start);
    code = $fread( mem, fd, start, count);
    code = $fread( mem, fd, , count);
  end

endmodule : sv12_lrm_p0603_integer_c

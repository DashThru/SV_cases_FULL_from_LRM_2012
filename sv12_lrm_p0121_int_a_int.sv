////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        121
// Description: associative array elements and methods
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0121_int_a_int;


  int a[int] = '{default:1};
  typedef struct { int x=1,y=2; } xy_t;
  xy_t b[int];
  
  initial begin
    a[1]++;
    b[2].x = 5;
  end

  int imem[int];
  initial begin
   imem[ 2'b11 ] = 1;
   imem[ 16'hffff ] = 2;
   imem[ 4'b1000 ] = 3;
   $display( "%0d entries\n", imem.num );  // prints "3 entries"
  end

endmodule : sv12_lrm_p0121_int_a_int

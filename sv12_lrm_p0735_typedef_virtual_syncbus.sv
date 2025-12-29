////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        735
// Description: virtual interfaces and clocking blocks
// Note:        
//
////////////////////////////////////////////////////////////////

interface SyncBus( input logic clk ); 
  wire a, b, c;
  clocking sb @(posedge clk); 
    input a;
    output b; 
	inout c;
  endclocking
endinterface

typedef virtual SyncBus VI;  // A virtual interface type

task do_it( VI v );          // handles any SyncBus via clocking sb
  if( v.sb.a == 1 )
    v.sb.b <= 0;
  else
    v.sb.c <= ##1 1;
endtask

module top; 
  logic clk;
  SyncBus b1( clk );
  SyncBus b2( clk );
  initial begin
    VI v[2] = '{ b1, b2 };
    repeat( 20 )
      do_it( v[ $urandom_range( 0, 1 ) ] );
  end
endmodule

module sv12_lrm_p0735_typedef_virtual_syncbus;
  top top();
endmodule : sv12_lrm_p0735_typedef_virtual_syncbus

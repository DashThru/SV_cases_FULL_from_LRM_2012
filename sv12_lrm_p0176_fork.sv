////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        176
// Description: parallel block statement
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0176_fork;

  parameter d = 50; // d declared as a parameter and
  logic [7:0] r;    // r declared as an 8-bit variable

  event eventA,Aevent,Bevent;
  logic areg,breg,enable_a,enable_b,ta,wa,tb,wb;
  
  initial fork
    begin
      $display( "First Block\n" );
      # 20ns;
    end
    begin
      $display( "Second Block\n" );
      @eventA;
    end
  join

  initial begin
    for( int j = 1; j <= 3; ++j )
      fork
        automatic int k = j; // local copy, k, for each value of j
  	  #k $write( "%0d", k );
        begin
          automatic int m = j; // the value of m is undetermined
        end
      join_none
  end

  initial fork
    #200 r = 'hF7;
    #150 r = 'h00;
    #100 r = 'hE2;
    #50 r = 'h35;
  join

  initial begin
    fork
	  @Aevent;
	  @Bevent;
    join
    areg = breg;
  end

  initial fork
    @enable_a
      begin
        #ta wa = 0;
        #ta wa = 1;
        #ta wa = 0;
      end
    @enable_b
      begin
        #tb wb = 1;
        #tb wb = 0;
        #tb wb = 1;
      end
  join
endmodule : sv12_lrm_p0176_fork

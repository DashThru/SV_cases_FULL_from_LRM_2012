////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        281
// Description: for loop and repeat loop
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0281_for_int_count;

  logic [255:0] value,a;
  parameter offset=1,N=10;

  initial for ( int count = 0; count < 3; count++ )
    value = value +((a[count]) * (count+1));
	
  initial for ( int count = 0, done = 0, j = 0; j * count < 125; j++, count++)
    $display("Value j = %d\n", j );

  initial for (int i = 0, j = i+offset; i < N; i++,j++)
    begin end

  parameter size = 8, longsize = 16;
  logic [size:1] opa, opb;
  logic [longsize:1] result;
  
  initial begin : mult
        logic [longsize:1] shift_opa, shift_opb;
	shift_opa = opa;
	shift_opb = opb;
	result = 0;
	repeat (size) begin
		if (shift_opb[1]) result = result + shift_opa;
		shift_opa = shift_opa << 1;
		shift_opb = shift_opb >> 1;
	end
  end
endmodule : sv12_lrm_p0281_for_int_count

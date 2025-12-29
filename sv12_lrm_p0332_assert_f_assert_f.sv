////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        332
// Description: immediate assertions
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0332_assert_f_assert_f;

  bit f,in_a,in_b;

  initial assert_f: assert(f) $info("passed"); else $error("failed");
  
  initial assume_inputs: assume (in_a || in_b) $info("assumption holds");
                 else $error("assumption does not hold");

  initial cover_a_and_b: cover (in_a && in_b) $info("in_a && in_b == 1 covered");
  
  time t;
  bit clk,state,count,count1,flag,y,req1,req2,a,b;
  event event1;
  
  always @(posedge clk)
    if (state == 1)
      assert (req1 || req2)
	  else begin
	    t = $time;
	    #5 $error("assert failed at time %0t",t);
      end
  
  function myfunc(int a,int b);
  endfunction

  initial assert (myfunc(a,b)) count1 = count + 1; else ->event1;
  initial assert (y == 0) else flag = 1;


endmodule : sv12_lrm_p0332_assert_f_assert_f

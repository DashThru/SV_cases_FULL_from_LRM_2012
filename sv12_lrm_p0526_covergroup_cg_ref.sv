////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        526
// Description: specifying bins for values
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0526_covergroup_cg_ref;

  logic clk;
  
  covergroup cg (ref int ra, input int low, int high ) @(posedge clk);
    coverpoint ra // sample variable passed by reference
    {
      bins good = { [low : high] };
      bins bad[] = default;
    }
  endgroup

  int va, vb;
  cg c1 = new(va, 0, 50); // cover variable va in the range 0 to 50
  cg c2 = new(vb, 120, 600 ); // cover variable vb in the range 120 to 600

  int x,b;
  function myfunc(int i); endfunction

  covergroup cg1 @(posedge clk);
     a: coverpoint x
        {
          bins mod3[] = {[0:255]} with (item % 3 == 0);
   	 }
   
     coverpoint b
        {
          bins func[] = b with (myfunc(item));
   	 }
  endgroup
endmodule : sv12_lrm_p0526_covergroup_cg_ref

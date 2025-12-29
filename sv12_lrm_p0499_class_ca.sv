////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        499
// Description: in-line random variable control
// Note:        Typo fix in line 14
//
////////////////////////////////////////////////////////////////

class CA;
  rand byte x, y;
  byte v, w;
  constraint c1 { x < v && y > w; }
endclass

module sv12_lrm_p0499_class_ca;
  
  CA a = new;
  int success;
  
  initial begin
    a.randomize();        // random variables: x, y state variables: v, w
    a.randomize( x );     // random variables: x    state variables: y, v, w
    a.randomize( v, w );  // random variables: v, w state variables: x, y
    a.randomize( w, x );  // random variables: w, x state variables: y, v

    success = a.randomize( null ); // no random variables
  end

endmodule : sv12_lrm_p0499_class_ca

////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        72
// Description: string s0 string
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0072_string_s0_string;

  string s0 = "String literal assign";  // sets s0 to "String literal assign"
  string s1 = "hello\0world";           // sets s1 to "helloworld"
  bit [11:0] bs = 12'ha41;
  string s3 = string'(bs);               // sets s2 to 16'h0a41

  typedef logic [15:0] r_t;
  r_t r;
  integer i = 1;
  string b = "";
  string a = {"Hi", b};
  
  initial begin
      r = r_t'(a);     // OK
      b = string'(r);  // OK
      b = "Hi";        // OK
      b = {5{"Hi"}};   // OK
      a = {i{"Hi"}};   // OK (non-constant replication)
      a = {i{b}};      // OK
      a = {a,b};       // OK
      a = {"Hi",b};    // OK
      r = {"H",""};    // yields "H\0". "" is converted to 8'b0
      b = {"H",""};    // yields "H". "" is the empty string
      a[0] = "h";      // OK, same as a[0] = "cough"
      a[1] = "\0";     // ignored, a is unchanged
  end
endmodule : sv12_lrm_p0072_string_s0_string

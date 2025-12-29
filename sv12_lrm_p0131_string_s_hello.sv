////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        131
// Description: array ordering methods
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0131_string_s_hello;

  string s[] = { "hello", "sad", "world" };
  int q[$] = { 4, 5, 3, 1 };
  struct { byte red, green, blue; } c [512];

  initial begin
  s.reverse; // s becomes { "world", "sad", "hello" };
  q.sort; // q becomes { 1, 3, 4, 5 }
  c.sort with ( item.red ); // sort c using the red field only
  c.sort( x ) with ( {x.blue, x.green} ); // sort by blue then green
  end

endmodule : sv12_lrm_p0131_string_s_hello

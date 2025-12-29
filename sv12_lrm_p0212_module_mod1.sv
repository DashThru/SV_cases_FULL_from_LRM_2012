////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        212
// Description: structure assignment patterns
// Note:        
//
////////////////////////////////////////////////////////////////

module mod1;
  typedef struct {
    int x;
    int y;
  } st;
  st s1;
  int k = 1;
  initial begin
    #1 s1 = '{1, 2+k};         // by position
    #1 $display( s1.x, s1.y);
    #1 s1 = '{x:2, y:3+k};     // by name
    #1 $display( s1.x, s1.y);
    #1 s1 = '{default:2};      // sets x and y to 2
    #1 $finish;
  end
endmodule


module sv12_lrm_p0212_module_mod1;

  mod1 u_mod1();

  typedef struct {int a; shortreal b;} ab;
  ab abkey[1:0] = '{'{a:1, b:1.0}, '{int:2, shortreal:2.0}};
  
  struct {
    int A;
    struct {
	  int B, C;
    } BC1, BC2;
  } ABC, DEF;
  
  initial ABC = '{A:1, BC1:'{B:2, C:3}, BC2:'{B:4,C:5}};
  initial DEF = '{default:10};

endmodule : sv12_lrm_p0212_module_mod1

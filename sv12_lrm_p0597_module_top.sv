////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        597
// Description: assignment pattern format display
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0597_module_top;
  typedef enum {ON, OFF} switch_e;
  typedef struct {switch_e sw; string s;} pair_t;
  pair_t va[int] = '{10:'{OFF, "switch10"}, 20:'{ON, "switch20"}};
  initial begin
    $display("va[int] = %p;",va);
    $display("va[int] = %0p;",va);
    $display("va[10].s = %p;", va[10].s);
  end
endmodule : sv12_lrm_p0597_module_top

// va[int] = '{10:'{sw:OFF, s:"switch10"}, 20:'{sw:ON, s:"switch20"}} ;
// va[int] = '{10:'{OFF, "switch10"}, 20:'{ON, "switch20"}} ;
// va[10].s = "switch10";


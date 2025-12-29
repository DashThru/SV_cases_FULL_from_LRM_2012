////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        540
// Description: cross bin automatically defined types
// Note:        Typo fix in line 20
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0540_covergroup_cg_ref;

  covergroup cg (ref logic [0:3] x, ref logic [0:7] y, ref logic [0:2] a);
    xy: coverpoint {x,y};
    coverpoint y;
    XYA: cross xy, a
    {
      // the cross types are as if defined here as follows:
      // typedef struct {logic [11:0] xy;logic [0:2] a;} CrossValType;
      // typedef CrossValType CrossQueueType[$];
    }
  endgroup

  int a;
  logic [7:0] b;
  covergroup cg2;
    coverpoint a { bins x[] = {[0:10]}; }
	coverpoint b { bins y[] = {[0:20]}; }
	aXb : cross a, b
	{
	  bins one = '{ '{1,2}, '{3,4}, '{5,6} };
	}
  endgroup

endmodule : sv12_lrm_p0540_covergroup_cg_ref

////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        701
// Description: early resolution of hierarchical names
// Note:        
//
////////////////////////////////////////////////////////////////

module m;
  m1 n();
endmodule 

module m1;
  parameter p = 2; 
  defparam m.n.p = 1;
  initial $display(m.n.p);
  generate
    if (p == 1) begin : mm
      m2 n();
    end
  endgenerate
endmodule

module m2; 
  parameter p = 3;
endmodule

// It shall be an error if a hierarchical name in a defparam is resolved before the hierarchy is completely
// elaborated and that name would resolve differently once the model is completely elaborated.

// This situation will occur very rarely. In order to cause the error, there has to be a named generate block that
// has the same name as one of the scopes in its full hierarchical name. Furthermore, there have to be two
// instances with the same name, one in the generate block and one in the other scope with the same name as
// the generate block. Then, inside these instances there have to be parameters with the same name. If this
// problem occurs, it can be easily fixed by changing the name of the generate block.

module sv12_lrm_p0701_module_m;
  m um();
endmodule : sv12_lrm_p0701_module_m

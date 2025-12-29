////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        756
// Description: conditional generate constructs
// Note:        
//
////////////////////////////////////////////////////////////////

module test;
  parameter p = 0, q = 0; 
  wire a, b, c;
  //---------------------------------------------------------
  // Code to either generate a u1.g1 instance or no instance.
  // The u1.g1 instance of one of the following gates:
  // (and, or, xor, xnor) is generated if
  // {p,q} == {1,0}, {1,2}, {2,0}, {2,1}, {2,2}, {2, default}
  //---------------------------------------------------------
  if (p == 1) 
    if (q == 0)
      begin : u1
        and g1(a, b, c);
      end
    else if (q == 2)
      begin : u1
        or g1(a, b, c);
      end
    else ;
  else if (p == 2)
    case (q) 
	  0, 1, 2:
	    begin : u1
		  xor g1(a, b, c);
		end
	  default:
	    begin : u1
		  xnor g1(a, b, c);
		end
    endcase
endmodule

module CLA_multiplier(a,b,product);
  input a,b;
  output product;
  parameter a_width = 8, b_width = 8;
endmodule

module WALLACE_multiplier(a,b,product);
  input a,b;
  output product;
  parameter a_width = 8, b_width = 8;
endmodule

module multiplier(a,b,product);
  parameter a_width = 8, b_width = 8;
  localparam product_width = a_width+b_width;
  // cannot be modified directly with the defparam 
  // statement or the module instance statement #
  input [a_width-1:0] a;
  input [b_width-1:0] b;
  output [product_width-1:0] product;
  generate
    if((a_width < 8) || (b_width < 8)) begin: mult
      CLA_multiplier #(a_width,b_width) u1(a, b, product);
      // instantiate a CLA multiplier
    end
    else begin: mult
      WALLACE_multiplier #(a_width,b_width) u1(a, b, product);
      // instantiate a Wallace-tree multiplier
    end
  endgenerate
  // The hierarchical instance name is mult.u1
endmodule

module sv12_lrm_p0756_module_test;
  test test();
  multiplier multiplier();
endmodule : sv12_lrm_p0756_module_test

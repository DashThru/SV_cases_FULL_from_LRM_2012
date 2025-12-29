////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        84
// Description: parameter declaration syntax
// Note:        
//
////////////////////////////////////////////////////////////////

class vector #(size = 1); // size is a parameter in a parameter port list
  logic [size-1:0] v;
endclass

interface simple_bus #(AWIDTH = 64, type T = word) // parameter port list
                      (input logic clk) ; // port list
endinterface

module sv12_lrm_p0084_class_vector_size;
endmodule : sv12_lrm_p0084_class_vector_size

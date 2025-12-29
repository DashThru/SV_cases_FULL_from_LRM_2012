////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        642
// Description: define compiler directive
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0642_define_macro1_a;

  `define MACRO1(a=5,b="B",c) $display(a,,b,,c);

  initial begin
    `MACRO1 ( , 2, 3 )  // argument a omitted, replaced by default
                        // expands to '$display(5,,2,,3);'
    `MACRO1 ( 1 , , 3 ) // argument b omitted, replaced by default
                        // expands to '$display(1,,"B",,3);'
    `MACRO1 ( , 2, )    // argument c omitted, replaced by nothing
                        // expands to '$display(5,,2,,);'
    
    `define MACRO2(a=5, b, c="C") $display(a,,b,,c);
    `MACRO2 (1, , 3)    // argument b omitted, replaced by nothing
                        // expands to '$display(1,,,,3);'
    `MACRO2 (, 2, )     // a and c omitted, replaced by defaults
                        // expands to '$display(5,,2,,"C");'
    `MACRO2 (, 2)       // a and c omitted, replaced by defaults
                        // expands to '$display(5,,2,,"C");'
    
    `define MACRO3(a=5, b=0, c="C") $display(a,,b,,c);
    `MACRO3 ( 1 )       // b and c omitted, replaced by defaults
                        // expands to '$display(1,,0,,"C");'
    `MACRO3 ( )         // all arguments replaced by defaults
                        // expands to '$display(5,,0,,"C");'
  end

  wire q21,q22,n10,n11;
  `define wordsize 8
  logic [1:`wordsize] data;

  //define a nand with variable delay
  `define var_nand(dly) nand #dly

  `var_nand(2) g121 (q21, n10, n11);
  `var_nand(5) g122 (q22, n10, n11);

endmodule : sv12_lrm_p0642_define_macro1_a

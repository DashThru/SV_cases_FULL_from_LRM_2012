////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        90
// Description: const logic and scope lifetime
// Note:        
//
////////////////////////////////////////////////////////////////

class vector #(size = 1); // size is a parameter in a parameter port list
  logic [size-1:0] v;
endclass

module msl;
  int st0;               // static
  initial begin
    int st1;             // static
    static int st2;      // static
    automatic int auto1; // automatic
  end
  task automatic t1();   // automatic
    int auto2;
    static int st3;      // static
    automatic int auto3; // automatic
  endtask
endmodule

module sv12_lrm_p0090_const_logic_option;
  const logic option = 1;
  const vector v = new();
  
  msl u_msl();
endmodule : sv12_lrm_p0090_const_logic_option

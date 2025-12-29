////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        337
// Description: subroutine arguments to deferred assertion
// Note:        
//
////////////////////////////////////////////////////////////////
  
module sv12_lrm_p0337_function_int_error_type;

  logic my_cond,opcode;

  function int error_type (int opcode);
    func_assert: assert (opcode < 64) else $display("Opcode error.");
	if (opcode < 32)
      return (0);
	else
      return (1);
  endfunction
  
  always_comb begin : b1
    a1: assert #0 (my_cond) else
        $error("Error on operation of type %d\n", error_type(opcode));
	a2: assert #0 (my_cond) else
        error_type(opcode);
  end

endmodule : sv12_lrm_p0337_function_int_error_type

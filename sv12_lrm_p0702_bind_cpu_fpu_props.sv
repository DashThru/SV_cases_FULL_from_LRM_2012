////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        702
// Description: binding auxiliary code to scopes or instances
// Note:        
//
////////////////////////////////////////////////////////////////

module cpu(input a,b,c);
endmodule

program fpu_props(output a,b,c);
endprogram

module cr_unit(output clk, enable, output var int minval, expr);
endmodule

module targetmod(output a,b,c);
  parameter const4 = 1;
endmodule

module mycheck(input p, input p1, p2);
endmodule

module sv12_lrm_p0702_bind_cpu_fpu_props;

  logic a,b,c,c_clk,c_en,v_low,in1,in2;

  cpu cpu1(.*);
  cpu cpu2(.*);
  cpu cpu3(.*);

  bind cpu fpu_props fpu_rules_1(a,b,c);

  bind cpu: cpu1 fpu_props fpu_rules_2(a, b, c);

  bind cpu: cpu1, cpu2, cpu3 fpu_props fpu_rules_3(a, b, c);

  interface range (input clk, enable, input var int minval, expr);
    property crange_en;
      @(posedge clk) enable |-> (minval <= expr); 
	endproperty
    range_chk: assert property (crange_en); 
  endinterface

  bind cr_unit range r1(c_clk,c_en,v_low,(in1&&in2));

  parameter const4 = 1;
  
  bind targetmod
  mycheck #(.param1(const4), .param2(8'h44))
  i_mycheck(.*, .p1(a), .p2(b));
  


endmodule : sv12_lrm_p0702_bind_cpu_fpu_props

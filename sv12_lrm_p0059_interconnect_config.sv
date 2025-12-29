////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        59
// Description: interconnect config
// Note:        
//
////////////////////////////////////////////////////////////////

//<file top.sv>
module sv12_lrm_p0059_interconnect_config();
  interconnect [0:3] [0:1] aBus;
  logic [0:3] dBus;
  driver1 driver1Array[0:3](aBus);
  cmp1 cmp1Array[0:3](aBus,rst,dBus);
endmodule : sv12_lrm_p0059_interconnect_config

//<file nets.pkg>
package NetsPkg;
  nettype real realNet;
endpackage : NetsPkg

//<file driver.svr>
module driver1
  import NetsPkg::*;
  #(parameter int delay = 30,
              int iterations = 256)
  (output realNet [0:1] out);
  real outR[1:0];
  assign out = outR;
  initial begin
    outR[0] = 0.0;
    outR[1] = 3.3;
    for (int i = 0; i < iterations; i++) begin
         #delay outR[0] += 0.2;
         outR[1] -= 0.2;
    end
  end
endmodule : driver1

//<file driver.sv>
module driver2 #(parameter int delay = 30,
                          int iterations = 256)
			   (output wire logic [0:1] out);
  logic [0:1] outvar;
  assign out = outvar;
  initial begin
    outvar = '0;
    for (int i = 0; i < iterations; i++)
      #delay outvar++;
  end
endmodule : driver2

//<file cmp.svr>
module cmp1
  import NetsPkg::*;
  #(parameter real hyst = 0.65)
  (input realNet [0:1] inA,
   input logic rst,
   output logic out);
  real updatePeriod = 100.0;
  
  initial out = 1'b0;
  
  always #updatePeriod begin
    if (rst) out <= 1'b0;
	else if (inA[0] > inA[1]) out <= 1'b1;
	else if (inA[0] < inA[1] - hyst) out <= 1'b0;
  end
endmodule : cmp1

//<file cmp.sv>
module cmp2 #(parameter real hyst = 0.65)
          (input wire logic [0:1] inA,
		   input logic rst,
           output logic out);
 
  initial out = 1'b0;
  
  always @(inA, rst) begin
    if (rst) out <= 1'b0;
    else if (inA[0] & ~inA[1]) out <= 1'b1;
	else out <= 1'b0;
  end
endmodule : cmp2


////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        583
// Description: programmable logic array modeling system tasks
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0583_wire_a1_a2;


  wire a1, a2, a3, a4, a5, a6, a7;
  logic b1, b2, b3;
  wire [1:7] awire;
  logic [1:3] breg;
  logic [1:7] mem[1:3];

  initial begin
    $async$and$array(mem,{a1,a2,a3,a4,a5,a6,a7},{b1,b2,b3});
    $async$and$array(mem,awire, breg);
    $sync$or$plane(mem,{a1,a2,a3,a4,a5,a6,a7}, {b1,b2,b3});
     
    $async$nor$plane(mem,{a1,a2,a3,a4,a5,a6,a7},{b1,b2,b3});
    $sync$nand$plane(mem,{a1,a2,a3,a4,a5,a6,a7}, {b1,b2,b3});
  end

endmodule : sv12_lrm_p0583_wire_a1_a2

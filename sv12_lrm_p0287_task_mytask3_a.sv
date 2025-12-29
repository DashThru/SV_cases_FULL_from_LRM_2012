////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        287
// Description: task statement declaration
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0287_task_mytask3_a;


  task mytask3(a, b, output logic [15:0] u, v);
  endtask
  
  // the resultant declaration of b is input [3:0][7:0] b[3:0]
  task mytask4(input [3:0][7:0] a, b[3:0], output [3:0][7:0] y[1:0]);
  endtask
  
  task my_task1;
    input a, b;
    inout c;
    output d, e;
    c = a;  // the assignments that initialize result outputs
    d = b;
    e = c;
  endtask
  
  task my_task2 (input a, b, inout c, output d, e);
    c = a;  // the assignments that initialize result variables
    d = b;
    e = c;
  endtask

  logic v, w, x, y, z;
  initial my_task2 (v, w, x, y, z);


endmodule : sv12_lrm_p0287_task_mytask3_a

////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        203
// Description: nonblocking assigment module
// Note:        
//
////////////////////////////////////////////////////////////////

module nonblock1;
  logic a, b, c, d, e, f;
  // blocking assignments
  initial begin
    a = #10 1; // a will be assigned 1 at time 10
    b = #2 0;  // b will be assigned 0 at time 12
    c = #4 1;  // c will be assigned 1 at time 16
  end
  // nonblocking assignments
  initial begin
    d <= #10 1; // d will be assigned 1 at time 10
	e <= #2 0;  // e will be assigned 0 at time 2
	f <= #4 1;  // f will be assigned 1 at time 4
  end
endmodule

module nonblock2;
  logic a, b;
  initial begin
    a = 0;
    b = 1;
    a <= b; // evaluates, schedules,
    b <= a; // and executes in two steps
  end
  initial begin
    $monitor ($time, ,"a = %b b = %b", a, b);
    #100 $finish;
  end
endmodule

module multiple;
  logic a;
  initial a = 1;
    // The assigned value of the variable is determinate
  initial begin
    a <= #4 0;  // schedules a = 0 at time 4
    a <= #4 1;  // schedules a = 1 at time 4
  end           // At time 4, a = 1
endmodule

module sv12_lrm_p0203_module_nonblock1;
  nonblock1 u_nonblock1();
  nonblock2 u_nonblock2();
  multiple  u_multiple();
endmodule : sv12_lrm_p0203_module_nonblock1

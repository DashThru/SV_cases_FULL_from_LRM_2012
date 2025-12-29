////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        601
// Description: file output system tasks
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0601_integer;

  integer
    messages,  broadcast,
    cpu_chann, alu_chann, mem_chann;

  logic address,acc,f,a,b;

  initial begin
    cpu_chann = $fopen("cpu.dat");
    if (cpu_chann == 0) $finish;
    alu_chann = $fopen("alu.dat");
    if (alu_chann == 0) $finish;
    mem_chann = $fopen("mem.dat");
    if (mem_chann == 0) $finish;
    messages = cpu_chann | alu_chann | mem_chann;
	// broadcast includes standard output
	broadcast = 1 | messages;

    $fdisplay( broadcast, "system reset at time %d", $time );
    $fdisplay( messages, "Error occurred on address bus"," at time %d, address = %h", $time, address );
    $fdisplay( alu_chann, "acc= %h f=%h a=%h b=%h", acc, f, a, b );
  end

endmodule : sv12_lrm_p0601_integer

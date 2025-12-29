////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        467
// Description: constrained random value generation
// Note:        
//
////////////////////////////////////////////////////////////////

class Bus;
  rand bit[15:0] addr;
  rand bit[31:0] data;
  constraint word_align {addr[1:0] == 2'b0;}
endclass

typedef enum {low, mid, high} AddrType;

class MyBus extends Bus;
  rand AddrType atype;
  constraint addr_range
  {
    (atype == low ) -> addr inside { [0 : 15] };
	(atype == mid ) -> addr inside { [16 : 127]};
	(atype == high) -> addr inside {[128 : 255]};
  }
endclass

module sv12_lrm_p0467_class_bus;

  Bus bus = new;
  initial repeat (50) begin
    if ( bus.randomize() == 1 )
      $display ("addr = %16h data = %h\n", bus.addr, bus.data);
    else
      $display ("Randomization failed.\n");
  end

  task exercise_bus (MyBus bus);
    int res;
    // EXAMPLE 1: restrict to low addresses
    res = bus.randomize() with {atype == low;};
    // EXAMPLE 2: restrict to address between 10 and 20
	res = bus.randomize() with {10 <= addr && addr <= 20;};
    // EXAMPLE 3: restrict data values to powers-of-two
    res = bus.randomize() with {(data & (data - 1)) == 0;};
  endtask

  task exercise_illegal(MyBus bus, int cycles);
    int res;
    // Disable word alignment constraint.
    bus.word_align.constraint_mode(0);
    repeat (cycles) begin
      // CASE 1: restrict to small addresses.
      res = bus.randomize() with {addr[0] || addr[1];};
    end
    // Reenable word alignment constraint
    bus.word_align.constraint_mode(1);
  endtask


endmodule : sv12_lrm_p0467_class_bus

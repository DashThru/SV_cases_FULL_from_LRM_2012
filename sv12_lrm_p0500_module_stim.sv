////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        500
// Description: randomization of scope variablesstd::randomize()
// Note:        
//
////////////////////////////////////////////////////////////////

module stim;
  bit [15:0] addr;
  bit [31:0] data;
  function bit gen_stim();
    bit success, rd_wr;
    success = randomize( addr, data, rd_wr );  // call std::randomize
    return rd_wr ;
  endfunction
endmodule

class stimc;
  rand bit [15:0] addr;
  rand bit [31:0] data;
  rand bit rd_wr;
endclass

module sv12_lrm_p0500_module_stim;

  function bit gen_stim( stimc p );
    bit [15:0] addr;
    bit [31:0] data;
    bit success;
    success = p.randomize();
    addr = p.addr;
    data = p.data;
    return p.rd_wr;
  endfunction
  
  stimc p=new;
  initial gen_stim(p);

endmodule : sv12_lrm_p0500_module_stim

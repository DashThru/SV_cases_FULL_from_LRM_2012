////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        174
// Description: sequential block syntax
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0174_begin;
  
  logic areg,breg,creg,clock;

  initial 
  begin
    areg = breg;
    creg = areg; // creg stores the value of breg
  end

  initial 
  begin
    areg = breg;
    @(posedge clock) creg = areg; // assignment delayed until 
  end                             // posedge on clock

  parameter d = 50; // d declared as a parameter and
  logic [7:0] r;    // r declared as an 8-bit variable

  initial 
  begin // a waveform controlled by sequential delays
    #d r = 'h35;
    #d r = 'hE2;
    #d r = 'h00;
    #d r = 'hF7;
  end

endmodule : sv12_lrm_p0174_begin

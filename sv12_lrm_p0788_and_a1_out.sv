////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        788
// Description: primitive gate and net delays
// Note:        
//
////////////////////////////////////////////////////////////////

module tri_latch (qout, nqout, clock, data, enable); 
  output qout, nqout;
  input  clock, data, enable;
  tri    qout, nqout;
  not #5 n1 (ndata, data);
  nand #(3,5) n2 (wa, data, clock),
              n3 (wb, ndata, clock);
  nand #(12,15) n4 (q, nq, wa),
                n5 (nq, q, wb);
  bufif1 #(3,7,13) q_drive (qout, q, enable),
                   nq_drive (nqout, nq, enable);
endmodule

module sv12_lrm_p0788_and_a1_out;

  wire out, in1, in2, in, ctrl;

  and #(10) a1 (out, in1, in2); // only one delay
  and #(10,12) a2 (out, in1, in2); // rise and fall delays
  bufif0 #(10,12,11) b3 (out, in, ctrl); // rise, fall, and turn-off delays

  wire clock, data, enable;
  tri  qout, nqout;

  tri_latch tri_latch(.*);

endmodule : sv12_lrm_p0788_and_a1_out

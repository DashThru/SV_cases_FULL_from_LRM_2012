////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        320
// Description: semaphore and methods
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0320_semaphore_smtx;


  semaphore smTx;

  initial begin
    smTx = new(2);
    smTx.get();
    smTx.get();
    smTx.try_get();
    smTx.put();
  end

endmodule : sv12_lrm_p0320_semaphore_smtx

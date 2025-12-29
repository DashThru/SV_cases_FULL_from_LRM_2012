////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        325
// Description: parameterized mailboxes
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0325_typedef_mailbox_string;


  typedef mailbox #(string) s_mbox;
  
  s_mbox sm = new;
  string s;
  
  initial begin
    sm.put( "hello" );
    sm.get( s ); // s <- "hello"
  end

endmodule : sv12_lrm_p0325_typedef_mailbox_string

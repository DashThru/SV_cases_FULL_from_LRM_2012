////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        125
// Description: queues definition
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0125_byte_q1_a;


  byte q1[$];                   // A queue of bytes
  string names[$] = { "Bob" };  // A queue of strings with one element
  integer Q[$] = { 3, 2, 7 };   // An initialized queue of integers
  bit q2[$:255];                // A queue whose maximum size is 256 bits

endmodule : sv12_lrm_p0125_byte_q1_a

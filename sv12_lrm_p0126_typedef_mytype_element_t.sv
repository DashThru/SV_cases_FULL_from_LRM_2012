////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        126
// Description: queue methods
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0126_typedef_mytype_element_t;


  typedef int element_t; // mytype is any legal type for a queue
  typedef element_t queue_t[$];
  element_t e;
  queue_t Q;
  int i;

  initial begin
    i = Q.size();
    Q.insert(i,e);
    Q.push_front(e);
    Q.push_back(e);
    Q.pop_front();
    Q.pop_back();
  end

endmodule : sv12_lrm_p0126_typedef_mytype_element_t

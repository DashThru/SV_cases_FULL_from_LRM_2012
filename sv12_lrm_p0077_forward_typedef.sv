////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        77
// Description: forward typedef
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0077_forward_typedef;

  class C;
    typedef int T;
  endclass
  
  class tc;
      int x;
  endclass
  
  typedef enum te;
  typedef struct ts;
  typedef union tu;
  typedef class tc;
  typedef interface class tic;
  typedef t;


  // Full definitions
  typedef enum {
      A = 0,
      B = 1
  } te;
  
  typedef struct {
      int data;
  } ts;
  
  typedef union  {
      int  i;
      byte b;
  } tu;
  
  interface class tic;
    pure virtual function int foo();
  endclass
  
  typedef int t;
  

  typedef C;
  typedef C::T c_t;
  c_t y;

endmodule : sv12_lrm_p0077_forward_typedef

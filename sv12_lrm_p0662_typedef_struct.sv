////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        662
// Description: module port declarations
// Note:        
//
////////////////////////////////////////////////////////////////

typedef struct {
  bit isfloat;
  union { int i; shortreal f; } n;
} tagged_st; // named structure

module mh1 (input var int in1,
            input var shortreal in2,
            output tagged_st out);
endmodule

module sv12_lrm_p0662_typedef_struct;

  mh1 u_mh1();

endmodule : sv12_lrm_p0662_typedef_struct

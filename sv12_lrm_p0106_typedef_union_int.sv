////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        106
// Description: typedef union int and packed union
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0106_typedef_union_int;

  typedef union { int i; shortreal f; } num;  // named union type
  num n;
  initial n.f = 0.0; // set n in floating point format

  typedef struct {
    bit isfloat;
    union { int i; shortreal f; } n;  // anonymous union type
  } tagged_st;                        // named structure

  typedef struct packed { // default unsigned
    bit [3:0] GFC;
    bit [7:0] VPI;
    bit [11:0] VCI;
    bit CLP;
    bit [3:0] PT ;
    bit [7:0] HEC;
    bit [47:0] [7:0] Payload;
    bit [2:0] filler;
  } s_atmcell;

  typedef union packed { // default unsigned
    s_atmcell acell;
    bit [423:0] bit_slice;
    bit [52:0][7:0] byte_slice;
 } u_atmcell;
 
  u_atmcell u1;
  byte b; bit [3:0] nib;
  
  initial begin
    b = u1.bit_slice[415:408];     // same as b = u1.byte_slice[51];
    nib = u1.bit_slice [423:420];  // same as nib = u1.acell.GFC;
  end

endmodule : sv12_lrm_p0106_typedef_union_int

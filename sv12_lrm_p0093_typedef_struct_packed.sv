////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        93
// Description:  equivalent types
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0093_typedef_struct_packed;

  struct {int A; int B;} AB1, AB2; // AB1, AB2 have equivalent types
  struct {int A; int B;} AB3;      // AB3 is not type equivalent to AB1

  typedef bit signed [7:0] BYTE;     // equivalent to the byte type
  typedef struct packed signed {bit[3:0] a, b;} uint8;
                                     // equivalent to the byte type

  bit [9:0] A [0:5];
  bit [1:10] B [6];
  typedef bit [10:1] uint10;
  uint10 C [6:1];            // A, B and C have equivalent types
  typedef int anint [0:0];   // anint is not type equivalent to int


endmodule : sv12_lrm_p0093_typedef_struct_packed

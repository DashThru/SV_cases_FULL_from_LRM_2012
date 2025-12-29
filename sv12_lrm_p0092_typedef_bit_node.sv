////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        92
// Description: typedef matching types
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0092_typedef_bit_node;

  typedef bit node;     // 'bit' and 'node' are matching types
  typedef logic [3:0] type1;
  typedef type1 type2;  // 'type1' and 'type2' are matching types

  struct packed {int A; int B;} AB1, AB2; // AB1, AB2 have matching types
  struct packed {int A; int B;} AB3;      // the type of AB3 does not match the type of AB1

  typedef struct packed {int A; int B;} AB_t;
  AB_t AB4; AB_t AB5; // AB1 and AB2 have matching types


  typedef struct packed {int A; int B;} otherAB_t;
  otherAB_t AB6; // the type of AB3 does not match the type of AB1 or AB2

  typedef bit signed [7:0] BYTE; // matches the byte type
  typedef bit signed [0:7] ETYB; // does not match the byte type

  typedef byte MEM_BYTES [256];
  typedef bit signed [7:0] MY_MEM_BYTES [256]; // MY_MEM_BYTES matches MEM_BYTES

  typedef logic [7:0] MY_BYTE; // MY_BYTE and NIBBLES are not matching types
  typedef logic [1:0] [3:0] NIBBLES;
  
  typedef logic MD_ARY [][2:0];
  typedef logic MD_ARY_TOO [][0:2]; // Does not match MD_ARY

  typedef byte signed MY_CHAR; // MY_CHAR matches the byte type
  
endmodule : sv12_lrm_p0092_typedef_bit_node

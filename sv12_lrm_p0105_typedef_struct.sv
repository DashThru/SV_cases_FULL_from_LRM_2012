////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        105
// Description: assigning to structures
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0105_typedef_struct;

  parameter constant = 2;
  typedef struct {
    int addr = 1 + constant;
	int crc;
    byte data [4] = '{4{1}};
  } packet1;

  packet1 p1; // initialization defined by the typedef.
              // p1.crc will use the default value for an int

  packet1 pi = '{1,2,'{2,3,4,5}}; //suppresses the typedef initialization

endmodule : sv12_lrm_p0105_typedef_struct

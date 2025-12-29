////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        78
// Description: declare enumeration type
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0078_enumeration_type;

  enum {red, yellow, green} light1, light2; // anonymous int type

  enum integer {IDLE, XX='x, S1='b01, S2='b10} state, next;

  enum {a1=3, b1=7, c1} alphabet1;

  enum {a2, b2=7, c2} alphabet2;

  enum {bronze=3, silver, gold} medal; // silver=4, gold=5

  enum bit [3:0] {bronze2='h3, silver2, gold2='h5} medal2;

  enum bit [3:0] {bronze3=4'h3, silver3, gold3=4'h5} medal3;

  typedef enum {NO, YES} boolean;
  boolean myvar; // named type

  typedef enum { add=10, sub[5], jmp[6:8] } E1;
  
  enum { register[2] = 1, register[2:4] = 10 } vr;
  

endmodule : sv12_lrm_p0078_enumeration_type

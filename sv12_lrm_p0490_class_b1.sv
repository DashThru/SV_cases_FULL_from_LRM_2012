////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        490
// Description: rand soft constraints
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0490_class_b1;

  class B1;
    rand int x;
    constraint a { soft x > 10 ; soft x < 100 ; }
  endclass           /* a1 */       /* a2 */
  
  class D1 extends B1;
    constraint b { soft x inside {[5:9]} ; }
  endclass               /* b1 */
  
  class B2;
    rand int y;
    constraint c { soft y > 10 ; } 
  endclass           /* c1 */
  
  class D2 extends B2;
    constraint d { soft y inside {[5:9]} ; }
    constraint e ;        /* d1 */
    rand D1 p1=new;
    rand B1 p2=new;
    rand D1 p3=new;
    constraint f { soft p1.x < p2.x ; }
  endclass             /* f1 */
  
  constraint D2::e { soft y > 100 ; }
                          /* e1 */

  D2 d = new();
  initial begin
    d.randomize() with { soft y inside {10,20,30} ; soft y < p1.x ; };
  end                            /* i1 */              /* i2 */

endmodule : sv12_lrm_p0490_class_b1

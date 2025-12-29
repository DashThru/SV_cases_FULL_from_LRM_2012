////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        42
// Description: struct literal and array literal examples
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0042_struct_literals;

  typedef struct {int a; shortreal b;} ab;
  ab c1,c2,c3;
  initial c1 = '{0, 0.0};       // structure literal type determined from the left-hand context (c)
  initial c2 = '{a:0, b:0.0};   // member name and value for that member
  initial c3 = '{default:0};    // all elements of structure c are set to 0

  ab abarr[1:0] = '{'{1, 1.0}, '{2, 2.0}};

  ab d;
  initial d = ab'{int:1, shortreal:1.0};   // data type and default value for all members of that type

  struct {int X,Y,Z;} XYZ = '{3{1}};
  typedef struct {int a,b[4];} ab_t;
  int a=1,b=2,c=3;
  ab_t v1[1:0] [2:0];
  initial v1 = '{2{'{3{'{a,'{2{b,c}}}}}}};
  /* expands to '{ '{3{ '{ a, '{2{ b, c }} } }},
  	               '{3{ '{ a, '{2{ b, c }} } }}
                 } */
  /* expands to '{ '{ '{ a, '{2{ b, c }} },
                       '{ a, '{2{ b, c }} },
                       '{ a, '{2{ b, c }} }
                      },
                    '{ '{ a, '{2{ b, c }} },
                       '{ a, '{2{ b, c }} },
                       '{ a, '{2{ b, c }} }
                      } } */
  /* expands to '{ '{ '{ a, '{ b, c, b, c } },
                       '{ a, '{ b, c, b, c } },
                       '{ a, '{ b, c, b, c } }
                      },
                    '{ '{ a, '{ b, c, b, c } },
                       '{ a, '{ b, c, b, c } },
                       '{ a, '{ b, c, b, c } }
                      }
				  } */

endmodule : sv12_lrm_p0042_struct_literals


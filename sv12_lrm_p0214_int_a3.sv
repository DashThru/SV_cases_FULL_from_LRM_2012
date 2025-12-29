////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        214
// Description: unpacked array concatenations and array assignment
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0214_int_a3;


  int A3[1:3];
  initial begin
    A3 = {1, 2, 3};   // unpacked array concatenation: A3[1]=1, A3[2]=2, A3[3]=3
    A3 = '{1, 2, 3};  // array assignment pattern: A3[1]=1, A3[2]=2, A3[3]=3
  end

  typedef int AI3[1:3];
  AI3 A0;
  int A9[1:9];

  initial begin
    A0 = '{1, 2, 3};
    A9 = {A3, 4, 5, A3, 6};  // legal, gives A9='{1,2,3,4,5,1,2,3,6}
    A9 = '{9{1}};            // legal, gives A9='{1,1,1,1,1,1,1,1,1}
    A9 = {A3, 4, AI3'{5, 6, 7}, 8, 9};  // legal, A9='{1,2,3,4,5,6,7,8,9}
  end

endmodule : sv12_lrm_p0214_int_a3

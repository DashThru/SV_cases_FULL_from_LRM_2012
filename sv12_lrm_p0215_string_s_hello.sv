////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        215
// Description: nesting of unpacked array concatenations
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0215_string_s_hello;


  string S, hello;
  string SA[2];
  byte B;
  byte BA[2];
  
  initial begin
    hello = "hello";

    S = {hello, " world"};   // string concatenation: "hello world"
    SA = {hello, " world"};  // array concatenation:
                             // SA[0]="hello", SA[1]=" world"
    B = {4'h6, 4'hf};        // vector concatenation: B=8'h6f
    BA = {4'h6, 4'hf};       // array concatenation: BA[0]=8'h06, BA[1]=8'h0f
  end

  string S1, S2;
  typedef string T_SQ[$];
  T_SQ SQ;

  initial begin
    S1 = "S1";
    S2 = "S2";
    SQ = '{"element 0", "element 1"};  // assignment pattern, two strings
    SQ = {S1, SQ, {"element 3 is ", S2} };  // '{"S1", "element 0", "element 1", "element 3 is S2"}
    SQ = {S1, SQ, T_SQ'{"element 3 is ", S2} };  // '{"S1", "element 0", "element 1", "element 3 is ", "S2"}
  end
endmodule : sv12_lrm_p0215_string_s_hello

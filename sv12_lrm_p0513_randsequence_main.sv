////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        513
// Description: value passing between productions
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0513_randsequence_main;

  initial randsequence( main )
    main                    : first second gen ;
    first                   : add | dec ;
    second                  : pop | push ;
    add                     : gen("add") ;
    dec                     : gen("dec") ;
    pop                     : gen("pop") ;
    push                    : gen("push") ;
    gen( string s = "done") : { $display(s); };
  endsequence

  initial randsequence( bin_op )
    void bin_op     : value operator value // void type is optional
                      { $display("%s %b %b", operator, value[1], value[2]); }
                      ;
    bit [7:0] value : { return $urandom; } ;
    string operator :   add  := 5 { return "+" ; }
	              | dec  := 2 { return "-" ; }
                      | mult := 1 { return "*" ; };
    add                     : gen("add") ;
    dec                     : gen("dec") ;
    mult                    : gen("mult") ;
    gen( string s = "done") : { $display(s); };

  endsequence

endmodule : sv12_lrm_p0513_randsequence_main

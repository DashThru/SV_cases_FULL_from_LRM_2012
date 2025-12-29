////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        34
// Description: identifier and escaped identifier examples
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0034_identifiers;

  bit shiftreg_a               ;
  bit busa_index               ;
  bit error_condition          ;
  bit merge_ab                 ;
  bit _bus3                    ; 
  bit n$657                    ;
                               
  bit \busa+index              ;
  bit \-clock                  ;
  bit \***error-condition***   ;
  bit \net1/\net2              ;
  bit \{a,b}                   ;
  bit \a*(b+c)                 ;

endmodule : sv12_lrm_p0034_identifiers


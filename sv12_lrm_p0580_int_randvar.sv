////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        580
// Description: $random system function
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0580_int_randvar;

  int randvar1;
  initial randvar1 = $random % 60;  // between -59 and 59 

  int randvar2;
  initial randvar2 = {$random} % 60;   // from 0 to 59

endmodule : sv12_lrm_p0580_int_randvar

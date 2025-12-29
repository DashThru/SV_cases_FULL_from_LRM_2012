////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        814
// Description: specifying transition delays on module paths
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0814_c_q(input C, output Q);

  specify
    // one expression specifies all transitions
    (C => Q) = 20;
    (C => Q) = 10:14:20;
  endspecify

  specify
    // two expressions specify rise and fall delays 
    specparam tPLH1 = 12, tPHL1 = 25;
    specparam tPLH2 = 12:16:22, tPHL2 = 16:22:25; 
    (C => Q) = ( tPLH1, tPHL1 ) ;
    (C => Q) = ( tPLH2, tPHL2 ) ;
  endspecify

  specify
    // three expressions specify rise, fall, and z transition delays 
    specparam tPz1 = 34, tPz2 = 22:30:34; 
    (C => Q) = (tPLH1, tPHL1, tPz1);
    (C => Q) = (tPLH2, tPHL2, tPz2);
  endspecify

  specify
    // six expressions specify transitions to/from 0, 1, and z 
    specparam t01 = 12, t10 = 16, t0z = 13,
              tz1 = 10, t1z = 14, tz0 = 34 ;
    (C => Q) = ( t01, t10, t0z, tz1, t1z, tz0) ;
    specparam T01 = 12:14:24, T10 = 16:18:20, T0z = 13:16:30 ; 
    specparam Tz1 = 10:12:16, T1z = 14:23:36, Tz0 = 15:19:34 ; 
    (C => Q) = ( T01, T10, T0z, Tz1, T1z, Tz0) ;
  endspecify

  specify
    // twelve expressions specify all transition delays explicitly 
    specparam t0x=14, tx1=15, t1x=15, tx0=14, txz=20, tzx=30 ;
    (C => Q) = (t01, t10, t0z, tz1, t1z, tz0,
                t0x, tx1, t1x, tx0, txz, tzx) ;
  endspecify

endmodule : sv12_lrm_p0814_c_q

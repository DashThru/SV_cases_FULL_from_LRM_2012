////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        772
// Description: primitive instance control
// Note:        
//
////////////////////////////////////////////////////////////////

module sv12_lrm_p0772_pullup_strong1_p1;

  wire out1, out2, in, outw, inw, controlw, out, data, control, inout1,inout2, w, datain, ncontrol, pcontrol, neta, netb;

  buf b1 (out1, out2, in);
  bufif1 bf1 (outw, inw, controlw);
  pmos p1 (out, data, control);
  nmos n1 (out, data, control);
  tranif1 t1 (inout1,inout2,control);
  cmos (w, datain, ncontrol, pcontrol);
  pullup (strong1) pu1 (neta), pu2 (netb);

endmodule : sv12_lrm_p0772_pullup_strong1_p1

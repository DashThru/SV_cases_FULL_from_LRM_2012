////////////////////////////////////////////////////////////////
//
// LRM:         SV2012
// Page:        796
// Description: level-sensitive and edge-sensitive UDPs
// Note:        
//
////////////////////////////////////////////////////////////////

primitive latch (q, ena_, data); 
  output q; reg q;
  input ena_, data;
  table
  // ena_ data : q : q+ 
      0 1 : ? : 1 ;
      0 0 : ? : 0 ;
      1 ? : ? : - ; // - = no change
  endtable
endprimitive

primitive d_edge_ff (q, clock, data); 
  output q; reg q;
  input clock, data;
  table
  // clock data q q+
  // obtain output on rising edge of clock 
  (01) 0 : ? : 0 ;
  (01) 1 : ? : 1 ;
  (0?) 1 : 1 : 1 ;
  (0?) 0 : 0 : 0 ;
  // ignore negative edge of clock
  (?0) ? : ? : - ;
  // ignore data changes on steady clock
  ? (??) : ? : - ;
  endtable
endprimitive

module sv12_lrm_p0796_primitive_latch_q;
  wire q, clock, data;
  
  latch latch(q, clock, data);
  d_edge_ff d_edge_ff(q, clock, data);

endmodule : sv12_lrm_p0796_primitive_latch_q
